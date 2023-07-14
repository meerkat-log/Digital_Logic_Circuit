`timescale 1ns/1ns

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
