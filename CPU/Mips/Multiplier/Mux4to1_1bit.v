`timescale 1ns/1ns

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
