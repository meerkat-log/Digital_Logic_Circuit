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
