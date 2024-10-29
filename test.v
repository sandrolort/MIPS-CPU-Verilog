// Adder module
module Adder(
    input [7:0] a,
    input [7:0] b,
    output [8:0] sum
);
    assign sum = a + b;
endmodule

// Testbench
module Adder_tb;
    reg [7:0] a, b;
    wire [8:0] sum;
    reg clk = 0, clk2 = 0;

    Adder dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Forever, invert the clock every 5 time units.
    end

	// or...

	always #20 begin // Every 20 time units...
		clk2 = ~clk2;	// Invert clock 2.
	end

	// You may remove begin/end if the block you're writing is just 1 line.
	// This applies to initial/always/if/else/etc...
	// always @(#20) clk2 = ~clk2;

    // Test scenario
    initial begin
		// Same as "println" in most programming languages. $write does the same without the newline.
        $display("Time a b sum"); 
		// monitor prints the value every time a variable changes. You only have to declare once.
        $monitor("%0t %d %d %d", $time, a, b, sum);

        // Test case 1
        a = 8'd10;
        b = 8'd20;
        #10;

        // Test case 2
        a = 8'd255;
        b = 8'd1;
        #10;

        // Test case 3
        a = 8'd128;
        b = 8'd128;
        #10;
    end
endmodule