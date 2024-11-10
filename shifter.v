module shifter (
	input [1:0] funct,
	input [31:0] a,
	input [4:0] n,
	output wire [31:0] r
);

wire [31:0] r_srl;
srl shiftrightlogical(a, n, r_srl);

assign r = funct == 2'b00 ? a << n :
		   funct == 2'b01 ? a >> n :
							r_srl   ;

endmodule