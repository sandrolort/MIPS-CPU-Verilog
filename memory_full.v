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
    output reg E = 1/*synthesis keep*/
);

wire [11:0] sram_address;
wire [31:0] sram_q;
wire sram_wren;

assign sram_address = ~E ? addr_in[11:0] : PC[13:2];
assign sram_wren = S && ~E;
assign data_out = sram_q;

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
        E = 1'b0;
        PC = 32'b0;
        I = 32'b0;
    end else begin
        E = ~E;
        if (E) PC = next_pc;
        if (!E) I = sram_q;
    end
end

endmodule