module memory_full_tb();

// Parameters
parameter CLK_PERIOD = 10; // 10ns clock period

// Inputs
reg clk;
reg rst;
reg S;
reg [31:0] next_pc;
reg [29:0] addr_in;
reg [31:0] data_in;

// Outputs
wire [31:0] I;
wire [31:0] PC;
wire [31:0] data_out;
wire E;

// Instantiate the Unit Under Test (UUT)
memory_full uut (
    .clk(clk),
    .rst(rst),
    .S(S),
    .next_pc(next_pc),
    .addr_in(addr_in),
    .data_in(data_in),
    .I(I),
    .PC(PC),
    .data_out(data_out),
    .E(E)
);

// Clock generation
always begin
    #(CLK_PERIOD/2) clk = ~clk;
end

// Test case counter
integer test_case;

// Test procedure
initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    S = 0;
    next_pc = 32'h00000000;
    addr_in = 30'h00000000;
    data_in = 32'h00000000;
    test_case = 0;

    // Reset
    #(CLK_PERIOD*2);
    rst = 0;
    #(CLK_PERIOD);

    $display("Test Case | Operation | Inputs | Outputs | Expected | Pass/Fail");
    $display("----------|-----------|---------|---------|-----------|---------");

    // Test case 1: Read initial memory content
    test_case = 1;
    next_pc = 32'h00000004;
    #(CLK_PERIOD*2);
    $display("Read initial");
    check_outputs(32'h00000004, 32'h24040006, 1'b0);

    // Test case 2: Write to memory
    test_case = 2;
    S = 1;
    addr_in = 30'h00000008;
    data_in = 32'hAABBCCDD;
    #(CLK_PERIOD*2);
    $display("Write");
    check_outputs(32'h00000008, 32'hAABBCCDD, 1'b1);

    // Test case 3: Read the written data
    test_case = 3;
    S = 0;
    next_pc = 32'h00000020;
    #(CLK_PERIOD*2);
    $display("Read written");
    check_outputs(32'h00000020, 32'hAABBCCDD, 1'b0);

    // Test case 4: Check PC increment
    test_case = 4;
    next_pc = 32'h00000024;
    #(CLK_PERIOD*2);
    $display("PC increment");
    check_outputs(32'h00000024, 32'h00000000, 1'b0);

    // Test case 5: Reset
    test_case = 5;
    rst = 1;
    #(CLK_PERIOD);
    rst = 0;
    #(CLK_PERIOD);
    $display("Reset");
    check_outputs(32'h00000000, 32'h24040006, 1'b0);

    // End simulation
    #(CLK_PERIOD*2);
    $display("Simulation completed.");
    $stop;
end

// Task to check outputs and display results
task check_outputs;
    input [31:0] expected_pc;
    input [31:0] expected_data;
    input expected_e;
    begin
        #1; // Small delay to allow for signal propagation
        $display("Test %d   | %-9s | PC=%h, data=%h, E=%b | PC=%h, data=%h, E=%b | PC=%h, data=%h, E=%b",
            test_case, next_pc, data_in, S, PC, data_out, E,
            expected_pc, expected_data, expected_e,
            ((PC === expected_pc) && (data_out === expected_data) && (E === expected_e)) ? "Pass" : "Fail");
    end
endtask

endmodule