module main_interrupt_tb;
    // Inputs
    reg [31:0] instruction;
    reg clk;
    reg [22:0] ca;
	reg [31:0] sr;
	reg [31:0] esr;
    reg [31:0] pc;
    reg e;
    reg eret;
    reg rpt;
    reg [31:0] next_pc;
    reg mode;

    // Outputs
    wire [31:0] sr_out;
    wire [31:0] esr_out;
    wire [31:0] eca_out;
    wire [31:0] epc_out;
    wire [31:0] edata_out;
    wire [31:0] pto;
    wire [31:0] ptl;
    wire mode_out;
    wire jisr;

    main_interrupt uut (
        .instruction(instruction),
        .clk(clk),
        .ca(ca),
		.sr(sr), // added
		.esr(esr), // added
        .pc(pc),
        .e(e),
        .eret(eret),
        .rpt(rpt),
        .next_pc(next_pc),
        .mode(mode),
        .sr_out(sr_out), // added
        .esr_out(esr_out), // added 
        .eca_out(eca_out), // added 
        .epc_out(epc_out), // added
        .edata_out(edata_out), // added
        .pto(pto),
        .ptl(ptl),
        .mode_out(mode_out),
        .jisr(jisr)
    );

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

    initial begin
		ca = 23'b0;
		pc = {30'b0, 2'b11};
		e = 1'b0;
		eret = 1'b0; // ?
		rpt = 1'b0;
		next_pc = 32'b0;
	
		// Test Case 1(ill part 2):
		instruction = {6'b010000, 26'b0};
		mode = 1'b1;
		#10;	

		// Test Case 2(misaf):
		instruction = 32'b0; // Avoiding previous case
		e = 1'b1;
		pc[1:0] = 2'b01;
		#10

		// Test Case 3(misals part 1):
		e = 1'b0; // Avoiding previous case
		instruction = {6'b100011, 24'b0, 2'b01};
		#10

		// Test Case 4(misals part 2):
		instruction = {6'b101011, 24'b0, 2'b01};
		#10

		// Test Case 5(sysc):
		instruction = {6'b000000, 20'b0, 6'b001100};
		$stop;
	end

    // Optional: Waveform dumping
    initial begin
        $dumpfile("main_interrupt_tb.vcd");
        $dumpvars(0, main_interrupt_tb);
    end
endmodule
