`timescale 1ns/1ns

module carry_lookahead_for_mux(a, b, ci, c2, c4, c7, c11);

input [11:0] a, b;
input ci;
output c2, c4, c7, c11;

wire p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10;
wire g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10;

partial_full_adder pfa0(.a(a[0]), .b(b[0]), .g(g0), .p(p0));
partial_full_adder pfa1(.a(a[1]), .b(b[1]), .g(g1), .p(p1));
partial_full_adder pfa2(.a(a[2]), .b(b[2]), .g(g2), .p(p2));
partial_full_adder pfa3(.a(a[3]), .b(b[3]), .g(g3), .p(p3));
partial_full_adder pfa4(.a(a[4]), .b(b[4]), .g(g4), .p(p4));
partial_full_adder pfa5(.a(a[5]), .b(b[5]), .g(g5), .p(p5));
partial_full_adder pfa6(.a(a[6]), .b(b[6]), .g(g6), .p(p6));
partial_full_adder pfa7(.a(a[7]), .b(b[7]), .g(g7), .p(p7));
partial_full_adder pfa8(.a(a[8]), .b(b[8]), .g(g8), .p(p8));
partial_full_adder pfa9(.a(a[9]), .b(b[9]), .g(g9), .p(p9));
partial_full_adder pfa10(.a(a[10]), .b(b[10]), .g(g10), .p(p10));

assign #20 c2 = g1 | (p1 & g0) | (p1 & p0 & ci);
assign #20 c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & ci);
assign #20 c7 = g6 | (p6 & g5) | (p6 & p5 & g4) | (p6 & p5 & p4 & g3) | (p6 & p5 & p4 & p3 & g2) | (p6 & p5 & p4 & p3 & p2 & g1) | (p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p6 & p5 & p4 & p3 &p2 & p1 & p0 & ci);
assign #20 c11 = g10 | (p10 & g9) | (p10 & p9 & g8) | (p10 & p9 & p8 & g7) | (p10 & p9 & p8 & p7 & g6) | (p10 & p9 & p8 & p7 & p6 & g5) | (p10 & p9 & p8 & p7 & p6 & p5 & g4) | 
		(p10 & p9 & p8 & p7 & p6 & p5 & p4 & g3) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & g2) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & g1) | 
		(p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p10 & p9 & p8 & p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & ci);

endmodule
