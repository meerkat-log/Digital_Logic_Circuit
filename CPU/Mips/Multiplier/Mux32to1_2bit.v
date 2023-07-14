`timescale 1ns/1ns

module Mux32to1_2bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Sel, Out);

input [1:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] Sel;
output [1:0] Out;

wire [1:0] tmp0, tmp1, tmp2, tmp3;

Mux8to1_2bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_2bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));
Mux8to1_2bit MUX2(.I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23), .Sel(Sel[2:0]), .Out(tmp2));
Mux8to1_2bit MUX3(.I0(I24), .I1(I25), .I2(I26), .I3(I27), .I4(I28), .I5(I29), .I6(I30), .I7(I31), .Sel(Sel[2:0]), .Out(tmp3));

Mux4to1_4bit MUXOUT(.I0(tmp0), .I1(tmp1), .I2(tmp2), .I3(tmp3), .Sel(Sel[4:3]), .Out(Out));

endmodule
