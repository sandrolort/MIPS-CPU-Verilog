module memory_master(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire gp_we,
    output wire [31:0] out,
    output reg E = 0,
    // LPDDR2 Memory
    output wire [26:0] address,
    output wire [31:0] write_data,
    input wire [31:0] read_data,
    output wire read_req,
    output wire write_req
);

wire is_lpddr2_used = addr_in > {11{1'b1}} /* synthesis keep */;
assign out = is_lpddr2_used ? read_data : sram_q;

wire sram_wren = ~E && mem_wren && !is_lpddr2_used;
wire [31:0] sram_q;

always @(posedge clk or posedge rst) begin
	if(rst)
		E <= 0;
	else
		E <= ~E;
end

sram memory_sram (
    .address(addr_in[11:0]),
    .clock(mem_clk),
    .data(data_in),
    .wren(sram_wren),
    .q(sram_q)
);

// LPDDR2
assign address = addr_in - {11{1'b1}};
assign write_req = ~E && mem_wren && is_lpddr2_used;
assign read_req = is_lpddr2_used && ~write_req;
assign write_data = data_in;

endmodule