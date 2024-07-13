module srl(a,b,res);

    input  [31:0] a;
	input  [4:0] b;
    output [31:0] res;
	
	wire [31:0] res0,res1,res2,res3;
	
	srlfix #(1) s0 (
	.a(a),
	.s(b[0]),
	.res(res0)
	);
	
	srlfix #(2) s1 (
	.a(res0),
	.s(b[1]),
	.res(res1)
	);
	
	srlfix #(4) s2 (
	.a(res1),
	.s(b[2]),
	.res(res2)
	)
	;
	srlfix #(8) s3 (
	.a(res2),
	.s(b[3]),
	.res(res3)
	)
	;
	srlfix #(16) s4 (
	.a(res3),
	.s(b[4]),
	.res(res)
	)
	;
	
endmodule