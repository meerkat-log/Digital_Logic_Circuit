`timescale 1ns/10ps

module mux_21(a, b, sel, out);

input [3:0] a, b;
input sel;
output [3:0] out;

assign #5 out = ~sel ? a : b;  

endmodule