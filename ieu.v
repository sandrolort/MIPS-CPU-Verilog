module ieu #(parameter in = 16,out = 32) (
    input u,
    input [in-1:0] immediate_in,
    output [out-1:0] immediate_out
);

wire bit_to_repeat;
wire [(out-in)-1:0] concat;

assign bit_to_repeat = (u == 1'b0) ? immediate_in[in-1] : 1'b0;
assign concat = { (out-in){bit_to_repeat} };
assign immediate_out = { concat, immediate_in };

endmodule