`timescale 1ns/1ns

module NOT_64bit(A, Out);

input [63:0] A;
output [63:0] Out;

assign #5 Out = ~A;

endmodule
