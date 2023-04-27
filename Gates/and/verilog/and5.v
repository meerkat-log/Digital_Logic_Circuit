`timescale 1 ns / 1 ns

module and5(a, b, c, d, e, out);

input a, b, c, d, e;
output out;

assign #10 out = a & b & c & d & e;
endmodule
