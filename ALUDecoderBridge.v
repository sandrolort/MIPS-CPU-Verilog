module ALUDecoderBridge #(parameter  n=32) (
    input [5:0] opcode,
    input [n-1:0] a,
	input [n-1:0] b,
	input [3:0] af,
	input i,
    output [n-1:0] result,
	output ovfalu
);

wire [3:0] afAlu;

assign afAlu =  ~i ? af :
                opcode == 6'b001001 ? 4'b0001 :
                opcode == 6'b001000 ? 4'b0000 :
                opcode == 6'b001011 ? 4'b1011 :
                opcode == 6'b001010 ? 4'b1010 :
                opcode == 6'b001100 ? 4'b0100 :
                opcode == 6'b001101 ? 4'b0101 :
                opcode == 6'b001110 ? 4'b0111 :
                opcode == 6'b001111 ? 4'b0111 :
                opcode == 6'b100011 ? 4'b0001 :
                opcode == 6'b101011 ? 4'b0001 :
                4'b1111; // forcing alu to fall back to default.

alu #(n) ula (a,b,afAlu,i,result,ovfalu);
    
endmodule