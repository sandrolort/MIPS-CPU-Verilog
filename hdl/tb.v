module tb();

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
    rst = 1; 
    #30;
    rst = 0;

    for (integer i = 0; i < 4096; i = i + 1)
		uut.memory.memory[i] = 32'h00000000;

    $readmemb("./programs/simple", uut.memory.memory);



    #20000;
    $finish;

end

endmodule
