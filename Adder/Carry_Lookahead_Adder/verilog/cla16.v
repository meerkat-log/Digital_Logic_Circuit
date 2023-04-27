module cla16(a, b, ci, co, s, gg, pg);

input [15:0] a, b;
input ci;
output co, gg, pg;
output [15:0] s;

wire c1, c2, c3;
wire p0, p1, p2, p3;
wire g0, g1, g2, g3;
wire carry1_tmp0;
wire carry2_tmp0, carry2_tmp1;
wire carry3_tmp0, carry3_tmp1, carry3_tmp2;
wire carry4_tmp0, carry4_tmp1, carry4_tmp2, carry4_tmp3;
wire gg_tmp0, gg_tmp1, gg_tmp2;

cla4 cla4_0(.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(c1), .s(s[3:0]), .gg(g0), .pg(p0));
cla4 cla4_1(.a(a[7:4]), .b(b[7:4]), .ci(c1), .co(c2), .s(s[7:4]), .gg(g1), .pg(p1));
cla4 cla4_2(.a(a[11:8]), .b(b[11:8]), .ci(c2), .co(c3), .s(s[11:8]), .gg(g2), .pg(p2));
cla4 cla4_3(.a(a[15:12]), .b(b[15:12]), .ci(c3), .co(co), .s(s[15:12]), .gg(g3), .pg(p3));

and2 carry1_0(.a(p0), .b(ci), .out(carry1_tmp0));
or2 carry1_1(.a(g0), .b(carry1_tmp0), .out(c1));

and2 carry2_0(.a(p1), .b(g0), .out(carry2_tmp0));
and3 carry2_1(.a(p1), .b(p0), .c(ci), .out(carry2_tmp1));
or3 carry2_2(.a(g1), .b(carry2_tmp0), .c(carry2_tmp1), .out(c2));

and2 carry3_0(.a(p2), .b(g1), .out(carry3_tmp0));
and3 carry3_1(.a(p2), .b(p1), .c(g0), .out(carry3_tmp1));
and4 carry3_2(.a(p2), .b(p1), .c(p0), .d(ci), .out(carry3_tmp2));
or4 carry3_3(.a(g2), .b(carry3_tmp0), .c(carry3_tmp1), .d(carry3_tmp2), .out(c3));

and2 carry4_0(.a(p3), .b(g2), .out(carry4_tmp0));
and3 carry4_1(.a(p3), .b(p2), .c(g1), .out(carry4_tmp1));
and4 carry4_2(.a(p3), .b(p2), .c(p1), .d(g0), .out(carry4_tmp2));
and5 carry4_3(.a(p3), .b(p2), .c(p1), .d(p0), .e(ci), .out(carry4_tmp3));
or5 carry4_4(.a(g3), .b(carry4_tmp0), .c(carry4_tmp1), .d(carry4_tmp2), .e(carry4_tmp3), .out(co));

and4 pg0(.a(p0), .b(p1), .c(p2), .d(p3), .out(pg));

and2 gg_0(.a(p3), .b(p2), .out(gg_tmp0));
and3 gg_1(.a(p3), .b(p2), .c(g1), .out(gg_tmp1));
and4 gg_2(.a(p3), .b(p2), .c(p1), .d(g0), .out(gg_tmp2));
or4 gg_3(.a(g3), .b(gg_tmp0), .c(gg_tmp1), .d(gg_tmp2), .out(gg));

endmodule
