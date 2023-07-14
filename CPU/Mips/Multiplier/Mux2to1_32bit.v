`timescale 1ns/1ns

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
