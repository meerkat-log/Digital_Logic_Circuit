`timescale 1ns/10ps;

module xor2(a, b, out);

input a, b;
output out;

assign #5 out = a ^ b;

endmodule