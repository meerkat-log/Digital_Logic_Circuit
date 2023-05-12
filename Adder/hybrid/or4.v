`timescale 1ns/10ps

module or4(a, b, c, d, out);

input a, b, c, d;
output out;

assign #10 out = a | b | c | d;

endmodule
