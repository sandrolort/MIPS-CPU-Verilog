module memory_full (
    input wire clk,
    input wire rst,
    input wire S,
    input wire [31:0] next_pc,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    output wire [31:0] I,
    output reg [31:0] PC,
    output wire [31:0] data_out,
    output reg E
);
reg [31:0] Memory [255:0];
wire [29:0] ad;
wire wren;
assign ad = E ? addr_in : PC[31:2];
assign wren = S && E;
assign data_out = Memory[ad[4:0]];
integer i;
// Memory initialization
initial begin
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
// Reset logic and Memory write operation
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset logic
        E <= 1'b0;
        PC <= 32'b0;
    end else begin
        E <= ~E;
        if (E) PC <= next_pc;
        if (wren) Memory[ad[29:21]] <= data_in;
    end
end
// I driver
reg [31:0] I_reg;
always @(posedge clk or posedge rst) begin
    if (rst)
        I_reg <= 32'b0;
    else if (!E)
        I_reg <= Memory[ad[8:0]];
end
assign I = I_reg;
// Testing displays
always @(posedge clk) begin
    if (wren)
        #1 $display("Writing in memory..... %0d, %0d", ad, data_in);
    else
        #1 $display("Reading from memory... %0d, %0d", ad, data_out);
end
endmodule