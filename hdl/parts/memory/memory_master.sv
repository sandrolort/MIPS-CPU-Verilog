module memory_master(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire mem_rren,
    output wire [31:0] out,
    input wire E,
    // LPDDR2 Memory
    output wire [26:0] address,
    output wire [31:0] write_data,
    input wire [31:0] read_data,
    output wire read_req,
    output wire write_req,
    // SD
    output wire [31:0] sd_write_data,
    input wire [31:0] sd_read_data,
    output wire [10:0] sd_addr,
    output wire sd_wren
);

wire [31:0] sram_q;

wire is_lpddr2_used = addr_in > {11{1'b1}} /* synthesis keep */;
wire is_sd_used     = addr_in > {10{1'b1}} /* synthesis keep */;

wire sram_wren = E && mem_wren && !is_lpddr2_used && !is_sd_used;

assign out = is_lpddr2_used ? read_data    :
             is_sd_used     ? sd_read_data :
             sram_q;


sram memory_sram (
    .address(addr_in[10:0]),
    .clock(mem_clk),
    .data(data_in),
    .wren(sram_wren),
    .q(sram_q)
);

// LPDDR2
assign address = addr_in;
assign write_req = E && mem_wren && is_lpddr2_used;
assign read_req = is_lpddr2_used && ~write_req && (E && mem_rren || ~E);
assign write_data = data_in;

// SD
assign sd_addr = addr_in[10:0];
assign sd_write_data = data_in;
assign sd_wren = E && mem_wren && !is_lpddr2_used && is_sd_used;

endmodule