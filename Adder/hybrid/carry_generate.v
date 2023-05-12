`timescale 1ns/10ps

module carry_generate(a, b, ci, c4, c8, c12, c16);

input ci;
input [15:0] a, b;
output c4, c8, c12, c16;

wire g0, g1, g2, g3;
wire p0, p1, p2, p3;
wire g4_0_or_g1g0, g4_0_or_g3g2, g4_0_and_p2p1, g4_0_and_tmp, g4_0_tmp, g4_0;
wire p4_0_tmp, p4_0;
wire g4, g5, g6, g7;
wire p4, p5, p6, p7;
wire g4_1_or_g5g4, g4_1_or_g7g6, g4_1_and_p6p5, g4_1_and_tmp, g4_1_tmp, g4_1;
wire p4_1_tmp, p4_1;
wire g8, g9, g10, g11;
wire p8, p9, p10, p11;
wire g4_2_or_g9g8, g4_2_or_g11g10, g4_2_and_p10p9, g4_2_and_tmp, g4_2_tmp, g4_2;
wire p4_2_tmp, p4_2;
wire g12, g13, g14, g15;
wire p12, p13, p14, p15;
wire g4_3_or_g13g12, g4_3_or_g15g14, g4_3_and_p14p13, g4_3_and_tmp, g4_3_tmp, g4_3;
wire p4_3_tmp, p4_3;
wire c4_tmp_0, c4_tmp_1;
wire c8_tmp_0, c8_tmp_1, c8_tmp_2;
wire c12_tmp_0, c12_tmp_1, c12_tmp_2, c12_tmp_3;
wire c16_tmp_0, c16_tmp_1, c16_tmp_2, c16_tmp_3, c16_tmp_4;


//G4_0
partial_full_adder pfa_0(.a(a[0]), .b(b[0]), .g(g0), .p(p0));
partial_full_adder pfa_1(.a(a[1]), .b(b[1]), .g(g1), .p(p1));
partial_full_adder pfa_2(.a(a[2]), .b(b[2]), .g(g2), .p(p2));
partial_full_adder pfa_3(.a(a[3]), .b(b[3]), .g(g3), .p(p3));
or2 g4_0_g1g0(.a(g1), .b(g0), .out(g4_0_or_g1g0));
or2 g4_0_g3g2(.a(g3), .b(g2), .out(g4_0_or_g3g2));
and2 g4_0_p2p1(.a(p2), .b(p1), .out(g4_0_and_p2p1));
and2 g4_0_and(.a(g4_0_and_p2p1), .b(g4_0_or_g1g0), .out(g4_0_and_tmp));
or2 g4_0_or(.a(g4_0_or_g3g2), .b(g4_0_and_tmp), .out(g4_0_tmp));
and2 g4_0_final(.a(p3), .b(g4_0_tmp), .out(g4_0));
//P4_0
and3 p4_0_group(.a(p2), .b(p1), .c(p0), .out(p4_0_tmp));
and4 p4_0_final(.a(p3), .b(p2), .c(p1), .d(p0), .out(p4_0));


//G4_1
partial_full_adder pfa_4(.a(a[4]), .b(b[4]), .g(g4), .p(p4));
partial_full_adder pfa_5(.a(a[5]), .b(b[5]), .g(g5), .p(p5));
partial_full_adder pfa_6(.a(a[6]), .b(b[6]), .g(g6), .p(p6));
partial_full_adder pfa_7(.a(a[7]), .b(b[7]), .g(g7), .p(p7));
or2 g4_1_g5g4(.a(g5), .b(g4), .out(g4_1_or_g5g4));
or2 g4_1_g7g6(.a(g7), .b(g6), .out(g4_1_or_g7g6));
and2 g4_1_p6p5(.a(p6), .b(p5), .out(g4_1_and_p6p5));
and2 g4_1_and(.a(g4_1_and_p6p5), .b(g4_1_or_g5g4), .out(g4_1_and_tmp));
or2 g4_1_or(.a(g4_1_or_g7g6), .b(g4_1_and_tmp), .out(g4_1_tmp));
and2 g4_1_final(.a(p7), .b(g4_1_tmp), .out(g4_1));
//P4_1
and4 p4_1_group(.a(p6), .b(p5), .c(p4), .d(p3), .out(p4_1_tmp));
and4 p4_1_final(.a(p7), .b(p6), .c(p5), .d(p4), .out(p4_1));


//G4_2
partial_full_adder pfa_8(.a(a[8]), .b(b[8]), .g(g8), .p(p8));
partial_full_adder pfa_9(.a(a[9]), .b(b[9]), .g(g9), .p(p9));
partial_full_adder pfa_10(.a(a[10]), .b(b[10]), .g(g10), .p(p10));
partial_full_adder pfa_11(.a(a[11]), .b(b[11]), .g(g11), .p(p11));
or2 g4_2_g9g8(.a(g9), .b(g8), .out(g4_2_or_g9g8));
or2 g4_2_g11g10(.a(g11), .b(g10), .out(g4_2_or_g11g10));
and2 g4_2_p10p9(.a(p10), .b(p9), .out(g4_2_and_p10p9));
and2 g4_2_and(.a(g4_2_and_p10p9), .b(g4_2_or_g9g8), .out(g4_2_and_tmp));
or2 g4_2_or(.a(g4_2_or_g11g10), .b(g4_2_and_tmp), .out(g4_2_tmp));
and2 g4_2_final(.a(p11), .b(g4_2_tmp), .out(g4_2));
//P4_2
and4 p4_2_group(.a(p10), .b(p9), .c(p8), .d(p7), .out(p4_2_tmp));
and4 p4_2_final(.a(p11), .b(p10), .c(p9), .d(p8), .out(p4_2));


//G4_3
partial_full_adder pfa_12(.a(a[12]), .b(b[12]), .g(g12), .p(p12));
partial_full_adder pfa_13(.a(a[13]), .b(b[13]), .g(g13), .p(p13));
partial_full_adder pfa_14(.a(a[14]), .b(b[14]), .g(g14), .p(p14));
partial_full_adder pfa_15(.a(a[15]), .b(b[15]), .g(g15), .p(p15));
or2 g4_3_g13g12(.a(g13), .b(g12), .out(g4_3_or_g13g12));
or2 g4_3_g15g14(.a(g15), .b(g14), .out(g4_3_or_g15g14));
and2 g4_3_p14p13(.a(p14), .b(p13), .out(g4_3_and_p14p13));
and2 g4_3_and(.a(g4_3_and_p14p13), .b(g4_3_or_g13g12), .out(g4_3_and_tmp));
or2 g4_3_or(.a(g4_3_or_g15g14), .b(g4_3_and_tmp), .out(g4_3_tmp));
and2 g4_3_final(.a(p15), .b(g4_3_tmp), .out(g4_3));
//P4_3
and4 p4_3_group(.a(p14), .b(p13), .c(p12), .d(p11), .out(p4_3_tmp));
and4 p4_3_out(.a(p15), .b(p14), .c(p13), .d(p12), .out(p4_3));


//C4
and2 c4_0(.a(p4_0_tmp), .b(ci), .out(c4_tmp_0));
or2 c4_1(.a(g4_0_tmp), .b(c4_tmp_0), .out(c4_tmp_1));
and2 c4_out(.a(p3), .b(c4_tmp_1), .out(c4));

//C8
and3 c8_0(.a(p4_1_tmp), .b(p4_0_tmp), .c(ci), .out(c8_tmp_0));
and2 c8_1(.a(p4_1_tmp), .b(g4_0_tmp), .out(c8_tmp_1));
or3 c8_2(.a(g4_1_tmp), .b(c8_tmp_1), .c(c8_tmp_0), .out(c8_tmp_2));
and2 c8_out(.a(p7), .b(c8_tmp_2), .out(c8));

//C12
and4 c12_0(.a(p4_2_tmp), .b(p4_1_tmp), .c(p4_0_tmp), .d(ci), .out(c12_tmp_0));
and3 c12_1(.a(p4_2_tmp), .b(p4_1_tmp), .c(g4_0_tmp), .out(c12_tmp_1));
and2 c12_2(.a(p4_2_tmp), .b(g4_1_tmp), .out(c12_tmp_2));
or4 c12_3(.a(g4_2_tmp), .b(c12_tmp_0), .c(c12_tmp_1), .d(c12_tmp_2), .out(c12_tmp_3));
and2 c12_out(.a(p11), .b(c12_tmp_3), .out(c12));

//C16
and5 c16_0(.a(p4_3_tmp), .b(p4_2_tmp), .c(p4_1_tmp), .d(p4_0_tmp), .e(ci), .out(c16_tmp_0));
and4 c16_1(.a(p4_3_tmp), .b(p4_2_tmp), .c(p4_1_tmp), .d(g4_0_tmp), .out(c16_tmp_1));
and3 c16_2(.a(p4_3_tmp), .b(p4_2_tmp), .c(g4_1_tmp), .out(c16_tmp_2));
and2 c16_3(.a(p4_3_tmp), .b(g4_2_tmp), .out(c16_tmp_3));
or5 c16_4(.a(g4_3_tmp), .b(c16_tmp_0), .c(c16_tmp_1), .d(c16_tmp_2), .e(c16_tmp_3), .out(c16_tmp_4));
and2 c16_out(.a(p15), .b(c16_tmp_4), .out(c16));
endmodule
