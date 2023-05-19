module full_adder_4bit(a, b, ci, sum, co);

input [3:0] a, b;
input ci;
output [3:0] sum;
output co;

wire c1, c2, c3;

full_adder fa0(.a(a[0]), .b(b[0]), .ci(ci), .sum(sum[0]), .co(c1));
full_adder fa1(.a(a[1]), .b(b[1]), .ci(c1), .sum(sum[1]), .co(c2));
full_adder fa2(.a(a[2]), .b(b[2]), .ci(c2), .sum(sum[2]), .co(c3));
full_adder fa3(.a(a[3]), .b(b[3]), .ci(c3), .sum(sum[3]), .co(co));

endmodule
