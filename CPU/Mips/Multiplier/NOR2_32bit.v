`timescale 1ns/1ns

module NOR2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #15 Out = ~(A | B);

endmodule
