`timescale 1ns/1ns

module Multiplier(CLK, A, B, Out);

input CLK;
input [31:0] A, B;
output [63:0] Out;

integer i;

reg [1:0] Mode;
wire [32:0] BZero;
wire [63:0] Tmp = 0;

assign AExtPos = {{32{A[31]}},A};

assign BZero = {B,1'b0};

Mux4to1_64bit MUX0(.I1(1'b0), .I2(1'b1), .Sel(BZero[1:0]), .Out(Sign));
AdderAndSubtractor ADDorSUB(.A(Tmp), .B(AExtPos), .Cin(Sign), .Out(Tmp));
ShiftRegister_64bit SRA(.CLK(CLK), .Mode(Mode), .In(AExtPos), .Out(AExtPos));
ShiftRegister_32bit SRB(.CLK(CLK), .Mode(Mode), .In(BZero), .Out(BZero));

initial begin
	for(i = 0; i < 32; i = i + 1) begin
		Mode = 2'b11;
		#100;
		Mode = 2'b10;
		#100;
	end
end
endmodule
		

/*
AdderAndSubtractor Neg_A(.A(32'h00000000), .B(A), .Cin(1'b1), .Out(ANeg));
Mux32to1_32bit MUX(.I0(32'h00000000), .I1(AExtPos1), .I2(AExtPos1), .I3(AExtPos2), .I4(AExtPos2), .I5(AExtPos3), .I6(AExtPos3), .I7(AExtPos4), .I8(AExtPos4), .I9(AExtPos5), .I10(AExtPos5), 
		   .I11(AExtPos6), .I12(AExtPos6), .I13(AExtPos7), .I14(AExtPos7), .I15(AExtPos8), .I16(AExtNeg8), .I17(AExtNeg7), .I18(AExtNeg7), .I19(AExtNeg6), .I20(AExtNeg6), 
		   .I21(AExtNeg5), .I22(AExtNeg5), .I23(AExtNeg4), .I24(AExtNeg4), .I25(AExtNeg3), .I26(AExtNeg3), .I27(AExtNeg2), .I28(AExtNeg2), .I29(AExtNeg1), .I30(AExtNeg1), .I31(32'h00000000), .Sel(BZero[4:0]), .Out(AdderIn));

ShiftRegister_64bit A2_POS(.CLK(CLK), .Mode(Mode1), .In(AExtPos1), .Out(AExtPos2));
ShiftRegister_64bit A4_POS(.CLK(CLK), .Mode(Mode2), .In(AExtPos1), .Out(AExtPos4));
ShiftRegister_64bit A8_POS(.CLK(CLK), .Mode(Mode3), .In(AExtPos1), .Out(AExtPos8));

ShiftRegister_64bit A2_NEG(.CLK(CLK), .Mode(Mode1), .In(AExtNeg1), .Out(AExtNeg2));
ShiftRegister_64bit A4_NEG(.CLK(CLK), .Mode(Mode2), .In(AExtNeg1), .Out(AExtNeg4));
ShiftRegister_64bit A8_NEG(.CLK(CLK), .Mode(Mode3), .In(AExtNeg1), .Out(AExtNeg8));

AdderAndSubtractor A3_POS(.A(AExtPos2), .B(AExtPos1), .Cin(1'b0), .Out(AExtPos3));
AdderAndSubtractor A5_POS(.A(AExtPos4), .B(AExtPos1), .Cin(1'b0), .Out(AExtPos5));
AdderAndSubtractor A6_POS(.A(AExtPos4), .B(AExtPos2), .Cin(1'b0), .Out(AExtPos6));
AdderAndSubtractor A7_POS(.A(AExtPos8), .B(AExtPos1), .Cin(1'b1), .Out(AExtPos7));

AdderAndSubtractor A3_NEG(.A(AExtNeg2), .B(AExtNeg1), .Cin(1'b0), .Out(AExtNeg3));
AdderAndSubtractor A5_NEG(.A(AExtNeg4), .B(AExtNeg1), .Cin(1'b0), .Out(AExtNeg5));
AdderAndSubtractor A6_NEG(.A(AExtNeg4), .B(AExtNeg2), .Cin(1'b0), .Out(AExtNeg6));
AdderAndSubtractor A7_NEG(.A(AExtNeg8), .B(AExtNeg1), .Cin(1'b1), .Out(AExtNeg7));

ShiftRegister SHIFT_A_POS(.CLK(CLK), .Mode(ModeA), .In(AExtPos1), .Out(AExtPos1));
ShiftRegister SHIFT_A_NEG(.CLK(CLK), .Mode(ModeA), .In(AExtNeg1), .Out(AExtNeg1));
ShiftRegister SHIFT_B(.CLK(CLK), .Mode(ModeB), .In(BZero), .Out(BZero));


AdderAndSubtractor MULOUT(.A(Tmp), .B(AdderIn), .Cin(1'b0), .Out(Tmp));

initial begin
	Tmp <= 64'h0000000000000000;
	for(i = 0; i < 8; i = i + 1) begin
		ModeA <= 2'b11;
		ModeB <= 2'b11;
		Mode1 <= 2'b11;	
		Mode2 <= 2'b11;
		Mode3 <= 2'b11;
		#50;
		ModeA <= 2'b10;
		ModeB <= 2'b01;
		Mode1 <= 2'b10;	
		Mode2 <= 2'b10;
		Mode3 <= 2'b10;
		#200;
		Mode1 <= 2'b00;	
		#200;
		Mode2 <= 2'b00;	
		#200;
		Mode3 <= 2'b00;
		#200;
		ModeA <= 2'b00;
		ModeB <= 2'b00;
	end
end

assign Out = Tmp;
*/