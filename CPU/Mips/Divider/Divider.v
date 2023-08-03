`timescale 1ns/1ns

// This Module is the Top Module of the Divider.

module Divider(A, B, Out);

input [31:0] A, B;
output [63:0] Out;

wire ALB, AEB, AGB;
wire [31:0] A_Tmp, A_In, B_In, Preset;

DividerController DIV_CRTL(.Reset(Reset));

Clock_Enable CLOCK_EN(.Clk(ClkEn));

// It plays a role in setting Preset in the initialization step.
Mux2to1_32bit SET_PRESET(.I0(32'H00000000), .I1(A), .Sel(Reset), .Out(Preset));

// 95ns
// It can only be stored in Reg if it is not A<B.
AND2_1bit REG_ENABLE(.A(ClkEn), .B(Enable), .Out(RegEn));
Register_32bit_with_Preset REG(.Clk(ClkEn), .En(RegEn), .Reset(Reset), .Preset(Preset), .In(A_Tmp), .Out(Out[31:0]));

// 205ns
// It is a comparator that compares A and B.
Comparator_32bit COMP(.A(Out[31:0]), .B(B), .ALB(ALB), .AEB(AEB), .AGB(AGB));

NOT_1bit ENABLE(.A(ALB), .Out(Enable));

// 90ns
// Subtract when A is greater than B; otherwise, 0 enters the subtractor and computes.
Mux2to1_32bit MUX_A(.I0(32'H00000000), .I1(Out[31:0]), .Sel(Enable), .Out(A_In));
Mux2to1_32bit MUX_B(.I0(32'H00000000), .I1(B), .Sel(Enable), .Out(B_In));
AdderAndSubtractor_32bit SUB(.A(A_In), .B(B_In), .Cin(Enable), .Out(A_Tmp));

// Once subtracted, the counter value increases once.
DividerCounter DC(.Clk(ClkEn), .En(Enable), .Reset(Reset), .Out(Out[63:32]));

endmodule

module TB_Divider();

reg [31:0] A, B;
wire [63:0] Out;

Divider DIV(.A(A), .B(B), .Out(Out));

initial begin
	A = 32'H00054123;
	B = 32'H0000547B;
end
endmodule
