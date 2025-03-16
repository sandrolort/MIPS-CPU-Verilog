module main_interrupt_tb;
    // Inputs
    reg [31:0] instruction;
    reg [31:0] ea;
    reg clk;
    reg rst = 1'b0;
    reg [22:0] ca;
    reg [31:0] pc;
    reg e;
    reg rpt;
    reg [31:0] mode_in;
    reg [31:0] next_pc;
    reg [31:0] data_in;
    reg [2:0] reg_sel;
    reg sprw;

    // Outputs
    wire [31:0] spr_out;
	wire [22:0] mca;
    wire jisr;
	wire abort;
	wire [31:0] mode;

    main_interrupt uut (
        .instruction(instruction),
        .ea(ea),
        .clk(clk),
        .rst(rst),
        .ca(ca),
        .pc(pc),
        .e(e),
        .rpt(rpt),
        .mode_in(mode_in),
        .next_pc(next_pc),
        .data_in(data_in),
        .reg_sel(reg_sel),
        .sprw(sprw),
        .spr_out(spr_out),
		.mca(mca),
        .jisr(jisr),
        .abort(abort),
        .mode(mode)
    );

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

    initial begin
        ea = 32'b0;
		ca = 23'b0;
		pc = {30'b0, 2'b11};
		e = 1'b0;
		rpt = 1'b0;
		next_pc = 32'b0;

		// Test Case 1 (ill part 2):
		instruction = {6'b010000, 26'b0};
		mode_in = 1'b1;
		#10;

		// Test Case 2 (misaf):
		instruction = 32'b0; // Avoiding previous case
		e = 1'b1;
		pc[1:0] = 2'b01;
		#10

		// Test Case 3 (misals part 1):
		e = 1'b0; // Avoiding previous case
		instruction = {6'b100011, 24'b0, 2'b01};
		ea = {30'b0, 2'b11};
		#10

		// Test Case 4 (misals part 2):
		instruction = {6'b101011, 24'b0, 2'b01};
		ea = {30'b0, 2'b10};
		#10

		// Test Case 5 (sysc):
		instruction = {6'b000000, 20'b0, 6'b001100};
		#10
		$stop;
	end

    initial begin
        $dumpfile("main_interrupt_tb.vcd");
        $dumpvars(0, main_interrupt_tb);
    end
endmodule
