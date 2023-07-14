`timescale 1ns/1ns

module Mux16to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, Sel, Out);
input [3:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
input [3:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1, tmp2, tmp3;
wire [3:0] tmp_0, tmp_1;

Mux8to1_4bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_4bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));

Mux2to1_4bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[3]), .Out(Out));

endmodule
