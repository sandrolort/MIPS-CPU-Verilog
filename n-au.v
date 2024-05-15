module au #(parameter n = 32)(	
	input [n-1:0] a,
	input [n-1:0] b,
	input sub,
	input u,
    output wire [n-1:0] s,
	output wire neg,
	output ovf);
    
	wire [n-1:0] d;
	wire lcin; // last carry in
	wire cout;
	
	assign d=b^{32{sub}}; //negate b for subtraction
	
	//import 32 bit adder
	adder #(32) add(
	.a (a),
	.b(d),
	.cin(sub),
	.s(s),
	.cout(cout)
	);
	assign lcin = s[n-1]^a[n-1]^d[n-1] ;// proof: adder operand bits mod 2
	
	assign neg = (~u & (a[n-1] ^d[n-1] ^cout)) | (u&~cout & sub); // lemma 39
	
	assign ovf = u & (cout ^ lcin); // lemma 40
endmodule