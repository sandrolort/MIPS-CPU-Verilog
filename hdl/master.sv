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
    output wire lpddr2_wreq
);

// Clock definitions
wire clk, clk_wen, mem_clk;
wire E;  // E signal from memory stage
assign mem_clk = external_clk;
clock_div divider(mem_clk, clk_wen);

`ifdef HARDWARE
clock_control contr(
    .inclk(clk_wen),       //  altclkctrl_input.inclk
    .ena(ena),             //                  .ena
    .outclk(clk)           // altclkctrl_output.outclk
);
`else
assign clk = ena ? clk_wen : 0;
`endif


assign clock_led[0] = clk;
assign clock_led[1] = external_clk;
assign clock_led[2] = ena;

// Control and data signals
wire [4:0] ra1, ra2;
wire [31:0] a_gpr, b_gpr;
wire gp_we;
wire [4:0] cad;
wire [31:0] alu_res, shift_res;
wire [31:0] mem_out;
wire mem_rren;
wire mem_wren;
wire [1:0] gp_mux_sel;
wire [31:0] gpr_data_in;
wire [39:0] decoder_packed;

// Program counter
reg [31:0] pc = 0;
wire [31:0] next_pc;

// Instruction register
wire [31:0] instruction;

always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= 32'h0;
    else if (E)
        pc <= next_pc;
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
    .addr_in(~E ? pc[31:2] : alu_res),
    .data_in(b_gpr),
    .mem_rren(mem_rren),
    .mem_wren(mem_wren),
    .gp_we(gp_we),
    .out(mem_out),
    .E(E),
    // LPDDR2 Memory
    .address(lpddr2_address),
    .write_data(lpddr2_write_data),
    .read_data(lpddr2_read_data),
    .read_req(lpddr2_rreq),
    .write_req(lpddr2_wreq)
);
`else
memory_master_mock memory(
    .clk(clk),
    .mem_clk(mem_clk),
    .rst(rst),
    .addr_in(~E ? pc[31:2] : alu_res),
    .data_in(b_gpr),
    .mem_rren(mem_rren),
    .mem_wren(mem_wren),
    .gp_we(gp_we),
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
    .rs(ra1),
    .rt(ra2),
    .decoder_packed(decoder_packed)
);

decoder_deconcat defcon(
    .packed_in(decoder_packed),
    .gp_we(gp_we),
    .mem_wren(mem_wren),
    .mem_rren(mem_rren),
    .gp_mux_sel(gp_mux_sel),
    .cad(cad)
);

// Execute stage
execute_master execute(
    .decoder_packed(decoder_packed),
    .a_decoder(a_gpr),
    .b_decoder(b_gpr),
    .i_decoder(instruction),
    .pc(pc),
    .alu_res(alu_res),
    .shift_res(shift_res)
);

// Writeback stage
writeback_master writeback(
    .memory_out(mem_out),
    .alu_res(alu_res),
    .shift_res(shift_res),
    .gp_mux_sel(gp_mux_sel),
    .gpr_data_in(gpr_data_in),
    .link_addr(pc+32'd4)
);

// General purpose register file
gpr genreg(
    .clk(clk),
    .rst(rst),
    .we(gp_we & E),  // Only write during execute phase
    .ra1(ra1),
    .ra2(ra2),
    .wa(cad),
    .rd1(a_gpr),
    .rd2(b_gpr),
    .wd(gpr_data_in),
    .register_out(debug_hex_display)
);

endmodule