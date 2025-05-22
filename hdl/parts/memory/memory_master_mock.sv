module memory_master_mock(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mw,
    input wire mem_rren,
	input wire jisr,  // Added 
    input wire E,
    output wire [31:0] out
);

reg [31:0] memory [0:4096*2];

initial begin
	// Initialize all memory locations to 0
	for (integer i = 0; i < 4096 * 2; i = i + 1)
		memory[i] = 32'h00000000;
    
	memory[4096] = 32'b00100001001010010000000000000101; // addi 6 0 5
	memory[4097] = 32'b10101100000010010000000001100100;
	memory[4098] = 32'b10001100000010100000000001100100;

end


reg [31:0] out_reg = 0;

always @(posedge mem_clk) begin
    if (mw)
        memory[addr_in] = data_in;
    if(~E || E && mem_rren)
        out_reg = memory[addr_in];
end

assign out = out_reg;

endmodule
