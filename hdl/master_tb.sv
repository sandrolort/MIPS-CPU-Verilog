module master_tb();

// Test bench signals
reg external_clk;
reg rst;
wire [31:0] debug_hex_display;
wire clock_led;

// Instantiate the master module
master uut (
    .external_clk(external_clk),
    .ena(1),
    .rst(rst),
    .debug_hex_display(debug_hex_display),
    .clock_led(clock_led)
);

initial begin
    external_clk = 0;
    forever #5 external_clk = ~external_clk;
end

initial begin
    // Apply reset
    rst = 1; 
    #30;
    rst = 0;
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
