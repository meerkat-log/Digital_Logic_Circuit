module Control(OpCode, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2);

input [5:0] OpCode;
output reg RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2;

always @(*) begin
	case(OpCode)
		//R-format
		6'b000000 : begin
			RegDst <= 1'b1;
			ALUSrc <= 1'b0;
			MemtoReg <= 1'b0;
			RegWrite <= 1'b1;
			MemRead <= 1'b0;
			MemWrite <= 1'b0;
			Branch <= 1'b0;
			ALUOp1 <= 1'b1;
			ALUOp2 <= 1'b0;
		end
		// load word
		6'b100011 : begin
			RegDst <= 1'b0;
			ALUSrc <= 1'b1;
			MemtoReg <= 1'b1;
			RegWrite <= 1'b1;
			MemRead <= 1'b1;
			MemWrite <= 1'b0;
			Branch <= 1'b0;
			ALUOp1 <= 1'b0;
			ALUOp2 <= 1'b0;
		end
		//store word
		6'b101011 : begin
			RegDst <= 1'bx;
			ALUSrc <= 1'b1;
			MemtoReg <= 1'bx;
			RegWrite <= 1'b0;
			MemRead <= 1'b0;
			MemWrite <= 1'b1;
			Branch <= 1'b0;
			ALUOp1 <= 1'b0;
			ALUOp2 <= 1'b0;
		end
		//beq
		6'b000100 : begin
			RegDst <= 1'bx;
			ALUSrc <= 1'b0;
			MemtoReg <= 1'bx;
			RegWrite <= 1'b0;
			MemRead <= 1'b0;
			MemWrite <= 1'b0;
			Branch <= 1'b1;
			ALUOp1 <= 1'b0;
			ALUOp2 <= 1'b1;
		end
	endcase
end
endmodule