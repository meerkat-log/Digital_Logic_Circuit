`timescale 1ns/1ns

module XOR2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #5 Out = A ^ B;

endmodule

