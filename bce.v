
module bce(a,b,bf,bcres);
    input  [31:0] a;
	input  [31:0] b;
	input [3:0] bf;
    output bcres;
	wire [31:0] d;
	wire eq, lt,le;
	
	assign d= (bf[3]&~bf[2]?b:{32{1'b0}});
	assign eq = (a==d);
	assign lt= a[31];
	assign le= lt | (a=={32{1'b0}}); // simplified from book
	assign bcres = (~bf[3] & ~bf[2] & bf[1] & (bf[0] ^ lt)) |
                (bf[3] & ~bf[2] & (bf[1] ^ eq)) |
                (bf[3] & bf[2] & (bf[1] ^ le));
endmodule