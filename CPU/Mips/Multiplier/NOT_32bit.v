`timescale 1ns/1ns

module NOT_32bit(A, Out);

input [31:0] A;
output [31:0] Out;

assign #5 Out = ~A;

endmodule
