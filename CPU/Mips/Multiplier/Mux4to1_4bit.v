`timescale 1ns/1ns

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
