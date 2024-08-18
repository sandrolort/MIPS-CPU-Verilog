
module alu(a,b,af,i,alures,ovfalu);
parameter n = 32;
    input  [n-1:0] a;
	input [n-1:0] b;
	input [3:0] af;
	input i;
    output reg [n-1:0] alures;
	output ovfalu;
	
	wire [n-1:0] s;
	wire sub;
	wire u;
	wire ovf;
	wire neg;
	wire z;
	wire [31:0] d;
	
	
	assign d=b^{32{sub}} ;//negate b for subtraction
	assign u=af[0];//import 32 bit adder
	au #(32) add(
		.a (a),
		.b(d),
		.sub(sub),
		.s(s),
		.u(u),
		.ovf(ovf),
		.neg(neg)
	);

	assign sub=af[1];
	assign z=neg;
	assign ovfalu= ovf &~af[3]&~af[2]; // book page 96
	always @(*) begin
        if (ovf) begin 
            $display("Overflow detected with a = %b, b = %b, sub = %b", a, b, sub);
        end
    end
	


	always @ * 
	case(af)
		4'b0000,4'b0001,4'b0010,4'b0011: alures = s;
		4'b0100: alures = a & b;
		4'b0101: alures = a | b;
		4'b0110: alures = a ^ b;
		4'b0111: alures = (i ? {b[15:0], {16{1'b0}}} : ~(a | b));  
		4'b1010, 4'b1011: alures = { {31{1'b0}}, z};  
   	default: alures = 32'b0;  
	endcase
	
endmodule
