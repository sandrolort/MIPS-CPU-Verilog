module spr_tb;

    // Inputs
    reg clk;
    reg jisr;
    reg [31:0] esr;
    reg [31:0] sr;
    reg [22:0] mca;
    reg rpt;
    reg [31:0] pc;
    reg [31:0] next_pc;
    reg [31:0] ea;
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

    // Instantiate the Unit Under Test (UUT)
    spr uut (
        .clk(clk),
        .jisr(jisr),
        .esr(esr),
        .sr(sr),
        .mca(mca),
        .rpt(rpt),
        .pc(pc),
        .next_pc(next_pc),
        .ea(ea),
        .mode(mode),
        .sr_out(sr_out),
        .esr_out(esr_out),
        .eca_out(eca_out),
        .epc_out(epc_out),
        .edata_out(edata_out),
        .pto(pto),
        .ptl(ptl),
        .mode_out(mode_out)
    );
	
	initial begin
		clk = 1;
	end
	
    // Test sequence
    initial begin
        // Initialize inputs
        jisr = 0;
        esr = 32'b0;
        sr = 32'b0;
        mca = 23'b0;
        rpt = 0;
        pc = 32'b0;
        next_pc = 32'b0;
        ea = 32'b0;
        mode = 0;

        // Example 1: No interrupt, rpt = 0
        #10;
        jisr = 1'b0;
        esr = 32'b11001100110011001100110011001100;
        sr = 32'b10101010101010101010101010101010;
        mca = 23'b11010101010101010101010;
        rpt = 1'b0;
        pc = 32'b00001111000011110000111100001111;
        next_pc = 32'b00000000111111110000000011111111;
        ea = 32'b00000000000000001111111111111111;
        mode = 1'b1;
        #5;

        // Example 2: Interrupt occurs, rpt = 1
        #5;
        jisr = 1'b1;
        esr = 32'b00000000111111110000000011111111;
        sr = 32'b11110000111100001111000011110000;
        mca = 23'b11010101010101010101010;
        rpt = 1'b1;
        pc = 32'b11110000111100001111000011110000;
        next_pc = 32'b11111111000000001111111100000000;
        ea = 32'b00001111000011111111000011110000;
        mode = 1'b0;
        #5;

        // Example 3: No interrupt, rpt = 1
        #5;
        jisr = 1'b0;
        esr = 32'b00110011001100110011001100110011;
        sr = 32'b01010101010101010101010101010101;
        mca = 23'b000001111000011110000;
        rpt = 1'b1;
        pc = 32'b10101010101010101010101010101010;
        next_pc = 32'b01010101010101010101010101010101;
        ea = 32'b11111111000000001111111100000000;
        mode = 1'b1;
        #5;

        // End simulation
        #10;
    end

endmodule
