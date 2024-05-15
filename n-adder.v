
module adder(a,b,cin,s,cout);
parameter n = 16;
    input  [n-1:0] a;
	input [n-1:0] b;
	input cin;
    output [n-1:0] s;
	output cout;
	assign {cout,s} = a + b + cin;
endmodule