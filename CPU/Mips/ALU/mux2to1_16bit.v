`timescale 1ns/1ns

module mux2to1_16bit(i0, i1, sel, out);

input [15:0] i0, i1;
input sel;
output [15:0] out;

assign #5 out = ~sel ? i0 : i1;

endmodule
