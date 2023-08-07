`timescale 1ns/1ns

module NOT_1bit(A, Out);

input A;
output Out;

assign #5 Out = ~A;

endmodule
