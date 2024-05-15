module IEU #(parameter IN = 16,OUT = 32) (
	input U,
	input [IN-1:0] immediateIN,
	output [OUT-1:0] immediateOUT
);

wire bit_to_repeat;
wire [(OUT-IN)-1:0] concat;

assign bit_to_repeat = (U == 1'b0) ? immediateIN[IN-1] : 1'b0;
assign concat = { (OUT-IN){bit_to_repeat} };

assign immediateOUT = { concat, immediateIN };

endmodule