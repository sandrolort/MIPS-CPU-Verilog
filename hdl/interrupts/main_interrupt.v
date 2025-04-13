module main_interrupt (
    input wire [31:0] instruction,
	input wire [31:0] ea,
    input wire clk,
    input wire rst,  // 1 bit 'reset' signal
	input wire [15:0] ca_part_1,
    input wire is_illegal,
	input wire ovfalu,
	input wire [31:0] pc,
    input wire e,
    // input wire [31:0] mode_in, // Only for testing
    input wire [31:0] next_pc,
	input wire [31:0] data_in,
	input wire [2:0] reg_sel,
    output wire [31:0] spr_out,
	output wire [22:0] mca,
    output wire jisr,
	output reg abort = 1'b0,
	output wire [31:0] mode
);
    // Internal wires for connecting modules
	wire [31:0] il;
    wire second_part_of_ill;
    wire ls;
    wire misaf;
    wire misals;
    wire sysc;
    wire movg2s;
	wire [31:0] sr;

	wire [22:0] ca = {ca_part_1, misaf, 1'b0, (is_illegal | second_part_of_ill), misals, 1'b0, sysc, ovfalu};

    assign movg2s = (instruction[31:26] == 6'b010000) && (instruction[25:21] == 5'b00100);

    // Instantiate updated interrupt_controller module
    interrupt_controller ic_inst (
        .ca(ca),
        .sr(sr),
		.mca(mca),
        .jisr(jisr),
        .il(il)
    );

    // Logic for illegal instruction in user mode
    assign second_part_of_ill = mode_in == 32'b1 && (instruction[31:26] == 6'b010000);  // replace 'mode' with 'mode_in' for testing

    // Logic of misalignment of fetch or load/store
    assign ls = (instruction[31:26] == 6'b100011) || (instruction[31:26] == 6'b101011);

	// Misaligned fetch in execute phase
	assign misaf = e == 1 && pc[1:0] != 2'b00;

	// Misaligned load or store
	assign misals = ls && ea[1:0] != 2'b00;

    // Logic for system call
    assign sysc = instruction[31:26] == 6'b000000 && instruction[5:0] == 6'b001100;

    always @(posedge clk, rst) begin
        if (second_part_of_ill) begin
            $display("Trying to use unauthorized instructions");
            abort = 1'b1;
			// $stop;
        end

        if (misaf) begin
            $display("Misaligned fetch");
            abort = 1'b1;
			// $stop;
        end

        if (misals) begin
            $display("Misaligned load/store");
            abort = 1'b1;
			// $stop;
        end

		if (sysc) begin
            $display("System Call");
		end

		if (rst) begin
            abort = 1'b0;
		end
    end

	wire [4:0] rt = instruction[20:16];
	wire [4:0] rd = instruction[15:11];
	wire rpt = (il[15:1] != 0) || il[17] || il[20];

    // Instantiate spr module
    spr spr_inst (
        .clk(clk),
        .jisr(jisr),
        .mca(mca),
        .rpt(rpt),
        .pc(pc),
        .next_pc(next_pc),
        .ea(ea),
		.data_in(data_in),
		.reg_sel(reg_sel),
		.sprw(movg2s),
		.spr_out(spr_out),
		.sr(sr),
		.mode(mode)  // Switch to 'mode_in' for testing
	);

endmodule
