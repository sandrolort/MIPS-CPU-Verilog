module alu_tb();
// Parameters
parameter n = 32;
// Inputs
reg [n-1:0] a;
reg [n-1:0] b;
reg [3:0] af;
reg i;
// Outputs
wire [n-1:0] alures;
wire ovfalu;
// Expected outputs
reg [n-1:0] expected_alures;
reg expected_ovfalu;

// Instantiate the Unit Under Test (UUT)
alu #(n) uut (
    .a(a),
    .b(b),
    .af(af),
    .i(i),
    .alures(alures),
    .ovfalu(ovfalu)
);

// Test cases
initial begin
    // Initialize inputs
    a = 0; b = 0; af = 0; i = 0;
    expected_alures = 0; expected_ovfalu = 0;
    
    $display("Test Case | Operation | Inputs | Expected Output | Actual Output | Pass/Fail");
    $display("-----------|-----------|---------|--------------------|---------------|----------");

    // Test case 1: Addition
    #10 a = 32'h0000_00A5; b = 32'h0000_005A; af = 4'b0000; i = 0;
    expected_alures = 32'h0000_00FF; expected_ovfalu = 0;
    #1 $display("Test 1    | Addition  | %h + %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 2: Subtraction
    #10 a = 32'h0000_00A5; b = 32'h0000_005A; af = 4'b0010; i = 0;
    expected_alures = 32'h0000_004B; expected_ovfalu = 0;
    #1 $display("Test 2    | Subtract  | %h - %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 3: AND operation
    #10 a = 32'hAAAA_AAAA; b = 32'h5555_5555; af = 4'b0100; i = 0;
    expected_alures = 32'h0000_0000; expected_ovfalu = 0;
    #1 $display("Test 3    | AND       | %h & %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 4: OR operation
    #10 a = 32'hAAAA_AAAA; b = 32'h5555_5555; af = 4'b0101; i = 0;
    expected_alures = 32'hFFFF_FFFF; expected_ovfalu = 0;
    #1 $display("Test 4    | OR        | %h | %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 5: XOR operation
    #10 a = 32'hAAAA_AAAA; b = 32'h5555_5555; af = 4'b0110; i = 0;
    expected_alures = 32'hFFFF_FFFF; expected_ovfalu = 0;
    #1 $display("Test 5    | XOR       | %h ^ %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 6: Special operation (i = 0)
    #10 a = 32'hAAAA_AAAA; b = 32'h5555_5555; af = 4'b0111; i = 0;
    expected_alures = 32'h0000_0000; expected_ovfalu = 0;
    #1 $display("Test 6    | Special   | ~(%h | %h) | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 7: Special operation (i = 1)
    #10 a = 32'hAAAA_AAAA; b = 32'h5555_5555; af = 4'b0111; i = 1;
    expected_alures = 32'h5555_0000; expected_ovfalu = 0;
    #1 $display("Test 7    | Special   | {%h[15:0], 16'b0} | %h, %b | %h, %b | %s", 
        b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 8: Negative flag
    #10 a = 32'h0000_0001; b = 32'h0000_0002; af = 4'b1010; i = 0;
    expected_alures = 32'hFFFF_FFFF; expected_ovfalu = 0;
    #1 $display("Test 8    | Negative  | %h, %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // Test case 9: Overflow test
    #10 a = 32'h7FFF_FFFF; b = 32'h0000_0001; af = 4'b0000; i = 0;
    expected_alures = 32'h8000_0000; expected_ovfalu = 1;
    #1 $display("Test 9    | Overflow  | %h + %h | %h, %b | %h, %b | %s", 
        a, b, expected_alures, expected_ovfalu, alures, ovfalu, 
        (alures == expected_alures && ovfalu == expected_ovfalu) ? "Pass" : "Fail");

    // End simulation
    #10 $finish;
end
endmodule