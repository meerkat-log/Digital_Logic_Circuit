`timescale 1ns/1ns

module top();

reg [5:0] OpCode;
reg [31:0] A, B;
reg [15:0] Address;
reg [3:0] Control;
reg Reset, Zero;

wire [31:0] Out4, OutAddress;
wire RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2;
wire [31:0] AfterExtend, AfterShift;
wire [31:0] PresentState, NextState;
wire Clk, PCSrc;

Clock CLK(.Clk(Clk));

Control Con(.OpCode(OpCode), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .ALUOp1(ALUOp1), .ALUOp2(ALUOp2));

ALU Add4(.A(A), .B(B), .Control(Control), .Out(Out4));

SignExtend SE(.BeforeExtend(Address), .AfterExtend(AfterExtend));
ShiftLeft SL(.BeforeShift(AfterExtend), .AfterShift(AfterShift));
ALU AddAddress(.A(Out4), .B(AfterShift), .Control(Control), .Out(OutAddress));

and Beq(PCSrc, Branch, Zero);
mux2to1_32bit mux(.i0(Out4), .i1(OutAddress), .sel(PCSrc), .out(NextState));

ProgramCounter PC(.Clk(Clk), .Reset(Reset), .PresentState(PresentState), .NextState(NextState));

initial begin
	OpCode <= 6'b000100;
	Control <= 4'b0010;
	A <= 32'h0000_0000;
	B <= 32'h0000_0004;
	Address <= 16'h4321;
	Zero <= 0;
	Reset <= 0;
	#50;
	OpCode <= 6'b000100;
	Control <= 4'b0010;
	A <= 32'h0000_0000;
	B <= 32'h0000_0004;
	Address <= 16'h1234;
	Zero <= 1;
	Reset <= 0;

end



endmodule
