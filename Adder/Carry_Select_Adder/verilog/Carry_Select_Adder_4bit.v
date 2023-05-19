module Carry_Select_Adder_4bit(a, b, ci, sum, co);

input [3:0] a, b;
input ci;
output [3:0] sum;
output co;

wire [3:0] fa4_0_sum_tmp, fa4_1_sum_tmp;
wire fa4_0_co_tmp, fa4_1_co_tmp;

full_adder_4bit fa4_0(.a(a), .b(b), .ci(1'b0), .sum(fa4_0_sum_tmp), .co(fa4_0_co_tmp));
full_adder_4bit fa4_1(.a(a), .b(b), .ci(1'b1), .sum(fa4_1_sum_tmp), .co(fa4_1_co_tmp));

mux2_to_1 mux_sum(.i0(fa4_0_sum_tmp), .i1(fa4_1_sum_tmp), .sel(ci), .out(sum));
mux2_to_1 mux_co(.i0(fa4_0_co_tmp), .i1(fa4_1_co_tmp), .sel(ci), .out(co));

endmodule
