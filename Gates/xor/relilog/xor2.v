`timescale 1 ns / 1 ns

module xor2(a, b, out);

input a, b;
output out;

assign #5 out = a ^ b;
endmodule
