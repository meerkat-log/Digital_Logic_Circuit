`timescale 1ns/1ns

module PartialFullAdder(a, b, ci, sum, g, p);

input a, b, ci;
output sum, g, p;

assign #10 g = a & b;
assign #5 p = a ^ b;
assign #10 sum = a ^ b ^ ci;

endmodule
