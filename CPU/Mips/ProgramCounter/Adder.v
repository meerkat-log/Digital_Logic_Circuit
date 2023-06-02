module Adder(a, b, sum);

input [31:0] a, b;
output [31:0] sum;

wire c2, c4, c7, c11, c16;
wire c2_0, c4_0, c7_0, c11_0, c16_0;
wire c2_1, c4_1, c7_1, c11_1, c16_1;
wire [15:0] high_sum_0, high_sum_1;

CarryLookaheadAdder cla2(.n(3'd2), .a(a[1:0]), .b(b[1:0]), .ci(1'b0), .sum(sum[1:0]), .co(c2));
CarrySelectAdder csa2(.n(3'd2), .a(a[3:2]), .b(b[3:2]), .ci(c2), .sum(sum[3:2]), .co(c4));
CarrySelectAdder csa3(.n(3'd3), .a(a[6:4]), .b(b[6:4]), .ci(c4), .sum(sum[6:4]), .co(c7));
CarrySelectAdder csa4(.n(3'd4), .a(a[10:7]), .b(b[10:7]), .ci(c7), .sum(sum[10:7]), .co(c11));
CarrySelectAdder cas5(.n(3'd5), .a(a[15:11]), .b(b[15:11]), .ci(c11), .sum(sum[15:11]), .co(c16));


CarryLookaheadAdder high_cla2_0(.n(3'd2), .a(a[17:16]), .b(b[17:16]), .ci(1'b0), .sum(high_sum_0[1:0]), .co(c2_0));
CarrySelectAdder high_csa2_0(.n(3'd2), .a(a[19:18]), .b(b[19:18]), .ci(c2_0), .sum(high_sum_0[3:2]), .co(c4_0));
CarrySelectAdder high_csa3_0(.n(3'd3), .a(a[22:20]), .b(b[22:20]), .ci(c4_0), .sum(high_sum_0[6:4]), .co(c7_0));
CarrySelectAdder high_csa4_0(.n(3'd4), .a(a[26:23]), .b(b[26:23]), .ci(c7_0), .sum(high_sum_0[10:7]), .co(c11_0));
CarrySelectAdder high_cas5_0(.n(3'd5), .a(a[31:27]), .b(b[31:27]), .ci(c11_0), .sum(high_sum_0[15:11]), .co(c16_0));

CarryLookaheadAdder high_cla2_1(.n(3'd2), .a(a[17:16]), .b(b[17:16]), .ci(1'b1), .sum(high_sum_1[1:0]), .co(c2_1));
CarrySelectAdder high_csa2_1(.n(3'd2), .a(a[19:18]), .b(b[19:18]), .ci(c2_1), .sum(high_sum_1[3:2]), .co(c4_1));
CarrySelectAdder high_csa3_1(.n(3'd3), .a(a[22:20]), .b(b[22:20]), .ci(c4_1), .sum(high_sum_1[6:4]), .co(c7_1));
CarrySelectAdder high_csa4_1(.n(3'd4), .a(a[26:23]), .b(b[26:23]), .ci(c7_1), .sum(high_sum_1[10:7]), .co(c11_1));
CarrySelectAdder high_cas5_1(.n(3'd5), .a(a[31:27]), .b(b[31:27]), .ci(c11_1), .sum(high_sum_1[15:11]), .co(c16_1));

mux2to1_16bit mux16(.i0(high_sum_0), .i1(high_sum_1), .sel(c16), .out(sum[31:16]));

endmodule
