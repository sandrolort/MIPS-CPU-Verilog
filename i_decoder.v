module i_decoder(
    input [31:0] instruction, 	// Input instruction to be decoded
    output [3:0] af, 			// 4-bit control signal for ALU operation
    output i,					// 1-bit signal indicating whether the second operand is immediate
    output alu_mux_sel, 		// 1-bit multiplexer select signal for choosing between immediate and register operand General Purpose Registers (GPR)
    output [4:0] cad, 			// 5-bit long signal determining the address of the register to store the result
    output gp_we, 				// 1-bit long signal for enabling write to general purpose registers
    output [1:0] gp_mux_sel, 	// 2-bit long multiplexer select signal for choosing the data source for register write Branch Condition Evaluation (BCE)
    output [3:0] bf, 			// 4-bit long control signal determining the condition to be tested by BCE Memory
    output dm_we,				// Memory Write Enable
    output [2:0] shift_type,
    output [1:0] pc_mux_select // 2-bit long multiplexer select signal for choosing the next instruction address
);

wire [5:0] opc, fun;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] i_index;

//Introducing a splitter module that divides all the instruction information
//Lets us keep the project cleaner and easier to understand.
splitter splt(
	instruction,
	opc, fun,
	rs, rt, rd, sa,
	imm,
	i_index
);

assign af = i ? {(~instruction[28] & instruction[27]), instruction[28:26]} : instruction[3:0];

wire [1:0] ttype;
assign ttype = type(opc);
assign i = ttype != 2'b10;
assign alu_mux_sel = ttype != 2'b10;
assign cad = i ? rt : rd;
assign gp_we = is_written(opc, fun);
assign gp_mux_sel = where_from(ttype, opc, fun);

// bf (c) = opc(c)[2 : 0] ◦ rt(c)[0] = I(c)[28 : 26]I[16].
assign bf = {instruction[28:26],instruction[16]};
assign dm_we = opc == 6'b101011; //save word (sw) instruction
assign shift_type = af == 000000 ? {ttype != 2'b10,2'b00} : //sll
					af == 000010 ? {ttype != 2'b10,2'b01} : //srl
					{ttype != 2'b10,2'b10} ; //sra
assign pc_mux_select = pc_select(opc, fun);

function [1:0] type(input [5:0] instruction);
	casez (instruction)
		6'b001???, 6'b1???11, 6'b0001??, 6'b000001: type = 2'b00;//I-Type
		6'b00001?: type = 2'b01;//J-Type
		default: type = 2'b10;//R-type
	endcase
endfunction

function [0:0] is_written(input [5:0] opc, input [5:0] fun);
	casez(opc)
		6'b001???, 6'b100011: is_written = 1'b1;
		6'b000000: is_written = fun != 6'b001000 && fun!=6'b001000;
		default: is_written = 1'b0;
	endcase
endfunction

function [1:0] where_from(input [2:0]ttype, input [5:0] opc, input [5:0]fun);
	case(ttype)
		// 2'b10: if(fun==6'b001001) where_from = 2'b11; //PC
		// else if(fun==6'b000010 || fun==6'b000011) where_from = 2'b10; //Shifter
		// else where_from = 2'b00; //ALU
		2'b10: casez(fun)
			6'b001001: where_from = 2'b11;
			6'b000010, 6'b000011: where_from = 2'b10;
			default: where_from = 2'b00;
		endcase
		2'b00: if(opc == 6'b100011) where_from = 2'b01; //Memory
		else casez (opc)
			6'b001???: where_from = 2'b00; //ALU
			default: where_from = 2'b11; //PC
		endcase
		default: where_from = 2'b11;
	endcase
endfunction

function [1:0] pc_select(input [5:0] opc, input [5:0] fun);
	casez(opc)
		6'b000000: pc_select = (fun == 6'b001000 || fun == 6'b001001) ? 2'b00 : 2'b11; //Jr/Jalr
		6'b0001??, 6'b000001: pc_select = 2'b01; //Branch
		6'b00001?: pc_select = 2'b10; //J/Jal
		default: pc_select = 2'b11;
	endcase
endfunction

endmodule