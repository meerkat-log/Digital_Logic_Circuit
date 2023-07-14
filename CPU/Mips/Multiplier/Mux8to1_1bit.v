`timescale 1ns/1ns

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
