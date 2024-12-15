module master_tb();

// Test bench signals
reg external_clk;
reg rst;
wire [31:0] debug_hex_display;
wire clock_led;

// Instantiate the master module
master uut (
    .external_clk(external_clk),
    .rst(rst),
    .debug_hex_display(debug_hex_display),
    .clock_led(clock_led)
);

// Clock generation
initial begin
    external_clk = 0;
    forever #5 external_clk = ~external_clk; // 100MHz clock
end

// Test stimulus
initial begin
    // Initialize waveform output
    
    // Initial values
    rst = 0;
    
    // Apply reset
    #10; 
    rst = 1;
    #20;
    rst = 0;
    
    // Wait for several clock cycles to observe instruction fetch and execution
    #200;
    
    // Monitor debug display
    $display("Debug Display Value: %h", debug_hex_display);
    
    // Add specific test cases here
    // Test Case 1: Check reset behavior
    if (uut.pc !== 32'h0) begin
        $display("Error: PC not reset to 0");
    end
    
    // Test Case 2: Check clock division
    #100;
    if (!clock_led) begin
        $display("Error: Clock division not working");
    end
    
    // Test Case 3: Monitor instruction fetch
    @(posedge uut.E); // Wait for fetch phase
    $display("Fetched Instruction: %h", uut.mem_out);
    
    // Test Case 4: Monitor ALU operation
    @(negedge uut.E); // Wait for execute phase
    $display("ALU Result: %h", uut.alu_res);
    
    // Test Case 5: Check register file write
    if (uut.gp_we && !uut.E) begin
        $display("Register Write Data: %h", uut.gpr_data_in);
    end
    
    // Run for additional cycles to observe behavior
    #1000;
    
    // End simulation
    $display("Testbench completed");
    $finish;
end

// Monitor important signals
always @(posedge external_clk) begin
    if (uut.E) begin
        $display("Time=%0t PC=%h Instruction=%h", 
                 $time, uut.pc, uut.mem_out);
    end
end

// Additional monitoring for debug
initial begin
    $monitor("Time=%0t rst=%b E=%b pc=%h debug_display=%h",
             $time, rst, uut.E, uut.pc, debug_hex_display);
end

endmodule

// Optional: Memory Model for testing
module memory_model (
    input wire clk,
    input wire [29:0] addr,
    input wire [31:0] data_in,
    input wire wr_en,
    output reg [31:0] data_out
);

reg [31:0] mem [0:1023]; // 1K memory

initial begin
    // Initialize memory with test program
    mem[0] = 32'h00000000; // NOP
    mem[1] = 32'h20020005; // ADDI $2, $0, 5
    mem[2] = 32'h20030003; // ADDI $3, $0, 3
    mem[3] = 32'h00430820; // ADD $1, $2, $3
end

always @(posedge clk) begin
    if (wr_en)
        mem[addr] <= data_in;
    else
        data_out <= mem[addr];
end

endmodule