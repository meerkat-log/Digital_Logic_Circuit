`timescale 1ns/1ns

module TestBench();
/*
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
*/
/*
reg CLR, J, K;
wire CLK;
wire Q, Qbar;
Clock CLOCK(.CLK(CLK));
JK_FlipFlop JKFF(.CLK(CLK), .Clear(CLR), .J(J), .K(K), .Q(Q), .Qbar(Qbar));

initial begin
	J = 1'b0;
	K = 1'b0;
	CLR = 1'b0;
	force JKFF.Y = 1'b0;
	force Q = 1'b0;
	force Qbar = 1'b1;
	#40 release JKFF.Y;
	release Q;
	release Qbar;
	#460;
	J = 1'b1;
	K = 1'b0;
	#500;
	J = 1'b0;
	K = 1'b1;
	#500;
	J = 1'b1;
	K = 1'b1;
	#400;
	CLR = 1'b1;
end
*/

wire CLK;
wire [63:0] Out;

Clock CLOCK(.CLK(CLK));
Multiplier MUL(.CLK(CLK), .A(32'h0000007F), .B(32'h00000070), .Out(Out));


endmodule

