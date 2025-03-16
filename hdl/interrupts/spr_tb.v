module spr_tb;

    // Inputs
    reg clk;
    reg jisr;
    reg [22:0] mca;
    reg rpt;
    reg [31:0] pc;
    reg [31:0] next_pc;
    reg [31:0] ea;
	reg [31:0] data_in;
	reg [2:0] reg_sel;
	reg sprw;

	// Output
	wire [31:0] spr_out;

    // Instantiate the Unit Under Test (UUT)
    spr uut (
        .clk(clk),
        .jisr(jisr),
        .mca(mca),
        .rpt(rpt),
        .pc(pc),
        .next_pc(next_pc),
        .ea(ea),
		.data_in(data_in),
		.reg_sel(reg_sel),
		.sprw(sprw),
		.spr_out(spr_out)
	);

	initial begin
		clk = 0;
	end

	always
	#2 clk = ~clk;


    // Test sequence
    initial begin
        // Initialize inputs
        jisr = 0;
        mca = 23'b0;
        rpt = 0;
        pc = 32'b0;
        next_pc = 32'b0;
        ea = 32'b0;
		data_in = 32'b0;
		reg_sel = 3'b110;
		sprw = 1;

        // Example 1: No interrupt, rpt = 0
        #10;
        jisr = 1'b0;
        reg_sel = 3'b001;
        data_in = 32'b11001100110011001100110011001100;
        #5;
        reg_sel = 3'b0;
        data_in = 32'b10101010101010101010101010101010;
        mca = 23'b11010101010101010101010;
        rpt = 1'b0;
        pc = 32'b00001111000011110000111100001111;
        next_pc = 32'b00000000111111110000000011111111;
        ea = 32'b00000000000000001111111111111111;
        #5;

        // Example 2: Interrupt occurs, rpt = 1
        #5;
        jisr = 1'b1;
        reg_sel = 3'b001;
        data_in = 32'b00000000111111110000000011111111;
        #5;
        reg_sel = 3'b0;
        data_in = 32'b11110000111100001111000011110000;
        mca = 23'b11010101010101010101010;
        rpt = 1'b1;
        pc = 32'b11110000111100001111000011110000;
        next_pc = 32'b11111111000000001111111100000000;
        ea = 32'b00001111000011111111000011110000;
        #5;

        // Example 3: No interrupt, rpt = 1
        #5;
        jisr = 1'b0;
        reg_sel = 3'b001;
        data_in = 32'b00110011001100110011001100110011;
        #5;
        reg_sel = 3'b0;
        data_in = 32'b01010101010101010101010101010101;
        mca = 23'b000001111000011110000;
        rpt = 1'b1;
        pc = 32'b10101010101010101010101010101010;
        next_pc = 32'b01010101010101010101010101010101;
        ea = 32'b11111111000000001111111100000000;
        #5;

        // End simulation
        #10;
    end

endmodule
