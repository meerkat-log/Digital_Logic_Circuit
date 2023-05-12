`timescale 1ns/10ps

module or2(a, b, out);

input a, b;
output out;

assign #10 out = a | b;

endmodule