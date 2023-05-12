`timescale 1ns/10ps

module or5(a, b, c, d, e, out);

input a, b, c, d, e;
output out;

assign #10 out = a | b | c | d | e;

endmodule