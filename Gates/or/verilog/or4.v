`timescale 1 ns / 1 ns

module or4(a, b, c, d, out);

input a, b, c, d;
output out;

assign #10 out = a | b | c | d;
endmodule
