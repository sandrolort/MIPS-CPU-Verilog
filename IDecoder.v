module IDecoder(
	// ALU
	input [31:0] instruction, // Input instruction to be decoded
	output [3:0] Af, // 4-bit control signal for ALU operation
	output I, // 1-bit signal indicating whether the second operand is immediate
	output ALU_MUX_SEL, // 1-bit multiplexer select signal for choosing between immediate and register operand General Purpose Registers (GPR)
	output [4:0] Cad, // 5-bit long signal determining the address of the register to store the result
	output GP_WE, // 1-bit long signal for enabling write to general purpose registers
	output [1:0] GP_MUX_SEL, // 2-bit long multiplexer select signal for choosing the data source for register write Branch Condition Evaluation (BCE)
	output [3:0] Bf, // 4-bit long control signal determining the condition to be tested by BCE Memory
	output DM_WE,
	output [2:0] Shift_type,
	output [1:0] PC_MUX_Select // 2-bit long multiplexer select signal for choosing the next instruction address
);

wire [5:0] opc /*synthesis keep*/, fun /*synthesis keep*/;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] iindex;

//Introducing a splitter module that divides all the instruction information
//Lets us keep the project cleaner and easier to understand.
Splitter splt(
	instruction,
	opc, fun,
	rs, rt, rd, sa,
	imm,
	iindex
);

assign Af = I ? {(~instruction[28] & instruction[27]), instruction[28:26]} : instruction[3:0];

wire [1:0] ttype;
assign ttype = Type(opc);

assign I = ttype != 2'b10;
assign ALU_MUX_SEL = ttype != 2'b10;

assign Cad = I ? rt : rd;
assign GP_WE = isWritten(opc, fun);
assign GP_MUX_SEL = whereFrom(ttype, opc, fun);

assign Bf = {instruction[28:26],instruction[16]};
										 
assign DM_WE = opc == 6'b101011; //save word (sw) instruction

assign Shift_type = Af == 000000 ? {ttype != 2'b10,2'b00} : //sll
					Af == 000010 ? {ttype != 2'b10,2'b01} : //srl
								   {ttype != 2'b10,2'b10} ; //sra

assign PC_MUX_Select = PC_Select(opc, fun);

function [1:0] Type(input [5:0] instruction);
	casez (instruction)
		6'b001???, 6'b1???11, 6'b0001??, 6'b000001:	Type = 2'b00;//I-Type
		6'b00001?:									Type = 2'b01;//J-Type
		default:									Type = 2'b10;//R-type
	endcase
endfunction

function [0:0] isWritten(input [5:0] opc, input [5:0] fun);
	casez(opc)
		6'b001???, 6'b100011:	isWritten = 1'b1;
		6'b000000:				isWritten = fun != 6'b001000 && fun!=6'b001000;
		default:				isWritten = 1'b0;
	endcase
endfunction

function [1:0] whereFrom(input [2:0]ttype, input [5:0] opc, input [3:0]fun);
	case(ttype)
		// 2'b10: if(fun==6'b001001) whereFrom = 2'b11; 										//PC
		// 		 else if(fun==6'b000010 || fun==6'b000011) whereFrom = 2'b10; 					//Shifter
		// 		 else whereFrom = 2'b00;														//ALU
		2'b10: casez(fun)
			6'b001001: 							whereFrom = 2'b11;
			6'b000010, 6'b000011: 				whereFrom = 2'b10;
			default: 							whereFrom = 2'b00;
		endcase
		2'b00: if(opc == 6'b100011) whereFrom = 2'b01; 										//Memory
				 else casez (opc)
						6'b001???: whereFrom = 2'b00; 											//ALU
						default: whereFrom = 2'b11;												//PC
				 endcase
		default: whereFrom = 2'b11;
	endcase
endfunction

function [1:0] PC_Select(input [5:0] opc, input [5:0] fun);
	casez(opc)
		6'b000000:					PC_Select = (fun == 6'b001000 || fun == 6'b001001) ? 2'b00 : 2'b11;	//Jr/Jalr
		6'b0001??, 6'b000001:		PC_Select = 2'b01;													//Branch
		6'b00001?:					PC_Select = 2'b10;													//J/Jal
		default:					PC_Select = 2'b11;
	endcase
endfunction

endmodule