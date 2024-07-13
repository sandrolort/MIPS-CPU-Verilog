
module srlfix(a,s,res);
parameter i = 16;
    input  [31:0] a;
	input  s;
    output reg [31:0] res;

always @(*) begin
if (s==1'b1) begin

 res=	({{i{1'b0}}, a[31:i]});
end
else begin
 res=a;
end
	
	end

	
	
	
	
endmodule