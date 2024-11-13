// sample code
// 00100100000001000000000000000110  # addi $4, $0, 6
// 00100100000000010000000000000000  # addi $1, $0, 0
// 00100100000000100000000000000000  # addi $2, $0, 0
// 00100100001000010000000000000001  # addi $1, $1, 1
// 00000000010000010001000000100001  # addu $2, $2, $1
// 00010100001001001111111111111110  # bne  $1, $4, -2
// 00000000010000000010100000100001  # addu $5, $2, $0
// 00000000000000000000000000000000  # nop

module memory_full (
    input wire clk,
    input wire memory_clk,
    input wire rst,
    input wire S,
    input wire [31:0] next_pc,
    input wire [29:0] addr_in/*synthesis keep*/,
    input wire [31:0] data_in,
    input wire jisr,
    input wire eret,
    input wire [31:0] epc,
    output reg [31:0] I,
    output reg [31:0] PC = 0,
    output wire [31:0] data_out/*synthesis keep*/,
    output reg E = 1/*synthesis keep*/
);

reg [31:0] Memory [255:0];
wire [29:0] ad;
wire wren;
assign ad = ~E ? addr_in : PC[31:2];
assign wren = S && ~E;
assign data_out = Memory[ad[4:0]];
integer i;
// Memory initialization
initial begin
    PC = 0;
    E = 1;
    Memory[0] <= 32'b00100100000001000000000000000110;
	Memory[1] <= 32'b00100100000000010000000000000000;
	Memory[2] <= 32'b00100100000000100000000000000000;
	Memory[3] <= 32'b00100100001000010000000000000001;
	Memory[4] <= 32'b00000000010000010001000000100001;
	Memory[5] <= 32'b00010100001001001111111111111110;
	Memory[6] <= 32'b00000000010000000010100000100001;
	Memory[7] <= 32'b00000000000000000000000000000000;
   
    for (i = 7; i < 64 ; i=i+1) begin
        Memory[i] = 32'b0;
    end
end

always @(posedge clk or posedge rst or posedge jisr) begin
    if (rst) begin
        // Reset logic
        E = 1'b0;
        PC = 32'b0;
        I = 32'b0;
    end else begin
        E = jisr ? 1'b0 : ~E;
        if (E) PC = (jisr ? 32'b0 : (eret ? epc : next_pc));
        if (!E) I = sram_q;
    end
end

endmodule
