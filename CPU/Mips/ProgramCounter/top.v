`timescale 1ns/1ns

module top(OpCode, Control, A, B, Address, Zero, Reset, PresentState);

input [5:0] OpCode;
input [3:0] Control;
input [31:0] A, B;
input [15:0] Address;
input Zero, Reset;

output [31:0] PresentState;

wire [31:0] Out4, OutAddress;
wire RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOp1, ALUOp2;
wire [31:0] AfterExtend, AfterShift;
wire [31:0] NextState;
wire Clk, PCSrc;

Clock CLK(.Clk(Clk));

Control Con(.OpCode(OpCode), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .ALUOp1(ALUOp1), .ALUOp2(ALUOp2));

Adder Add4(.a(A), .b(B), .sum(Out4));

SignExtend SE(.BeforeExtend(Address), .AfterExtend(AfterExtend));
ShiftLeft SL(.BeforeShift(AfterExtend), .AfterShift(AfterShift));
Adder AddAddress(.a(Out4), .b(AfterShift), .sum(OutAddress));

and #10 Beq(PCSrc, Branch, Zero);
mux2to1_32bit mux(.i0(Out4), .i1(OutAddress), .sel(PCSrc), .out(NextState));

ProgramCounter PC(.Clk(Clk), .Reset(Reset), .PresentState(PresentState), .NextState(NextState));

endmodule

