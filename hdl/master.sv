module master (
    input external_clk,
    input ena,
    input rst,
    output [31:0] debug_hex_display,
    output[7:0] clock_led,
    // LPDDR2
    output wire [26:0] lpddr2_address,
    output wire [31:0] lpddr2_write_data,
    input wire [31:0] lpddr2_read_data,
    output wire lpddr2_rreq,
    output wire lpddr2_wreq,

    output wire [31:0] disk_hdin,
    input wire [31:0] disk_hdout,
    output wire [10:0] disk_hda,
    output wire disk_hd_w
);

// Clock definitions
wire clk, clk_wen, mem_clk;
assign mem_clk = external_clk;
wire abort;
wire is_illegal;
clock_div divider(mem_clk, clk_wen);

`ifdef HARDWARE
clock_control contr(
    .inclk(clk_wen),       //  altclkctrl_input.inclk
    .ena(ena && !abort && !is_illegal),             // .ena
    .outclk(clk)           // altclkctrl_output.outclk
);
`else
assign clk = (ena && !abort && !is_illegal) ? clk_wen : 0;
`endif


assign clock_led[0] = clk;
assign clock_led[1] = external_clk;
assign clock_led[2] = ena;

// Control and data signals
wire [4:0] rs, rt, rd;
wire [31:0] a_gpr, b_gpr;
wire gp_we;
wire [4:0] cad;
wire [31:0] alu_res, shift_res;
wire [31:0] mem_out;
wire [31:0] epc;
wire mem_rren;
wire mem_wren;
wire [2:0] gp_mux_sel;
wire spr_mux_sel;
wire [31:0] gpr_data_in;
wire [41:0] decoder_packed;
wire [31:0] ea;
wire ovfalu;

// Program counter
reg [31:0] pc = 0;
wire [31:0] next_pc;

// Execute bit
reg E = 0;
always @(posedge clk or posedge rst) begin
	if(rst)
		E <= 0;
	else
		E <= ~E;
end

// Instruction register
wire [31:0] instruction;

// Interrupts
wire [2:0] reg_sel;
wire [31:0] spr_out;
wire jisr;
wire eret = instruction[31:26] == 6'b010000 && instruction[5:0] == 6'b011000;
wire [31:0] temp_pc = eret ? epc : next_pc;
wire [15:0] ca_part_1 = {rst, 15'b0};
wire mode;

main_interrupt interrupts(
	.instruction(instruction),
	.ea(ea),
	.clk(clk),
	.rst(rst),
	.ca_part_1(ca_part_1),
	.is_illegal(is_illegal),
	.ovfalu(ovfalu),
	.pc(pc),
	.e(E),
	.next_pc(next_pc),
    .data_in(b_gpr),
	.reg_sel(spr_mux_sel ? rt : rd),
    .spr_out(spr_out),
	.mca(mca),
	.jisr(jisr),
	.abort(abort),
    .epc(epc),
	.mode(mode)
);


always @(posedge clk or posedge rst) begin
    if (rst) begin
        pc <= 32'b0;
    end else if (jisr) begin
        pc <= 32'b0;  // Jump to interrupt vector
    end else if (E) begin  // Only update PC during execute phase
        pc <= temp_pc;
    end
    // else maintain current PC value
end

// Instruction register
reg [31:0] instruction_reg = 0;
always @(posedge mem_clk) begin
    if (~E)
        instruction_reg <= mem_out;
end

assign instruction = instruction_reg;

`ifdef HARDWARE
// Memory stage with E signal
memory_master memory(
    .clk(clk),
    .mem_clk(mem_clk),
    .rst(rst),
    .addr_in(~E ? pc[31:2] : alu_res[31:2]),
    .data_in(b_gpr),
    .mem_rren(mem_rren),
    .mem_wren(mem_wren),
    .gp_we(gp_we),
	.jisr(jisr),  // Added
    .out(mem_out),
    .E(E),
    // LPDDR2 Memory
    .address(lpddr2_address),
    .write_data(lpddr2_write_data),
    .read_data(lpddr2_read_data),
    .read_req(lpddr2_rreq),
    .write_req(lpddr2_wreq),

    // Disk Memory
    .disk_hdin(disk_hdin),
    .disk_hdout(disk_hdout),
    .disk_hda(disk_hda),
    .disk_hd_w(disk_hd_w)
);
`else
memory_master_mock memory(
    .clk(clk),
    .mem_clk(mem_clk),
    .rst(rst),
    .addr_in(~E ? pc[31:2] : alu_res[31:2]),
    .data_in(b_gpr),
    .mem_rren(mem_rren),
    .mem_wren(mem_wren),
    .gp_we(gp_we),
	.jisr(jisr),  // Added
    .out(mem_out),
    .E(E)
);
`endif

// Decode stage
decode_master decode(
    .a_gpr(a_gpr),
    .b_gpr(b_gpr),
    .pc(pc),
    .i_fetch(instruction),
    .next_pc(next_pc),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .decoder_packed(decoder_packed),
	.is_illegal(is_illegal)
);

decoder_deconcat defcon(
    .packed_in(decoder_packed),
    .gp_we(gp_we),
    .mem_wren(mem_wren),
    .mem_rren(mem_rren),
    .gp_mux_sel(gp_mux_sel),
    .spr_mux_sel(spr_mux_sel),
    .cad(cad),
	// Add missing ports
    .af(), .i(), .alu_mux_sel(), .shift_type(),
    .bf(), .pc_mux_select(), .rs(), .rt(), .rd()
);

// Execute stage
execute_master execute(
    .decoder_packed(decoder_packed),
    .a_decoder(a_gpr),
    .b_decoder(b_gpr),
    .i_decoder(instruction),
    .pc(pc),
    .alu_res(alu_res),
    .shift_res(shift_res),
	.ea(ea),
	.ovfalu(ovfalu)  // This was missing
);

// Writeback stage
writeback_master writeback(
    .memory_out(mem_out),
    .alu_res(alu_res),
    .shift_res(shift_res),
    .gp_mux_sel(gp_mux_sel),
    .gpr_data_in(gpr_data_in),
    .spr_in(spr_out),
	.link_addr(pc+32'd4)
);

// General purpose register file
gpr genreg(
    .clk(clk),
    .rst(rst),
    .we(gp_we & E),  // Only write during execute phase
    .rs(rs),
    .rt(rt),
    .wa(cad),
    .rd1(a_gpr),
    .rd2(b_gpr),
    .wd(gpr_data_in),
    .register_out(debug_hex_display)
);

endmodule