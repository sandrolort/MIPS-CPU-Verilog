module memory_master(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire gp_we,
    output wire [31:0] out,
    output reg E = 0
);

wire sram_wren;

always @(posedge clk or posedge rst) begin
	if(rst)
		E <= 0;
	else
		E <= ~E;
end

assign sram_wren = ~E && mem_wren && gp_we;

sram memory_sram (
    .address(addr_in[11:0]),
    .clock(mem_clk),
    .data(data_in),
    .wren(sram_wren),
    .q(out)
);

endmodule