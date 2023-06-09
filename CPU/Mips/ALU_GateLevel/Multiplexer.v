`timescale 1ns/1ns

module Mux2to1_1bit(I0, I1, Sel, Out);

input I0, I1;
input Sel;
output Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_2bit(I0, I1, Sel, Out);

input [1:0] I0, I1;
input Sel;
output [1:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_3bit(I0, I1, Sel, Out);

input [2:0] I0, I1;
input Sel;
output [2:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_4bit(I0, I1, Sel, Out);

input [3:0] I0, I1;
input Sel;
output [3:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_5bit(I0, I1, Sel, Out);

input [4:0] I0, I1;
input Sel;
output [4:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_16bit(I0, I1, Sel, Out);

input [15:0] I0, I1;
input Sel;
output [15:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_32bit(I0, I1, Sel, Out);

input [31:0] I0, I1;
input Sel;
output [31:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule
module Mux2to1_64bit(I0, I1, Sel, Out);

input [63:0] I0, I1;
input Sel;
output [63:0] Out;

assign #5 Out = ~Sel ? I0 : I1;

endmodule


module Mux4to1_1bit(I0, I1, I2, I3, Sel, Out);

input I0, I1, I2, I3;
input [1:0] Sel;
output Out;

wire tmp0, tmp1;

Mux2to1_1bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_1bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));

Mux2to1_1bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(Out));

endmodule
module Mux4to1_4bit(I0, I1, I2, I3, Sel, Out);

input [3:0] I0, I1, I2, I3;
input [1:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1;

Mux2to1_4bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_4bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));

Mux2to1_4bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(Out));

endmodule
module Mux4to1_32bit(I0, I1, I2, I3, Sel, Out);

input [31:0] I0, I1, I2, I3;
input [1:0] Sel;
output [31:0] Out;

wire [31:0] tmp0, tmp1;

Mux2to1_32bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_32bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));

Mux2to1_32bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(Out));

endmodule
module Mux4to1_64bit(I0, I1, I2, I3, Sel, Out);

input [63:0] I0, I1, I2, I3;
input [1:0] Sel;
output [63:0] Out;

wire [63:0] tmp0, tmp1;

Mux2to1_64bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_64bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));

Mux2to1_64bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(Out));

endmodule

module Mux8to1_1bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output Out;

wire tmp0, tmp1, tmp2, tmp3;
wire tmp_0, tmp_1;

Mux2to1_1bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_1bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));
Mux2to1_1bit MUX2(.I0(I4), .I1(I5), .Sel(Sel[0]), .Out(tmp2));
Mux2to1_1bit MUX3(.I0(I6), .I1(I7), .Sel(Sel[0]), .Out(tmp3));

Mux2to1_1bit MUX_0(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(tmp_0));
Mux2to1_1bit MUX_1(.I0(tmp2), .I1(tmp3), .Sel(Sel[1]), .Out(tmp_1));

Mux2to1_1bit MUXOUT(.I0(tmp_0), .I1(tmp_1), .Sel(Sel[2]), .Out(Out));

endmodule
module Mux8to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [3:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1, tmp2, tmp3;
wire [3:0] tmp_0, tmp_1;

Mux2to1_4bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_4bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));
Mux2to1_4bit MUX2(.I0(I4), .I1(I5), .Sel(Sel[0]), .Out(tmp2));
Mux2to1_4bit MUX3(.I0(I6), .I1(I7), .Sel(Sel[0]), .Out(tmp3));

Mux2to1_4bit MUX_0(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(tmp_0));
Mux2to1_4bit MUX_1(.I0(tmp2), .I1(tmp3), .Sel(Sel[1]), .Out(tmp_1));

Mux2to1_4bit MUXOUT(.I0(tmp_0), .I1(tmp_1), .Sel(Sel[2]), .Out(Out));

endmodule
module Mux8to1_32bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [31:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [31:0] Out;

wire [31:0] tmp0, tmp1, tmp2, tmp3;
wire [31:0] tmp_0, tmp_1;

Mux2to1_32bit MUX0(.I0(I0), .I1(I1), .Sel(Sel[0]), .Out(tmp0));
Mux2to1_32bit MUX1(.I0(I2), .I1(I3), .Sel(Sel[0]), .Out(tmp1));
Mux2to1_32bit MUX2(.I0(I4), .I1(I5), .Sel(Sel[0]), .Out(tmp2));
Mux2to1_32bit MUX3(.I0(I6), .I1(I7), .Sel(Sel[0]), .Out(tmp3));

Mux2to1_32bit MUX_0(.I0(tmp0), .I1(tmp1), .Sel(Sel[1]), .Out(tmp_0));
Mux2to1_32bit MUX_1(.I0(tmp2), .I1(tmp3), .Sel(Sel[1]), .Out(tmp_1));

Mux2to1_32bit MUXOUT(.I0(tmp_0), .I1(tmp_1), .Sel(Sel[2]), .Out(Out));

endmodule


module Mux16to1_1bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, Sel, Out);
input I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
input [3:0] Sel;
output Out;

wire tmp0, tmp1, tmp2, tmp3;
wire tmp_0, tmp_1;

Mux8to1_1bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_1bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));

Mux2to1_1bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[3]), .Out(Out));

endmodule
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
module Mux16to1_32bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, Sel, Out);
input [31:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
input [3:0] Sel;
output [31:0] Out;

wire [31:0] tmp0, tmp1, tmp2, tmp3;
wire [31:0] tmp_0, tmp_1;

Mux8to1_32bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_32bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));

Mux2to1_32bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[3]), .Out(Out));

endmodule

module Mux32to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Sel, Out);

input [3:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1, tmp2, tmp3;

Mux8to1_32bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_32bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));
Mux8to1_32bit MUX2(.I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23), .Sel(Sel[2:0]), .Out(tmp2));
Mux8to1_32bit MUX3(.I0(I24), .I1(I25), .I2(I26), .I3(I27), .I4(I28), .I5(I29), .I6(I30), .I7(I31), .Sel(Sel[2:0]), .Out(tmp3));

Mux4to1_32bit MUXOUT(.I0(tmp0), .I1(tmp1), .I2(tmp2), .I3(tmp3), .Sel(Sel[4:3]), .Out(Out));

endmodule
module Mux32to1_32bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Sel, Out);

input [31:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] Sel;
output [31:0] Out;

wire [31:0] tmp0, tmp1, tmp2, tmp3;

Mux8to1_32bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_32bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));
Mux8to1_32bit MUX2(.I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23), .Sel(Sel[2:0]), .Out(tmp2));
Mux8to1_32bit MUX3(.I0(I24), .I1(I25), .I2(I26), .I3(I27), .I4(I28), .I5(I29), .I6(I30), .I7(I31), .Sel(Sel[2:0]), .Out(tmp3));

Mux4to1_32bit MUXOUT(.I0(tmp0), .I1(tmp1), .I2(tmp2), .I3(tmp3), .Sel(Sel[4:3]), .Out(Out));

endmodule

module Mux64to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, I32,
		     I33, I34, I35, I36, I37, I38, I39, I40, I41, I42, I43, I44, I45, I46, I47, I48, I49, I50, I51, I52, I53, I54, I55, I56, I57, I58, I59, I60, I61, I62, I63, Sel, Out);

input [3:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, I32, I33, 
	    I34, I35, I36, I37, I38, I39, I40, I41, I42, I43, I44, I45, I46, I47, I48, I49, I50, I51, I52, I53, I54, I55, I56, I57, I58, I59, I60, I61, I62, I63;
input [5:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1;

Mux32to1_4bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .I8(I8), .I9(I9), .I10(I10), .I11(I11), .I12(I12), .I13(I13), .I14(I14),
		   .I15(I15), .I16(I16), .I17(I17), .I18(I18), .I19(I19), .I20(I20), .I21(I21), .I22(I22), .I23(I23), .I24(I24), .I25(I25), .I26(I26), .I27(I27),
		   .I28(I28), .I29(I29), .I30(I30), .I31(I31), .Sel(Sel[4:0]), .Out(tmp0));
Mux32to1_4bit MUX1(.I0(I32), .I1(I33), .I2(I34), .I3(I35), .I4(I36), .I5(I37), .I6(I38), .I7(I39), .I8(I40), .I9(I41), .I10(I42), .I11(I43), .I12(I44), .I13(I45), 
		   .I14(I46), .I15(I47), .I16(I48), .I17(I49), .I18(I50), .I19(I51), .I20(I52), .I21(I53), .I22(I54), .I23(I55), .I24(I56), .I25(I57), .I26(I58), 
		   .I27(I59), .I28(I60), .I29(I61), .I30(I62), .I31(I63), .Sel(Sel[4:0]), .Out(tmp1));

Mux2to1_4bit MUXOUT(.I0(tmp0), .I1(tmp1), .Sel(Sel[5]), .Out(Out));

endmodule