`timescale 1 ns / 1 ns

module or3(a, b, c, out);

input a, b, c;
output out;

assign #10 out = a | b | c;
endmodule
