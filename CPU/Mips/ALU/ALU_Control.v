module ALU_Control(ALUOp, InstructionOp, ALUControlInput);

input [1:0] ALUOp;
input [5:0] InstructionOp;
output reg [3:0] ALUControlInput;

always @(*) begin
	case(ALUOp)
		//Load Word OR Store Word
		2'b00 : ALUControlInput <= 4'b0010;
		
		//Branch Equal
		2'b01 : ALUControlInput <= 4'b0110;
		
		//R-type
		2'b10 : begin
			case(InstructionOp)
				//add
				6'b100000 : ALUControlInput <= 4'b0010;
				
				//sub
				6'b100010 : ALUControlInput <= 4'b0110;
				
				//AND
				6'b100100 : ALUControlInput <= 4'b0000;
				
				//OR
				6'b100101 : ALUControlInput <= 4'b0001;
				
				//set_on_less_than
				6'b101010 : ALUControlInput <= 4'b0111;
				
				//mul
				6'b100001 : ALUControlInput <= 4'b0011;
				
				//div
				6'b100011 : ALUControlInput <= 4'b0100;
			endcase
		end
	endcase

end

endmodule

