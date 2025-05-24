module interrupt_controller_tb;

    // Inputs
    reg [22:0] ca;
    reg [31:0] sr;

    // Outputs
	wire [22:0] mca;
    wire jisr;
    wire [4:0] il;

    // Instantiate the Unit Under Test (UUT)
    interrupt_controller uut (
        .ca(ca),
        .sr(sr),
		.mca(mca),
        .jisr(jisr),
        .il(il)
    );

    initial begin
        // Monitor outputs
        $monitor("Time: %0t | CA: %b | SR: %b | JISR: %b | IL: %d", $time, ca, sr, jisr, il);

		// 0-indexed

        // Test Case 1: No interrupts
        ca = 23'b00000000000000000000000;
        sr = 32'b00000000000000000000000000000000;
        #10;

        // Test Case 2: Masked interrupt at position 7
        ca = 23'b00000000000000010000000;
        sr = 32'b00000000000000000000000000000000;
        #10;

        // Test Case 3: Unmasked interrupt at position 21 and masked interrupt at position 1
        ca = 23'b01000000000000000000010;
        sr = 32'b00000000001000000000000000000000;
        #10;

        // Test Case 4: Multiple interrupts, highest priority at position 0
        ca = 23'b00000000000000000000011;
        sr = 32'b11111111111111111111111111111111;
        #10;

        // Test Case 5: Interrupts at positions 16 and 17, both should trigger unconditionally
        ca = 23'b00000110000000000000000;
        sr = 32'b00000000000000000000000000000000;
        #10;
    end

endmodule

