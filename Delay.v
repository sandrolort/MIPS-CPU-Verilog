module Delay #(parameter Bits = 32)
(
	input clk,
	input [Bits-1:0] in,
	output reg [Bits-1:0] out
);

always @(posedge clk) out = in;

endmodule