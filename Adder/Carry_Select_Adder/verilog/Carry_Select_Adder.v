module Carry_Select_Adder(a, b, ci, sum, co);

input [15:0] a, b;
input ci;
output [15:0] sum;
output co;

wire c4, c8, c12;

full_adder_4bit fa4(.a(a[3:0]), .b(b[3:0]), .ci(ci), .sum(sum[3:0]), .co(c4));
Carry_Select_Adder_4bit csa8(.a(a[7:4]), .b(b[7:4]), .ci(c4), .sum(sum[7:4]), .co(c8));
Carry_Select_Adder_4bit csa12(.a(a[11:8]), .b(b[11:8]), .ci(c8), .sum(sum[11:8]), .co(c12));
Carry_Select_Adder_4bit csa16(.a(a[15:12]), .b(b[15:12]), .ci(c12), .sum(sum[15:12]), .co(co));

endmodule
