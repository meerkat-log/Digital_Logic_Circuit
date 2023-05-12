module hybrid(a, b, ci, s, co);

input ci;
input [15:0] a, b;
output [15:0] s;
output co;

wire c4, c8, c12;

carry_generate carry(.a(a), .b(b), .ci(ci), .c4(c4), .c8(c8), .c12(c12), .c16(co));
select_adder sum(.a(a), .b(b), .ci(ci), .c4(c4), .c8(c8), .c12(c12), .s(s));

endmodule