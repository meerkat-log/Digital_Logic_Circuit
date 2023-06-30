`timescale 1ns/1ns

module DFF(CLK, En, Reset, D, Q, Qbar);

input CLK, En, Reset, D;
output Q, Qbar;

wire CLKbar, D_Tmp, Dbar, SMaster, RMaster, Y, Ybar, SSlave, RSlave;

NOT1 NOTCLK(.A(CLK), .Out(CLKbar));

Mux2to1_1bit ENABLE(.I0(Q), .I1(D), .Sel(En), .Out(D_Tmp));
NOT1 NOTD(.A(D_Tmp), .Out(Dbar));

NAND3 SMOut(.A(D_Tmp), .B(CLK), .C(Reset), .Out(SMaster));
NAND2 RMOut(.A(Dbar), .B(CLK), .Out(RMaster));
NAND2 YOut(.A(SMaster), .B(Ybar), .Out(Y));
NAND3 YbarOut(.A(RMaster), .B(Y), .C(Reset), .Out(Ybar));

NAND2 SSOut(.A(Y), .B(CLKbar), .Out(SSlave));
NAND2 RSOut(.A(Ybar), .B(CLKbar), .Out(RSlave));
NAND2 QOut(.A(SSlave), .B(Qbar), .Out(Q));
NAND3 QbarOut(.A(RSlave), .B(Q), .C(Reset), .Out(Qbar));

endmodule

module TFF(CLK, En, Reset, T, Q, Qbar);

input CLK, En, Reset, T;
output Q, Qbar;

XOR2 DIN(.A(T), .B(Q), .Out(Din));
DFF DFF0(.CLK(CLK), .En(En), .Reset(Reset), .D(Din), .Q(Q), .Qbar(Qbar));


endmodule

module RadixCounter(CLK, En, Reset, Out);

input CLK, En, Reset;
output [2:0] Out;

TFF TFF0(.CLK(CLK), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
TFF TFF1(.CLK(CLK), .En(En), .Reset(Reset), .T(Out[0]), .Q(Out[1]));
AND2 TFF2IN(.A(Out[0]), .B(Out[1]), .Out(Tff2in));
TFF TFF2(.CLK(CLK), .En(En), .Reset(Reset), .T(Tff2in), .Q(Out[2]));

endmodule

module RadixLookUpTable(In, Out, Sign);

input [4:0] In;
output reg [3:0] Out;
output reg Sign;

always @(In) begin
	case(In)
		5'b00000 : begin Out = 4'b0000; Sign = 1'b0; end
		5'b00001 : begin Out = 4'b0001; Sign = 1'b0; end
		5'b00010 : begin Out = 4'b0001; Sign = 1'b0; end
		5'b00011 : begin Out = 4'b0010; Sign = 1'b0; end
		5'b00100 : begin Out = 4'b0010; Sign = 1'b0; end
		5'b00101 : begin Out = 4'b0011; Sign = 1'b0; end
		5'b00110 : begin Out = 4'b0011; Sign = 1'b0; end
		5'b00111 : begin Out = 4'b0100; Sign = 1'b0; end
		5'b01000 : begin Out = 4'b0100; Sign = 1'b0; end
		5'b01001 : begin Out = 4'b0101; Sign = 1'b0; end
		5'b01010 : begin Out = 4'b0101; Sign = 1'b0; end
		5'b01011 : begin Out = 4'b0110; Sign = 1'b0; end
		5'b01100 : begin Out = 4'b0110; Sign = 1'b0; end
		5'b01101 : begin Out = 4'b0111; Sign = 1'b0; end
		5'b01110 : begin Out = 4'b0111; Sign = 1'b0; end
		5'b01111 : begin Out = 4'b1000; Sign = 1'b0; end
		5'b10000 : begin Out = 4'b1000; Sign = 1'b1; end
		5'b10001 : begin Out = 4'b0111; Sign = 1'b1; end
		5'b10010 : begin Out = 4'b0111; Sign = 1'b1; end
		5'b10011 : begin Out = 4'b0110; Sign = 1'b1; end
		5'b10100 : begin Out = 4'b0110; Sign = 1'b1; end
		5'b10101 : begin Out = 4'b0101; Sign = 1'b1; end
		5'b10110 : begin Out = 4'b0101; Sign = 1'b1; end
		5'b10111 : begin Out = 4'b0100; Sign = 1'b1; end
		5'b11000 : begin Out = 4'b0100; Sign = 1'b1; end
		5'b11001 : begin Out = 4'b0011; Sign = 1'b1; end
		5'b11010 : begin Out = 4'b0011; Sign = 1'b1; end
		5'b11011 : begin Out = 4'b0010; Sign = 1'b1; end
		5'b11100 : begin Out = 4'b0010; Sign = 1'b1; end
		5'b11101 : begin Out = 4'b0001; Sign = 1'b1; end
		5'b11110 : begin Out = 4'b0001; Sign = 1'b1; end
		5'b11111 : begin Out = 4'b0000; Sign = 1'b1; end


	endcase
end
endmodule

module RadixSelect(CLK, En, Reset, B, Out, Sign);

input CLK, En, Reset;
input [31:0] B;
output [3:0] Out;
output Sign;

wire [32:0] BZero;
wire [2:0] RadixCount;
wire [4:0] LUTIn;

assign BZero = {B, 1'b0};

RadixCounter RC(.CLK(CLK), .En(En), .Reset(Reset), .Out(RadixCount));
Mux8to1_5bit MUX(.I0(BZero[4:0]), .I1(BZero[8:4]), .I2(BZero[12:8]), .I3(BZero[16:12]), .I4(BZero[20:16]), .I5(BZero[24:20]), .I6(BZero[28:24]), .I7(BZero[32:28]), .Sel(RadixCount), .Out(LUTIn));
RadixLookUpTable LUT(.In(LUTIn), .Out(Out), .Sign(Sign));

endmodule


module BoothLookUpTable(In, Out0, Out1, Sel0, Sel1);

input [3:0] In;
output reg [1:0] Out0, Out1;
output reg Sel0, Sel1;

always @(In) begin
	case(In)
		4'b0000 : begin
			Out0 = 2'b00;
			Out1 = 2'b00;
			Sel0 = 1'b0;
			Sel1 = 1'b0;
			end
		4'b0001 : begin
			Out0 = 2'b00;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b0;
			end
		4'b0010 : begin
			Out0 = 2'b01;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b0;
			end
		4'b0011 : begin
			Out0 = 2'b01;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b1;
			end
		4'b0100 : begin
			Out0 = 2'b10;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b0;
			end
		4'b0101 : begin
			Out0 = 2'b10;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b1;
			end
		4'b0110 : begin
			Out0 = 2'b10;
			Out1 = 2'b01;
			Sel0 = 1'b1;
			Sel1 = 1'b1;
			end
		4'b0111 : begin
			Out0 = 2'b11;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b1;
			end
		4'b1000 : begin
			Out0 = 2'b11;
			Out1 = 2'b00;
			Sel0 = 1'b1;
			Sel1 = 1'b0;
			end
	endcase
end
endmodule

module BoothAdder(A, ModeA, ModeB, ModeC, Sel0, Sel1, Sign, Out);

input [31:0] A;
input [1:0] ModeA, ModeB, ModeC;
input Sel0, Sel1, Sign;
output [63:0] Out;

wire CLK;
wire [63:0] A_Tmp, AShift4, Booth0, Booth1, BoothA, BoothB, SignA, SignB;

assign A_Tmp = {{32{A[31]}},A};

Clock_Register CLOCK_REG(.CLK(CLK));

ShiftRegister_64bit ASHIFT(.CLK(CLK), .Mode(ModeA), .In(A_Tmp), .Out(AShift4));



ShiftRegister_64bit BOOTH0(.CLK(CLK), .Mode(ModeB), .In(AShift4), .Out(Booth0));
ShiftRegister_64bit BOOTH1(.CLK(CLK), .Mode(ModeC), .In(AShift4), .Out(Booth1));

Mux2to1_64bit SEL_BOOTHA(.I0(64'H0000000000000000), .I1(Booth0), .Sel(Sel0), .Out(BoothA));
Mux2to1_64bit SEL_BOOTHB(.I0(64'H0000000000000000), .I1(Booth1), .Sel(Sel1), .Out(BoothB));

AdderAndSubtractor_64bit SIGNA(.A(64'H0000000000000000), .B(BoothA), .Cin(Sign), .Out(SignA));
AdderAndSubtractor_64bit SIGNB(.A(64'H0000000000000000), .B(BoothB), .Cin(Sign), .Out(SignB));

AdderAndSubtractor_64bit ADDER(.A(SignA), .B(SignB), .Cin(1'b0), .Out(Out));

endmodule

module SaveResult(CLK, En, Reset, A, Out);

input CLK, En, Reset;
input [63:0] A;
output [63:0] Out;

wire [63:0] Tmp;
wire CLK;

AdderAndSubtractor_64bit ADDER(.A(A), .B(Out), .Cin(1'b0), .Out(Tmp));

Register_64bit REG64(.CLK(CLK), .En(En), .Reset(Reset), .In(Tmp), .Out(Out));

endmodule

module Multiplier(A, B, Out);

input [31:0] A, B;
output [63:0] Out;

reg En0, En3, Reset0, Reset3;
reg [1:0] ModeA, ModeB, ModeC;
wire CLK;
wire [3:0] Radix;
wire [1:0] Out0, Out1;
wire Sel0, Sel1, Sign;
wire [63:0] Booth;

Clock_Register CLOCK(.CLK(CLK));

RadixSelect RADIX_SELECT(.CLK(CLK), .En(En0), .Reset(Reset0), .B(B), .Out(Radix), .Sign(Sign));

//Register_5bit REG5(.CLK(CLK), .En(En1), .Reset(Reset1), .In(Radix), .Out(RadixOut));

BoothLookUpTable BLUT(.In(Radix), .Out0(Out0), .Out1(Out1), .Sel0(Sel0), .Sel1(Sel1));
BoothAdder BOOTH_ADDER(.A(A), .ModeA(ModeA), .ModeB(ModeB), .ModeC(ModeC), .Sel0(Sel0), .Sel1(Sel1), .Sign(Sign), .Out(Booth));

//Register_64bit REG64(.CLK(CLK), .En(En2), .Reset(Reset2), .In(Booth), .Out(BoothOut));

SaveResult SAVE(.CLK(CLK), .En(En3), .Reset(Reset3), .A(Booth), .Out(Out));

integer i, j, k;
initial begin
	En0 = 1'b0;
	Reset0 = 1'b0;
	En3 = 1'b0;
	Reset3 = 1'b0;
	ModeA = 2'b11;
	#100
	ModeA = 2'b00;
	Reset0 = 1'b1;
	Reset3 = 1'b1;
	#100
	
	for(i = 0; i < 8; i = i + 1) begin
		ModeB = 2'b11;
		#100;
		for(j = 0; j < Out0; j = j + 1) begin
			ModeB <= 2'b10;
			#100;
		end
		ModeB = 2'b00;
		ModeC = 2'b11;
		#100;
		for(k = 0; k < Out1; k = k + 1) begin
			ModeC <= 2'b10;
			#100;
		end
		ModeC = 2'b00;
		#200
		En3 = 1'b1;
		#100
		En3 = 1'b0;
		ModeA = 2'b10;
		#400 ModeA= 2'b00;
		En0 = 1'b1;
		#100 
		En0 = 1'b0;
		
	end
end

endmodule