module ALU(
	input i,
	input [31:0] SrcA, SrcB,
	input [3:0] af,
	input [5:0] opcode,
	output reg [31:0] Alures,
	output reg outputregovfalu
);

always @ (SrcA, SrcB, af, i, opcode) begin
	//I-Type
	if (i) case (opcode)
		6'b001001: Alures <= SrcA + SrcB;
		6'b001000: Alures <= $unsigned($signed(SrcA) + $signed(SrcB));
		6'b001011: Alures <= (SrcA < SrcB) ? {32{1'b1}} : {32{1'b0}};
		6'b001010: Alures <= ($signed(SrcA) < $signed(SrcB)) ? {32{1'b1}} : {32{1'b0}};
		6'b001100: Alures <= SrcA && SrcB;
		6'b001101: Alures <= SrcA || SrcB;
		6'b001110: Alures <= ~(SrcA || SrcB);
		6'b001111: Alures <= {SrcB[15:0],{16{1'b0}}};
		6'b100011, 6'b101011: Alures <= SrcB + SrcA;
		default: Alures <= 31'b0;
	endcase
	//R-Type
	else case(af)
		4'b0001: Alures <= SrcA + SrcB;										// addu
		4'b0000: Alures <= $unsigned($signed(SrcA) + $signed(SrcB)); 		// add
		4'b0011: Alures <= SrcA - SrcB; 									// subu
		4'b0010: Alures <= $unsigned($signed(SrcA) - $signed(SrcB)); 		// sub
		4'b0100: Alures <= SrcA & SrcB; 									// and
		4'b0101: Alures <= SrcA | SrcB; 									// or
		4'b0110: Alures <= SrcA ^ SrcB; 									// xor
		4'b0111: Alures <= ~(SrcA || SrcB); 								// nor
		4'b1011: Alures <= (SrcA < SrcB) ? {32{1'b1}} : {32{1'b0}}; 		// sltu
		4'b1010: Alures <= ($signed(SrcA) < $signed(SrcB)) ? {32{1'b1}} : {32{1'b0}}; // slt
		default: Alures <= 31'b0;
	endcase
	case (af)
		4'b0000: outputregovfalu <= (Alures < SrcA) || (Alures < SrcB); // add
		4'b0010: outputregovfalu <= (Alures > SrcA); // sub
		default: outputregovfalu <= 0;
	endcase
end
endmodule