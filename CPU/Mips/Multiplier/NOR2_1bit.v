`timescale 1ns/1ns

module NOR2_1bit(A, B, Out);

input A, B;
output Out;

assign #15 Out = ~(A | B);

endmodule
