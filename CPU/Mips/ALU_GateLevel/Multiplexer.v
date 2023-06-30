`timescale 1ns/1ns

module Mux2to1_1bit(I0, I1, Sel, Out);

input I0, I1;
input Sel;
output Out;

wire SelBar, OutI0, OutI1;

not SELBAR(SelBar, Sel);

and OUTI0(OutI0, I0, SelBar);
and OUTI1(OutI1, I1, Sel);

or #5 OUT(Out, OutI0, OutI1);

endmodule
module Mux2to1_2bit(I0, I1, Sel, Out);

input [1:0] I0, I1;
input Sel;
output [1:0] Out;

wire SelBar;
wire [1:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 2; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_3bit(I0, I1, Sel, Out);

input [2:0] I0, I1;
input Sel;
output [2:0] Out;

wire SelBar;
wire [2:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 3; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_4bit(I0, I1, Sel, Out);

input [3:0] I0, I1;
input Sel;
output [3:0] Out;

wire SelBar;
wire [3:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 4; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_5bit(I0, I1, Sel, Out);

input [4:0] I0, I1;
input Sel;
output [4:0] Out;

wire SelBar;
wire [4:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 5; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_16bit(I0, I1, Sel, Out);

input [15:0] I0, I1;
input Sel;
output [15:0] Out;

wire SelBar;
wire [15:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 16; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_32bit(I0, I1, Sel, Out);

input [31:0] I0, I1;
input Sel;
output [31:0] Out;

wire SelBar;
wire [31:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule
module Mux2to1_64bit(I0, I1, Sel, Out);

input [63:0] I0, I1;
input Sel;
output [63:0] Out;

wire SelBar;
wire [63:0] OutI0, OutI1;

not SELBAR(SelBar, Sel);

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		and OUTI0(OutI0[i], I0[i], SelBar);
		and OUTI1(OutI1[i], I1[i], Sel);
		or #5 OUT0(Out[i], OutI0[i], OutI1[i]);
	end
endgenerate

endmodule


module Mux4to1_1bit(I0, I1, I2, I3, Sel, Out);

input I0, I1, I2, I3;
input [1:0] Sel;
output Out;

wire [1:0] SelBar;

wire OutI0_Tmp, OutI1_Tmp, OutI2_Tmp, OutI3_Tmp;
wire OutI0, OutI1, OutI2, OutI3;
wire OutTmp0, OutTmp1;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);

and OUTI0_0(OutI0_Tmp, I0, SelBar[0]);
and OUTI0_1(OutI0, OutI0_Tmp, SelBar[1]);

and OUTI1_0(OutI1_Tmp, I1, Sel[0]);
and OUTI1_1(OutI1, OutI1_Tmp, SelBar[1]);

and OUTI2_0(OutI2_Tmp, I2, SelBar[0]);
and OUTI2_1(OutI2, OutI2_Tmp, Sel[1]);

and OUTI3_0(OutI3_Tmp, I3, Sel[0]);
and OUTI3_1(OutI3, OutI3_Tmp, Sel[1]);

or OUT0(OutTmp0, OutI0, OutI1);
or OUT1(OutTmp1, OutI2, OutI3);

or #5 OUT(Out, OutTmp0, OutTmp1);

endmodule
module Mux4to1_4bit(I0, I1, I2, I3, Sel, Out);

input [3:0] I0, I1, I2, I3;
input [1:0] Sel;
output [3:0] Out;

wire [1:0] SelBar;

wire [3:0] OutI0_Tmp, OutI1_Tmp, OutI2_Tmp, OutI3_Tmp;
wire [3:0] OutI0, OutI1, OutI2, OutI3;
wire [3:0] OutTmp0, OutTmp1;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);

genvar i;
generate
	for(i = 0; i < 4; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0[i], OutI0_Tmp[i], SelBar[1]);

		and OUTI1_0(OutI1_Tmp[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1[i], OutI1_Tmp[i], SelBar[1]);

		and OUTI2_0(OutI2_Tmp[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2[i], OutI2_Tmp[i], Sel[1]);

		and OUTI3_0(OutI3_Tmp[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3[i], OutI3_Tmp[i], Sel[1]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);

		or #5 OUT(Out[i], OutTmp0[i], OutTmp1[i]);
	end
endgenerate

endmodule
module Mux4to1_32bit(I0, I1, I2, I3, Sel, Out);

input [31:0] I0, I1, I2, I3;
input [1:0] Sel;
output [31:0] Out;

wire [1:0] SelBar;

wire [31:0] OutI0_Tmp, OutI1_Tmp, OutI2_Tmp, OutI3_Tmp;
wire [31:0] OutI0, OutI1, OutI2, OutI3;
wire [31:0] OutTmp0, OutTmp1;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0[i], OutI0_Tmp[i], SelBar[1]);

		and OUTI1_0(OutI1_Tmp[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1[i], OutI1_Tmp[i], SelBar[1]);

		and OUTI2_0(OutI2_Tmp[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2[i], OutI2_Tmp[i], Sel[1]);

		and OUTI3_0(OutI3_Tmp[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3[i], OutI3_Tmp[i], Sel[1]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);

		or #5 OUT(Out[i], OutTmp0[i], OutTmp1[i]);
	end
endgenerate

endmodule
module Mux4to1_64bit(I0, I1, I2, I3, Sel, Out);

input [63:0] I0, I1, I2, I3;
input [1:0] Sel;
output [63:0] Out;

wire [1:0] SelBar;

wire [63:0] OutI0_Tmp, OutI1_Tmp, OutI2_Tmp, OutI3_Tmp;
wire [63:0] OutI0, OutI1, OutI2, OutI3;
wire [63:0] OutTmp0, OutTmp1;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0[i], OutI0_Tmp[i], SelBar[1]);

		and OUTI1_0(OutI1_Tmp[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1[i], OutI1_Tmp[i], SelBar[1]);

		and OUTI2_0(OutI2_Tmp[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2[i], OutI2_Tmp[i], Sel[1]);

		and OUTI3_0(OutI3_Tmp[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3[i], OutI3_Tmp[i], Sel[1]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);

		or #5 OUT(Out[i], OutTmp0[i], OutTmp1[i]);
	end
endgenerate

endmodule

module Mux8to1_1bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output Out;

wire [2:0] SelBar;

wire OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutT1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

and OUTI0_0(OutI0_Tmp0, I0, SelBar[0]);
and OUTI0_1(OutI0_Tmp1, SelBar[1], SelBar[2]);
and OUTI0_2(OutI0, OutI0_Tmp0, OutI0_Tmp1);

and OUTI1_0(OutI1_Tmp0, I1, Sel[0]);
and OUTI1_1(OutI1_Tmp1, SelBar[1], SelBar[2]);
and OUTI1_2(OutI1, OutI1_Tmp0, OutI1_Tmp1);

and OUTI2_0(OutI2_Tmp0, I2, SelBar[0]);
and OUTI2_1(OutI2_Tmp1, Sel[1], SelBar[2]);
and OUTI2_2(OutI2, OutI2_Tmp0, OutI2_Tmp1);

and OUTI3_0(OutI3_Tmp0, I3, Sel[0]);
and OUTI3_1(OutI3_Tmp1, Sel[1], SelBar[2]);
and OUTI3_2(OutI3, OutI3_Tmp0, OutI3_Tmp1);

and OUTI4_0(OutI4_Tmp0, I4, SelBar[0]);
and OUTI4_1(OutI4_Tmp1, SelBar[1], Sel[2]);
and OUTI4_2(OutI4, OutI4_Tmp0, OutI4_Tmp1);

and OUTI5_0(OutI5_Tmp0, I5, Sel[0]);
and OUTI5_1(OutI5_Tmp1, SelBar[1], Sel[2]);
and OUTI5_2(OutI5, OutI5_Tmp0, OutI5_Tmp1);

and OUTI6_0(OutI6_Tmp0, I6, SelBar[0]);
and OUTI6_1(OutI6_Tmp1, Sel[1], Sel[2]);
and OUTI6_2(OutI6, OutI6_Tmp0, OutI6_Tmp1);

and OUTI7_0(OutI7_Tmp0, I7, Sel[0]);
and OUTI7_1(OutI7_Tmp1, Sel[1], Sel[2]);
and OUTI7_2(OutI7, OutI7_Tmp0, OutI7_Tmp1);

or OUT0(OutTmp0, OutI0, OutI1);
or OUT1(OutTmp1, OutI2, OutI3);
or OUT2(OutTmp2, OutI4, OutI5);
or OUT3(OutTmp3, OutI6, OutI7);

or OUT5(OutTmp4, OutTmp0, OutTmp1);
or OUT6(OutTmp5, OutTmp2, OutTmp3);

or #5 OUT(Out, OutTmp4, OutTmp5);

endmodule
module Mux8to1_2bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [1:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [1:0] Out;

wire [2:0] SelBar;

wire [1:0] OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutI1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire [1:0] OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire [1:0] OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

genvar i;
generate
	for(i = 0; i < 2; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp0[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI0_2(OutI0[i], OutI0_Tmp0[i], OutI0_Tmp1[i]);

		and OUTI1_0(OutI1_Tmp0[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI1_2(OutI1[i], OutI1_Tmp0[i], OutI1_Tmp1[i]);

		and OUTI2_0(OutI2_Tmp0[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI2_2(OutI2[i], OutI2_Tmp0[i], OutI2_Tmp1[i]);

		and OUTI3_0(OutI3_Tmp0[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI3_2(OutI3[i], OutI3_Tmp0[i], OutI3_Tmp1[i]);

		and OUTI4_0(OutI4_Tmp0[i], I4[i], SelBar[0]);
		and OUTI4_1(OutI4_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI4_2(OutI4[i], OutI4_Tmp0[i], OutI4_Tmp1[i]);

		and OUTI5_0(OutI5_Tmp0[i], I5[i], Sel[0]);
		and OUTI5_1(OutI5_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI5_2(OutI5[i], OutI5_Tmp0[i], OutI5_Tmp1[i]);

		and OUTI6_0(OutI6_Tmp0[i], I6[i], SelBar[0]);
		and OUTI6_1(OutI6_Tmp1[i], Sel[1], Sel[2]);
		and OUTI6_2(OutI6[i], OutI6_Tmp0[i], OutI6_Tmp1[i]);

		and OUTI7_0(OutI7_Tmp0[i], I7[i], Sel[0]);
		and OUTI7_1(OutI7_Tmp1[i], Sel[1], Sel[2]);
		and OUTI7_2(OutI7[i], OutI7_Tmp0[i], OutI7_Tmp1[i]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);
		or OUT2(OutTmp2[i], OutI4[i], OutI5[i]);
		or OUT3(OutTmp3[i], OutI6[i], OutI7[i]);

		or OUT5(OutTmp4[i], OutTmp0[i], OutTmp1[i]);
		or OUT6(OutTmp5[i], OutTmp2[i], OutTmp3[i]);

		or #5 OUT(Out[i], OutTmp4[i], OutTmp5[i]);
	end
endgenerate

endmodule
module Mux8to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [3:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [3:0] Out;

wire [2:0] SelBar;

wire [3:0] OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutI1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire [3:0] OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire [3:0] OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

genvar i;
generate
	for(i = 0; i < 4; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp0[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI0_2(OutI0[i], OutI0_Tmp0[i], OutI0_Tmp1[i]);

		and OUTI1_0(OutI1_Tmp0[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI1_2(OutI1[i], OutI1_Tmp0[i], OutI1_Tmp1[i]);

		and OUTI2_0(OutI2_Tmp0[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI2_2(OutI2[i], OutI2_Tmp0[i], OutI2_Tmp1[i]);

		and OUTI3_0(OutI3_Tmp0[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI3_2(OutI3[i], OutI3_Tmp0[i], OutI3_Tmp1[i]);

		and OUTI4_0(OutI4_Tmp0[i], I4[i], SelBar[0]);
		and OUTI4_1(OutI4_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI4_2(OutI4[i], OutI4_Tmp0[i], OutI4_Tmp1[i]);

		and OUTI5_0(OutI5_Tmp0[i], I5[i], Sel[0]);
		and OUTI5_1(OutI5_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI5_2(OutI5[i], OutI5_Tmp0[i], OutI5_Tmp1[i]);

		and OUTI6_0(OutI6_Tmp0[i], I6[i], SelBar[0]);
		and OUTI6_1(OutI6_Tmp1[i], Sel[1], Sel[2]);
		and OUTI6_2(OutI6[i], OutI6_Tmp0[i], OutI6_Tmp1[i]);

		and OUTI7_0(OutI7_Tmp0[i], I7[i], Sel[0]);
		and OUTI7_1(OutI7_Tmp1[i], Sel[1], Sel[2]);
		and OUTI7_2(OutI7[i], OutI7_Tmp0[i], OutI7_Tmp1[i]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);
		or OUT2(OutTmp2[i], OutI4[i], OutI5[i]);
		or OUT3(OutTmp3[i], OutI6[i], OutI7[i]);

		or OUT5(OutTmp4[i], OutTmp0[i], OutTmp1[i]);
		or OUT6(OutTmp5[i], OutTmp2[i], OutTmp3[i]);

		or #5 OUT(Out[i], OutTmp4[i], OutTmp5[i]);
	end
endgenerate

endmodule
module Mux8to1_5bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [4:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [4:0] Out;

wire [2:0] SelBar;

wire [4:0] OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutI1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire [4:0] OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire [4:0] OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

genvar i;
generate
	for(i = 0; i < 5; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp0[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI0_2(OutI0[i], OutI0_Tmp0[i], OutI0_Tmp1[i]);

		and OUTI1_0(OutI1_Tmp0[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI1_2(OutI1[i], OutI1_Tmp0[i], OutI1_Tmp1[i]);

		and OUTI2_0(OutI2_Tmp0[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI2_2(OutI2[i], OutI2_Tmp0[i], OutI2_Tmp1[i]);

		and OUTI3_0(OutI3_Tmp0[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI3_2(OutI3[i], OutI3_Tmp0[i], OutI3_Tmp1[i]);

		and OUTI4_0(OutI4_Tmp0[i], I4[i], SelBar[0]);
		and OUTI4_1(OutI4_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI4_2(OutI4[i], OutI4_Tmp0[i], OutI4_Tmp1[i]);

		and OUTI5_0(OutI5_Tmp0[i], I5[i], Sel[0]);
		and OUTI5_1(OutI5_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI5_2(OutI5[i], OutI5_Tmp0[i], OutI5_Tmp1[i]);

		and OUTI6_0(OutI6_Tmp0[i], I6[i], SelBar[0]);
		and OUTI6_1(OutI6_Tmp1[i], Sel[1], Sel[2]);
		and OUTI6_2(OutI6[i], OutI6_Tmp0[i], OutI6_Tmp1[i]);

		and OUTI7_0(OutI7_Tmp0[i], I7[i], Sel[0]);
		and OUTI7_1(OutI7_Tmp1[i], Sel[1], Sel[2]);
		and OUTI7_2(OutI7[i], OutI7_Tmp0[i], OutI7_Tmp1[i]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);
		or OUT2(OutTmp2[i], OutI4[i], OutI5[i]);
		or OUT3(OutTmp3[i], OutI6[i], OutI7[i]);

		or OUT5(OutTmp4[i], OutTmp0[i], OutTmp1[i]);
		or OUT6(OutTmp5[i], OutTmp2[i], OutTmp3[i]);

		or #5 OUT(Out[i], OutTmp4[i], OutTmp5[i]);
	end
endgenerate

endmodule
module Mux8to1_32bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [31:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [31:0] Out;

wire [2:0] SelBar;

wire [31:0] OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutI1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire [31:0] OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire [31:0] OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp0[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI0_2(OutI0[i], OutI0_Tmp0[i], OutI0_Tmp1[i]);

		and OUTI1_0(OutI1_Tmp0[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI1_2(OutI1[i], OutI1_Tmp0[i], OutI1_Tmp1[i]);

		and OUTI2_0(OutI2_Tmp0[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI2_2(OutI2[i], OutI2_Tmp0[i], OutI2_Tmp1[i]);

		and OUTI3_0(OutI3_Tmp0[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI3_2(OutI3[i], OutI3_Tmp0[i], OutI3_Tmp1[i]);

		and OUTI4_0(OutI4_Tmp0[i], I4[i], SelBar[0]);
		and OUTI4_1(OutI4_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI4_2(OutI4[i], OutI4_Tmp0[i], OutI4_Tmp1[i]);

		and OUTI5_0(OutI5_Tmp0[i], I5[i], Sel[0]);
		and OUTI5_1(OutI5_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI5_2(OutI5[i], OutI5_Tmp0[i], OutI5_Tmp1[i]);

		and OUTI6_0(OutI6_Tmp0[i], I6[i], SelBar[0]);
		and OUTI6_1(OutI6_Tmp1[i], Sel[1], Sel[2]);
		and OUTI6_2(OutI6[i], OutI6_Tmp0[i], OutI6_Tmp1[i]);

		and OUTI7_0(OutI7_Tmp0[i], I7[i], Sel[0]);
		and OUTI7_1(OutI7_Tmp1[i], Sel[1], Sel[2]);
		and OUTI7_2(OutI7[i], OutI7_Tmp0[i], OutI7_Tmp1[i]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);
		or OUT2(OutTmp2[i], OutI4[i], OutI5[i]);
		or OUT3(OutTmp3[i], OutI6[i], OutI7[i]);

		or OUT5(OutTmp4[i], OutTmp0[i], OutTmp1[i]);
		or OUT6(OutTmp5[i], OutTmp2[i], OutTmp3[i]);

		or #5 OUT(Out[i], OutTmp4[i], OutTmp5[i]);
	end
endgenerate

endmodule
module Mux8to1_64bit(I0, I1, I2, I3, I4, I5, I6, I7, Sel, Out);
input [63:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] Sel;
output [63:0] Out;

wire [2:0] SelBar;

wire [63:0] OutI0_Tmp0, OutI0_Tmp1, OutI1_Tmp0, OutI1_Tmp1, OutI2_Tmp0, OutI2_Tmp1, OutI3_Tmp0, OutI3_Tmp1, OutI4_Tmp0, OutI4_Tmp1, OutI5_Tmp0, OutI5_Tmp1, OutI6_Tmp0, OutI6_Tmp1, OutI7_Tmp0, OutI7_Tmp1;
wire [63:0] OutI0, OutI1, OutI2, OutI3, OutI4, OutI5, OutI6, OutI7;
wire [63:0] OutTmp0, OutTmp1, OutTmp2, OutTmp3, OutTmp4, OutTmp5;

not SELBAR0(SelBar[0], Sel[0]);
not SELBAR1(SelBar[1], Sel[1]);
not SELBAR2(SelBar[2], Sel[2]);

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		and OUTI0_0(OutI0_Tmp0[i], I0[i], SelBar[0]);
		and OUTI0_1(OutI0_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI0_2(OutI0[i], OutI0_Tmp0[i], OutI0_Tmp1[i]);

		and OUTI1_0(OutI1_Tmp0[i], I1[i], Sel[0]);
		and OUTI1_1(OutI1_Tmp1[i], SelBar[1], SelBar[2]);
		and OUTI1_2(OutI1[i], OutI1_Tmp0[i], OutI1_Tmp1[i]);

		and OUTI2_0(OutI2_Tmp0[i], I2[i], SelBar[0]);
		and OUTI2_1(OutI2_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI2_2(OutI2[i], OutI2_Tmp0[i], OutI2_Tmp1[i]);

		and OUTI3_0(OutI3_Tmp0[i], I3[i], Sel[0]);
		and OUTI3_1(OutI3_Tmp1[i], Sel[1], SelBar[2]);
		and OUTI3_2(OutI3[i], OutI3_Tmp0[i], OutI3_Tmp1[i]);

		and OUTI4_0(OutI4_Tmp0[i], I4[i], SelBar[0]);
		and OUTI4_1(OutI4_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI4_2(OutI4[i], OutI4_Tmp0[i], OutI4_Tmp1[i]);

		and OUTI5_0(OutI5_Tmp0[i], I5[i], Sel[0]);
		and OUTI5_1(OutI5_Tmp1[i], SelBar[1], Sel[2]);
		and OUTI5_2(OutI5[i], OutI5_Tmp0[i], OutI5_Tmp1[i]);

		and OUTI6_0(OutI6_Tmp0[i], I6[i], SelBar[0]);
		and OUTI6_1(OutI6_Tmp1[i], Sel[1], Sel[2]);
		and OUTI6_2(OutI6[i], OutI6_Tmp0[i], OutI6_Tmp1[i]);

		and OUTI7_0(OutI7_Tmp0[i], I7[i], Sel[0]);
		and OUTI7_1(OutI7_Tmp1[i], Sel[1], Sel[2]);
		and OUTI7_2(OutI7[i], OutI7_Tmp0[i], OutI7_Tmp1[i]);

		or OUT0(OutTmp0[i], OutI0[i], OutI1[i]);
		or OUT1(OutTmp1[i], OutI2[i], OutI3[i]);
		or OUT2(OutTmp2[i], OutI4[i], OutI5[i]);
		or OUT3(OutTmp3[i], OutI6[i], OutI7[i]);

		or OUT5(OutTmp4[i], OutTmp0[i], OutTmp1[i]);
		or OUT6(OutTmp5[i], OutTmp2[i], OutTmp3[i]);

		or #5 OUT(Out[i], OutTmp4[i], OutTmp5[i]);
	end
endgenerate

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
module Mux32to1_4bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Sel, Out);

input [3:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] Sel;
output [3:0] Out;

wire [3:0] tmp0, tmp1, tmp2, tmp3;

Mux8to1_4bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_4bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));
Mux8to1_4bit MUX2(.I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23), .Sel(Sel[2:0]), .Out(tmp2));
Mux8to1_4bit MUX3(.I0(I24), .I1(I25), .I2(I26), .I3(I27), .I4(I28), .I5(I29), .I6(I30), .I7(I31), .Sel(Sel[2:0]), .Out(tmp3));

Mux4to1_4bit MUXOUT(.I0(tmp0), .I1(tmp1), .I2(tmp2), .I3(tmp3), .Sel(Sel[4:3]), .Out(Out));

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
module Mux32to1_64bit(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Sel, Out);

input [63:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] Sel;
output [63:0] Out;

wire [63:0] tmp0, tmp1, tmp2, tmp3;

Mux8to1_64bit MUX0(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .Sel(Sel[2:0]), .Out(tmp0));
Mux8to1_64bit MUX1(.I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .Sel(Sel[2:0]), .Out(tmp1));
Mux8to1_64bit MUX2(.I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23), .Sel(Sel[2:0]), .Out(tmp2));
Mux8to1_64bit MUX3(.I0(I24), .I1(I25), .I2(I26), .I3(I27), .I4(I28), .I5(I29), .I6(I30), .I7(I31), .Sel(Sel[2:0]), .Out(tmp3));

Mux4to1_64bit MUXOUT(.I0(tmp0), .I1(tmp1), .I2(tmp2), .I3(tmp3), .Sel(Sel[4:3]), .Out(Out));

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
