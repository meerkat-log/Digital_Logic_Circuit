`timescale 1ns/1ns

module JK_FlipFlop(CLK, Clear, J, K, Q, Qbar);

input CLK, Clear, J, K;
output Q, Qbar;

wire CLKbar, SMaster, RMaster, Y, Ybar, SSlave, RSlave;

NOT1 NOTCLK(.A(CLK), .Out(CLKbar));

NAND3 SMOut(.A(CLK), .B(J), .C(Qbar), .Out(SMaster));
NAND3 RMOut(.A(CLK), .B(K), .C(Q), .Out(RMaster));
NAND2 YOut(.A(SMaster), .B(Ybar), .Out(Y));
NAND2 YbarOut(.A(RMaster), .B(Y), .Out(Ybar));

NAND2 SSOut(.A(Y), .B(CLKbar), .Out(SSlave));
NAND2 RSOut(.A(Ybar), .B(CLKbar), .Out(RSlave));
NAND2 QOut(.A(SSlave), .B(Qbar), .Out(Q));
NAND2 QbarOut(.A(RSlave), .B(Q), .Out(Qbar));

endmodule

module Counter(CLK, Clear, Out);

input CLK, Clear;
output [2:0] Out;

wire NotA, JKFF1in, JKFF2in;

JK_FlipFlop JKFF0(.CLK(CLK), .Clear(Clear), .J(1'b1), .K(1'b1), .Q(Out[0]));

NOT1 NOTA(.A(Out[2]), .Out(NotA));
AND2 JKFF1IN(.A(NotA), .B(Out[0]), .Out(JKFF1in));
JK_FlipFlop JKFF1(.CLK(CLK), .Clear(Clear), .J(JKFF1in), .K(Out[0]), .Q(Out[1]));

AND2 JKFF2IN(.A(Out[1]), .B(Out[0]), .Out(JKFF2in));
JK_FlipFlop JKFF2(.CLK(CLK), .Clear(Clear), .J(JKFF2in), .K(Out[0]), .Q(Out[2]));

endmodule

module Multiplier_Control(CLK, BZero, AMode, BMode);

input CLK;
input [4:0] BZero;
output [1:0] AMode, BMode;

wire [2:0] BCount;

Mux8to1_2bit MUX_B(.I0(2'b11), .I1(2'b01), .I2(2'b01), .I3(2'b01), .I4(2'b01), .I5(2'b00), .Sel(BCount), .Out(BMode));
Counter BCOUNTER(.CLK(CLK), .Clear(Clear), .Out(BCount));

endmodule

module Multiplier(CLK, A, B, Out);

input CLK;
input [31:0] A, B;
output [63:0] Out;

wire [32:0] BZero;
wire [63:0] pp[7:0];
wire [63:0] AExtPos[7:0];
wire [63:0] AExtNeg[7:0];
wire [63:0] Pos3[7:0];
wire [63:0] Pos5[7:0];
wire [63:0] Pos6[7:0];
wire [63:0] Pos7[7:0];
wire [63:0] Neg3[7:0];
wire [63:0] Neg5[7:0];
wire [63:0] Neg6[7:0];
wire [63:0] Neg7[7:0];
wire [63:0] Tmp[3:0];
wire [63:0] Tmp_0, Tmp_1;

assign AExtPos[0] = {{32{A[31]}},A};
assign BZero = {B,1'b0};

AdderAndSubtractor_64bit AEXTNEG(.A(64'H0000000000000000), .B(AExtPos[0]), .Cin(1'b1), .Out(AExtNeg[0]));

assign AExtPos[1] = {AExtPos[0][59:0], 4'H0};
assign AExtPos[2] = {AExtPos[0][55:0], 8'H00};
assign AExtPos[3] = {AExtPos[0][51:0], 12'H000};
assign AExtPos[4] = {AExtPos[0][47:0], 16'H0000};
assign AExtPos[5] = {AExtPos[0][43:0], 20'H00000};
assign AExtPos[6]= {AExtPos[0][39:0], 24'H000000};
assign AExtPos[7] = {AExtPos[0][35:0], 28'b0000000};
assign AExtNeg[1] = {AExtNeg[0][59:0], 4'H0};
assign AExtNeg[2] = {AExtNeg[0][55:0], 8'H00};
assign AExtNeg[3] = {AExtNeg[0][51:0], 12'H000};
assign AExtNeg[4] = {AExtNeg[0][47:0], 16'H0000};
assign AExtNeg[5] = {AExtNeg[0][43:0], 20'H00000};
assign AExtNeg[6] = {AExtNeg[0][39:0], 24'H000000};
assign AExtNeg[7] = {AExtNeg[0][35:0], 28'b0000000};

genvar i, j, k, l;
generate
	for(i = 0; i < 8; i = i + 1) begin
		AdderAndSubtractor_64bit POS3(.A({AExtPos[i][62:0], 1'b0}), .B(AExtPos[i]), .Cin(1'b0), .Out(Pos3[i]));
		AdderAndSubtractor_64bit POS5(.A({AExtPos[i][61:0], 2'b00}), .B(AExtPos[i]), .Cin(1'b0), .Out(Pos5[i]));
		AdderAndSubtractor_64bit POS6(.A({AExtPos[i][61:0], 2'b00}), .B({AExtPos[i][62:0], 1'b0}), .Cin(1'b0), .Out(Pos6[i]));
		AdderAndSubtractor_64bit POS7(.A({AExtPos[i][60:0], 3'b000}), .B(AExtNeg[i]), .Cin(1'b0), .Out(Pos7[i]));

		AdderAndSubtractor_64bit NEG3(.A({AExtNeg[i][62:0], 1'b0}), .B(AExtNeg[i]), .Cin(1'b0), .Out(Neg3[i]));
		AdderAndSubtractor_64bit NEG5(.A({AExtNeg[i][61:0], 2'b00}), .B(AExtNeg[i]), .Cin(1'b0), .Out(Neg5[i]));
		AdderAndSubtractor_64bit NEG6(.A({AExtNeg[i][61:0], 2'b00}), .B({AExtNeg[i][62:0], 1'b0}), .Cin(1'b0), .Out(Neg6[i]));
		AdderAndSubtractor_64bit NEG7(.A({AExtNeg[i][60:0], 3'b000}), .B(AExtPos[i]), .Cin(1'b0), .Out(Neg7[i]));
	end
endgenerate

Mux32to1_64bit MUX0(.I0(64'H0000000000000000), .I1(AExtPos[0]), .I2(AExtPos[0]), .I3({AExtPos[0][62:0], 1'b0}), .I4({AExtPos[0][62:0], 1'b0}), .I5(Pos3[0]), .I6(Pos3[0]), .I7({AExtPos[0][61:0], 2'b00}), 
		   .I8({AExtPos[0][61:0], 2'b00}), .I9(Pos5[0]), .I10(Pos5[0]), .I11(Pos6[0]), .I12(Pos6[0]), .I13(Pos7[0]), .I14(Pos7[0]), .I15({AExtPos[0][60:0], 3'b000}), 
		   .I16({AExtNeg[0][60:0], 3'b000}), .I17(Neg7[0]), .I18(Neg7[0]), .I19(Neg6[0]), .I20(Neg6[0]), .I21(Neg5[0]), .I22(Neg5[0]), .I23({AExtNeg[0][61:0], 2'b00}), 
		   .I24({AExtNeg[0][61:0], 2'b00}), .I25(Neg3[0]), .I26(Neg3[0]), .I27({AExtNeg[0][62:0], 1'b0}), .I28({AExtNeg[0][62:0], 1'b0}), .I29(AExtNeg[0]), .I30(AExtNeg[0]), .I31(64'H0000000000000000), 
		   .Sel(BZero[4:0]), .Out(pp[0]));

Mux32to1_64bit MUX1(.I0(64'H0000000000000000), .I1(AExtPos[1]), .I2(AExtPos[1]), .I3({AExtPos[1][62:0], 1'b0}), .I4({AExtPos[1][62:0], 1'b0}), .I5(Pos3[1]), .I6(Pos3[1]), .I7({AExtPos[1][61:0], 2'b00}), 
		   .I8({AExtPos[1][61:0], 2'b00}), .I9(Pos5[1]), .I10(Pos5[1]), .I11(Pos6[1]), .I12(Pos6[1]), .I13(Pos7[1]), .I14(Pos7[1]), .I15({AExtPos[1][60:0], 3'b000}), 
		   .I16({AExtNeg[1][60:0], 3'b000}), .I17(Neg7[1]), .I18(Neg7[1]), .I19(Neg6[1]), .I20(Neg6[1]), .I21(Neg5[1]), .I22(Neg5[1]), .I23({AExtNeg[1][61:0], 2'b00}), 
		   .I24({AExtNeg[1][61:0], 2'b00}), .I25(Neg3[1]), .I26(Neg3[1]), .I27({AExtNeg[1][62:0], 1'b0}), .I28({AExtNeg[1][62:0], 1'b0}), .I29(AExtNeg[1]), .I30(AExtNeg[1]), .I31(64'H0000000000000000), 
		   .Sel(BZero[8:4]), .Out(pp[1]));

Mux32to1_64bit MUX2(.I0(64'H0000000000000000), .I1(AExtPos[2]), .I2(AExtPos[2]), .I3({AExtPos[2][62:0], 1'b0}), .I4({AExtPos[2][62:0], 1'b0}), .I5(Pos3[2]), .I6(Pos3[0]), .I7({AExtPos[2][61:0], 2'b00}), 
		   .I8({AExtPos[0][61:0], 2'b00}), .I9(Pos5[2]), .I10(Pos5[2]), .I11(Pos6[2]), .I12(Pos6[2]), .I13(Pos7[2]), .I14(Pos7[2]), .I15({AExtPos[2][60:0], 3'b000}), 
		   .I16({AExtNeg[0][60:0], 3'b000}), .I17(Neg7[2]), .I18(Neg7[2]), .I19(Neg6[2]), .I20(Neg6[2]), .I21(Neg5[2]), .I22(Neg5[2]), .I23({AExtNeg[2][61:0], 2'b00}), 
		   .I24({AExtNeg[0][61:0], 2'b00}), .I25(Neg3[2]), .I26(Neg3[2]), .I27({AExtNeg[2][62:0], 1'b0}), .I28({AExtNeg[2][62:0], 1'b0}), .I29(AExtNeg[2]), .I30(AExtNeg[2]), .I31(64'H0000000000000000), 
		   .Sel(BZero[12:8]), .Out(pp[2]));

Mux32to1_64bit MUX3(.I0(64'H0000000000000000), .I1(AExtPos[3]), .I2(AExtPos[3]), .I3({AExtPos[3][62:0], 1'b0}), .I4({AExtPos[3][62:0], 1'b0}), .I5(Pos3[3]), .I6(Pos3[3]), .I7({AExtPos[3][61:0], 2'b00}), 
		   .I8({AExtPos[0][61:0], 2'b00}), .I9(Pos5[3]), .I10(Pos5[3]), .I11(Pos6[3]), .I12(Pos6[3]), .I13(Pos7[3]), .I14(Pos7[3]), .I15({AExtPos[3][60:0], 3'b000}), 
		   .I16({AExtNeg[0][60:0], 3'b000}), .I17(Neg7[3]), .I18(Neg7[3]), .I19(Neg6[3]), .I20(Neg6[3]), .I21(Neg5[3]), .I22(Neg5[3]), .I23({AExtNeg[3][61:0], 2'b00}), 
		   .I24({AExtNeg[0][61:0], 2'b00}), .I25(Neg3[3]), .I26(Neg3[3]), .I27({AExtNeg[3][62:0], 1'b0}), .I28({AExtNeg[3][62:0], 1'b0}), .I29(AExtNeg[3]), .I30(AExtNeg[3]), .I31(64'H0000000000000000), 
		   .Sel(BZero[16:12]), .Out(pp[3]));

Mux32to1_64bit MUX4(.I0(64'H0000000000000000), .I1(AExtPos[4]), .I2(AExtPos[4]), .I3({AExtPos[4][62:0], 1'b0}), .I4({AExtPos[4][62:0], 1'b0}), .I5(Pos3[4]), .I6(Pos3[4]), .I7({AExtPos[4][61:0], 2'b00}), 
		   .I8({AExtPos[4][61:0], 2'b00}), .I9(Pos5[4]), .I10(Pos5[4]), .I11(Pos6[4]), .I12(Pos6[4]), .I13(Pos7[4]), .I14(Pos7[4]), .I15({AExtPos[4][60:0], 3'b000}), 
		   .I16({AExtNeg[4][60:0], 3'b000}), .I17(Neg7[4]), .I18(Neg7[4]), .I19(Neg6[4]), .I20(Neg6[4]), .I21(Neg5[4]), .I22(Neg5[4]), .I23({AExtNeg[4][61:0], 2'b00}), 
		   .I24({AExtNeg[4][61:0], 2'b00}), .I25(Neg3[4]), .I26(Neg3[4]), .I27({AExtNeg[4][62:0], 1'b0}), .I28({AExtNeg[4][62:0], 1'b0}), .I29(AExtNeg[4]), .I30(AExtNeg[4]), .I31(64'H0000000000000000), 
		   .Sel(BZero[20:16]), .Out(pp[4]));

Mux32to1_64bit MUX5(.I0(64'H0000000000000000), .I1(AExtPos[5]), .I2(AExtPos[5]), .I3({AExtPos[5][62:0], 1'b0}), .I4({AExtPos[5][62:0], 1'b0}), .I5(Pos3[5]), .I6(Pos3[0]), .I7({AExtPos[5][61:0], 2'b00}), 
		   .I8({AExtPos[5][61:0], 2'b00}), .I9(Pos5[5]), .I10(Pos5[5]), .I11(Pos6[5]), .I12(Pos6[5]), .I13(Pos7[5]), .I14(Pos7[5]), .I15({AExtPos[5][60:0], 3'b000}), 
		   .I16({AExtNeg[5][60:0], 3'b000}), .I17(Neg7[5]), .I18(Neg7[5]), .I19(Neg6[5]), .I20(Neg6[5]), .I21(Neg5[5]), .I22(Neg5[5]), .I23({AExtNeg[5][61:0], 2'b00}), 
		   .I24({AExtNeg[5][61:0], 2'b00}), .I25(Neg3[5]), .I26(Neg3[5]), .I27({AExtNeg[5][62:0], 1'b0}), .I28({AExtNeg[5][62:0], 1'b0}), .I29(AExtNeg[5]), .I30(AExtNeg[5]), .I31(64'H0000000000000000), 
		   .Sel(BZero[24:20]), .Out(pp[5]));

Mux32to1_64bit MUX6(.I0(64'H0000000000000000), .I1(AExtPos[6]), .I2(AExtPos[6]), .I3({AExtPos[6][62:0], 1'b0}), .I4({AExtPos[6][62:0], 1'b0}), .I5(Pos3[6]), .I6(Pos3[6]), .I7({AExtPos[6][61:0], 2'b00}), 
		   .I8({AExtPos[6][61:0], 2'b00}), .I9(Pos5[6]), .I10(Pos5[6]), .I11(Pos6[6]), .I12(Pos6[6]), .I13(Pos7[6]), .I14(Pos7[6]), .I15({AExtPos[6][60:0], 3'b000}), 
		   .I16({AExtNeg[6][60:0], 3'b000}), .I17(Neg7[6]), .I18(Neg7[6]), .I19(Neg6[6]), .I20(Neg6[6]), .I21(Neg5[6]), .I22(Neg5[6]), .I23({AExtNeg[6][61:0], 2'b00}), 
		   .I24({AExtNeg[6][61:0], 2'b00}), .I25(Neg3[6]), .I26(Neg3[6]), .I27({AExtNeg[6][62:0], 1'b0}), .I28({AExtNeg[6][62:0], 1'b0}), .I29(AExtNeg[6]), .I30(AExtNeg[6]), .I31(64'H0000000000000000), 
		   .Sel(BZero[28:24]), .Out(pp[6]));

Mux32to1_64bit MUX7(.I0(64'H0000000000000000), .I1(AExtPos[7]), .I2(AExtPos[7]), .I3({AExtPos[7][62:0], 1'b0}), .I4({AExtPos[7][62:0], 1'b0}), .I5(Pos3[7]), .I6(Pos3[7]), .I7({AExtPos[7][61:0], 2'b00}), 
		   .I8({AExtPos[7][61:0], 2'b00}), .I9(Pos5[7]), .I10(Pos5[7]), .I11(Pos6[7]), .I12(Pos6[7]), .I13(Pos7[7]), .I14(Pos7[7]), .I15({AExtPos[7][60:0], 3'b000}), 
		   .I16({AExtNeg[7][60:0], 3'b000}), .I17(Neg7[7]), .I18(Neg7[7]), .I19(Neg6[7]), .I20(Neg6[7]), .I21(Neg5[7]), .I22(Neg5[7]), .I23({AExtNeg[7][61:0], 2'b00}), 
		   .I24({AExtNeg[7][61:0], 2'b00}), .I25(Neg3[7]), .I26(Neg3[7]), .I27({AExtNeg[7][62:0], 1'b0}), .I28({AExtNeg[7][62:0], 1'b0}), .I29(AExtNeg[7]), .I30(AExtNeg[7]), .I31(64'H0000000000000000), 
		   .Sel(BZero[32:28]), .Out(pp[7]));


AdderAndSubtractor_64bit TMP0(.A(pp[0]), .B(pp[1]), .Cin(1'b0), .Out(Tmp[0]));
AdderAndSubtractor_64bit TMP1(.A(pp[2]), .B(pp[3]), .Cin(1'b0), .Out(Tmp[1]));
AdderAndSubtractor_64bit TMP2(.A(pp[4]), .B(pp[5]), .Cin(1'b0), .Out(Tmp[2]));
AdderAndSubtractor_64bit TMP3(.A(pp[6]), .B(pp[7]), .Cin(1'b0), .Out(Tmp[3]));

AdderAndSubtractor_64bit TMP_0(.A(Tmp[0]), .B(Tmp[1]), .Cin(1'b0), .Out(Tmp_0));
AdderAndSubtractor_64bit TMP_1(.A(Tmp[2]), .B(Tmp[3]), .Cin(1'b0), .Out(Tmp_1));

AdderAndSubtractor_64bit OUT(.A(Tmp_0), .B(Tmp_1), .Cin(1'b0), .Out(Out));

endmodule

