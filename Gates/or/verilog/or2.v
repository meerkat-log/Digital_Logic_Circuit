`timescale 1 ns / 1 ns

module or2(a, b, out);

input a, b;
output out;

assign #10 out = a | b;
endmodule
