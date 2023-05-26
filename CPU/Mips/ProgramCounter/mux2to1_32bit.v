module mux2to1_32bit(i0, i1, sel, out);

input [31:0] i0, i1;
input sel;
output [31:0] out;

assign out = ~sel ? i0 : i1;

endmodule
