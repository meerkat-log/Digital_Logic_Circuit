`timescale 1ns/1ns

module full_adder(a, b, ci, sum, co);

input a, b, ci;
output sum, co;

assign #10 sum = (a ^ b) ^ ci;
assign #25 co = ((a ^ b) & ci) | (a & b);

endmodule