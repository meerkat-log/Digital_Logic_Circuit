module full_adder(a, b, ci, s, co);

input a, b, ci;
output s, co;

wire sum_tmp, carry_tmp_0, carry_tmp_1;

xor2 sum_0(.a(a), .b(b), .out(sum_tmp));
and2 carry_0(.a(a), .b(b), .out(carry_tmp_0));

xor2 sum_1(.a(sum_tmp), .b(ci), .out(s));
and2 carry_2(.a(sum_tmp), .b(ci), .out(carry_tmp_1));

or2 carry_3(.a(carry_tmp_0), .b(carry_tmp_1), .out(co));

endmodule
