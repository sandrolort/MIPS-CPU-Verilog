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
    #5 external_clk = 0;
    forever #5 external_clk = ~external_clk;
end

initial begin
    // Initial values
    rst = 0;
    
    // Apply reset
    #10; 
    rst = 1;
    #20;
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