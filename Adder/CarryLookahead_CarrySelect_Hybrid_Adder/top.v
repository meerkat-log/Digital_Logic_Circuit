module top(a, b, ci, sum, co);

input [15:0] a, b;
input ci;
output [15:0] sum;
output co;

wire c2, c4, c7, c11;

carry_lookahead_adder cla2(.n(3'd2), .a(a[1:0]), .b(b[1:0]), .ci(ci), .sum(sum[1:0]), .co(c2));
carry_select_adder csa2(.n(3'd2), .a(a[3:2]), .b(b[3:2]), .ci(c2), .sum(sum[3:2]), .co(c4));
carry_select_adder csa3(.n(3'd3), .a(a[6:4]), .b(b[6:4]), .ci(c4), .sum(sum[6:4]), .co(c7));
carry_select_adder csa4(.n(3'd4), .a(a[10:7]), .b(b[10:7]), .ci(c7), .sum(sum[10:7]), .co(c11));
carry_select_adder cas5(.n(3'd5), .a(a[15:11]), .b(b[15:11]), .ci(c11), .sum(sum[15:11]), .co(co));

endmodule
