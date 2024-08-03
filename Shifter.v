module Shifter (
	input [1:0] funct,
	input [31:0] a,
	input [4:0] N,
	output reg /*wire*/ [31:0] R
);

initial begin
	R = 0;
end

// Non-wolfgang way of doing it, without srl/srlfix modules
always @(funct, a, N, R) begin
	case (funct)
		2'b00: R <= a << N;
		2'b01: R <= a >> N;
		2'b10: begin : shifterLoop
			integer num;
			R = a>>N;
			for (num = 0; num < 32; num = num + 1) begin
				if (num <= N) R[num] <= a[0];
				else R[num] = a[num-N];
			end
		end
		default: R <= 0;
	endcase
end

// Wolfgang way of doing it, with srl/srlfix modules
// wire [31:0] Rsrl;
// srl shiftrightlogical(a, N, Rsrl);

// assign R = funct == 2'b00 ? a << N :
// 		   funct == 2'b01 ? a >> N :
// 							Rsrl   ;

endmodule