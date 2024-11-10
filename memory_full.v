module memory_full (
    input wire clk,
    input wire memory_clk,
    input wire rst,
    input wire S,
    input wire [31:0] next_pc,
    input wire [29:0] addr_in/*synthesis keep*/,
    input wire [31:0] data_in,
    output reg [31:0] I,
    output reg [31:0] PC = 0,
    output wire [31:0] data_out/*synthesis keep*/,
    output reg E = 1/*synthesis keep*/,
    // LPDDR2 Memory
    output wire [26:0] address,
    output wire [31:0] write_data,
    input wire [31:0] read_data,
    output wire read_req,
    output wire write_req
);
wire is_lpddr2_used = (~E ? addr_in[11:0] : PC[13:2]) > {11{1'b1}};

wire [11:0] sram_address;
wire [31:0] sram_q;
wire sram_wren;

assign sram_address = ~E ? addr_in[11:0] : PC[13:2];
assign sram_wren = S && ~E && ~is_lpddr2_used;
assign data_out = is_lpddr2_used ? read_data : sram_q;

assign address = (~E ? addr_in[11:0] : PC[13:2])-{11{1'b1}};
assign write_req = S && ~E && is_lpddr2_used;
assign read_req = is_lpddr2_used && ~write_req;
assign write_data = data_in;

SRAM memory_sram (
    .address(sram_address),
    .clock(memory_clk),
    .data(data_in),
    .wren(sram_wren && !rst),
    .q(sram_q)
);

// Reset logic and Memory write operation
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset logic
        E = 1'b1;
        PC = 32'b0;
        I = 32'b0;
    end else begin
        E = ~E;
        if (E) PC = next_pc;
        if (!E) I = sram_q;
    end
end

endmodule