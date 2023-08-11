`timescale 1ns/1ns

module XOR2_64bit(A, B, Out);

input [63:0] A, B;
output [63:0] Out;

assign #5 Out = A ^ B;

endmodule
