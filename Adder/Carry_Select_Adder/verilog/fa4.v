module fa4(a, b, ci, s, co);

input [3:0] a, b;
input ci;
output [3:0] s;
output co;

wire c1, c2, c3;

fa fa0(.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]), .co(c1));
fa fa1(.a(a[1]), .b(b[1]), .ci(c1), .s(s[1]), .co(c2));
fa fa2(.a(a[2]), .b(b[2]), .ci(c2), .s(s[2]), .co(c3));
fa fa3(.a(a[3]), .b(b[3]), .ci(c3), .s(s[3]), .co(co));

endmodule