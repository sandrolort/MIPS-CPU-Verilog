module Shifter (
	input [1:0] funct,
	input [31:0] a,
	input [4:0] N,
	output /*reg*/ wire [31:0] R
);

wire [31:0] Rsrl;
srl shiftrightlogical(a, N, Rsrl);

assign R = funct == 2'b00 ? a << N :
		   funct == 2'b01 ? a >> N :
							Rsrl   ;

endmodule