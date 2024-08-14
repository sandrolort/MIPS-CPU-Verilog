
module srlfix #(parameter i = 16)(
	input  [31:0] a,
	input  s,
	output wire [31:0] res
);

assign res = s == 1'b1 ? ({{i{1'b0}}, a[31:i]}) : a;

endmodule