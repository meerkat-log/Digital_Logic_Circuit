module fa(a, b, ci, s, co);

input a, b, ci;
output s, co;

wire sum_tmp, carry_tmp0, carry_tmp1;

xor2 sum0(.a(a), .b(b), .out(sum_tmp));
and2 carry0(.a(a), .b(b), .out(carry_tmp0));

xor2 sum1(.a(sum_tmp), .b(ci), .out(s));
and2 carry2(.a(sum_tmp), .b(ci), .out(carry_tmp1));

or2 carry3(.a(carry_tmp0), .b(carry_tmp1), .out(co));

endmodule
