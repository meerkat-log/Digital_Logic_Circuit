`timescale 1ns/10ps

module or3(a, b, c, out);

input a, b, c;
output out;

assign #10 out = a | b | c;

endmodule
