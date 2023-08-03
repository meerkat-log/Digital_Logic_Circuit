module CarryLookaheadAdder_3bit(A, B, Cin, Sum, Cout);

input [2:0] A, B;
input Cin;
output [2:0] Sum;
output Cout;

wire p0, p1, p2;
wire g0, g1, g2;
wire c1, c2;
wire c1_tmp0;
wire c2_tmp0, c2_tmp1;
wire c3_tmp0, c3_tmp1, c3_tmp2;

PartialFullAdder PFA0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .G(g0), .P(p0));
PartialFullAdder PFA1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .G(g1), .P(p1));
PartialFullAdder PFA2(.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .G(g2), .P(p2));

AND2_1bit CLA3_C1_TMP0(.A(p0), .B(Cin), .Out(c1_tmp0));
OR2_1bit CLA3_C1(.A(g0), .B(c1_tmp0), .Out(c1));

AND3_1bit CLA3_C2_TMP0(.A(p1), .B(p0), .C(Cin), .Out(c2_tmp0));
AND2_1bit CLA3_C2_TMP1(.A(p1), .B(g0), .Out(c2_tmp1));
OR3_1bit CLA3_C2(.A(g1), .B(c2_tmp0), .C(c2_tmp1), .Out(c2));

AND4_1bit CLA3_C3_TMP0(.A(p2), .B(p1), .C(p0), .D(Cin), .Out(c3_tmp0));
AND3_1bit CLA3_C3_TMP1(.A(p2), .B(p1), .C(g0), .Out(c3_tmp1));
AND2_1bit CLA3_C3_TMP2(.A(p2), .B(g1), .Out(c3_tmp2));
OR4_1bit CLA3_C3(.A(g2), .B(c3_tmp0), .C(c3_tmp1), .D(c3_tmp2), .Out(Cout));

endmodule

