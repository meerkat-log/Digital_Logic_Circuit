`timescale 1ns/1ns

module tb();

reg [31:0] A, B;
reg [1:0] ALUOp;
reg [5:0] InstructionOp;

wire [31:0] High, Low;
wire ZeroFlag;

Top TOP(.A(A), .B(B), .ALUOp(ALUOp), .InstructionOp(InstructionOp), .High(High), .Low(Low), .ZeroFlag(ZeroFlag));

initial begin
	A <= 32'h87654321;
	B <= 32'h12345678;
	ALUOp <= 2'b00;
	#200;
	ALUOp <= 2'b01;
	#1000;
	ALUOp <= 2'b10;
	InstructionOp <= 6'b100100;
	#1000;
	InstructionOp <= 6'b100101;
	#1000;
	InstructionOp <= 6'b100000;
	#1000;
	InstructionOp <= 6'b100010;
	#1000;
	InstructionOp <= 6'b100001;
	#1000;
	InstructionOp <= 6'b100011;
	#1000;
	InstructionOp <= 6'b101010;
end

endmodule