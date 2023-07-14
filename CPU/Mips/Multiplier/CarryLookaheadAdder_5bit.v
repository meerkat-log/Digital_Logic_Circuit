module CarryLookaheadAdder_5bit(A, B, Cin, Sum, Cout);

input [4:0] A, B;
input Cin;
output [4:0] Sum;
output Cout;

wire p0, p1, p2, p3, p4;
wire g0, g1, g2, g3, g4;
wire c1, c2, c3, c4;
wire c1_tmp0;
wire c2_tmp0, c2_tmp1;
wire c3_tmp0, c3_tmp1, c3_tmp2;
wire c4_tmp0, c4_tmp1, c4_tmp2, c4_tmp3;
wire c5_tmp0, c5_tmp1, c5_tmp2, c5_tmp3, c5_tmp4;

PartialFullAdder PFA0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .G(g0), .P(p0));
PartialFullAdder PFA1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .G(g1), .P(p1));
PartialFullAdder PFA2(.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .G(g2), .P(p2));
PartialFullAdder PFA3(.A(A[3]), .B(B[3]), .Cin(c3), .Sum(Sum[3]), .G(g3), .P(p3));
PartialFullAdder PFA4(.A(A[4]), .B(B[4]), .Cin(c4), .Sum(Sum[4]), .G(g4), .P(p4));

AND2_1bit CLA5_C1_TMP0(.A(p0), .B(Cin), .Out(c1_tmp0));
OR2_1bit CLA5_C1(.A(g0), .B(c1_tmp0), .Out(c1));

AND3_1bit CLA5_C2_TMP0(.A(p1), .B(p0), .C(Cin), .Out(c2_tmp0));
AND2_1bit CLA5_C2_TMP1(.A(p1), .B(g0), .Out(c2_tmp1));
OR3_1bit CLA5_C2(.A(g1), .B(c2_tmp0), .C(c2_tmp1), .Out(c2));

AND4_1bit CLA5_C3_TMP0(.A(p2), .B(p1), .C(p0), .D(Cin), .Out(c3_tmp0));
AND3_1bit CLA5_C3_TMP1(.A(p2), .B(p1), .C(g0), .Out(c3_tmp1));
AND2_1bit CLA5_C3_TMP2(.A(p2), .B(g1), .Out(c3_tmp2));
OR4_1bit CLA5_C3(.A(g2), .B(c3_tmp0), .C(c3_tmp1), .D(c3_tmp2), .Out(c3));

AND5_1bit CLA5_C4_TMP0(.A(p3), .B(p2), .C(p1), .D(p0), .E(Cin), .Out(c4_tmp0));
AND4_1bit CLA5_C4_TMP1(.A(p3), .B(p2), .C(p1), .D(g0), .Out(c4_tmp1));
AND3_1bit CLA5_C4_TMP2(.A(p3), .B(p2), .C(g1), .Out(c4_tmp2));
AND2_1bit CLA5_C4_TMP3(.A(p3), .B(g2), .Out(c4_tmp3));
OR5_1bit CLA5_C4(.A(g3), .B(c4_tmp0), .C(c4_tmp1), .D(c4_tmp2), .E(c4_tmp3), .Out(c4));

AND6_1bit CLA5_C5_TMP0(.A(p4), .B(p3), .C(p2), .D(p1), .E(p0), .F(Cin), .Out(c5_tmp0));
AND5_1bit CLA5_C5_TMP1(.A(p4), .B(p3), .C(p2), .D(p1), .E(g0), .Out(c5_tmp1));
AND4_1bit CLA5_C5_TMP2(.A(p4), .B(p3), .C(p2), .D(g1), .Out(c5_tmp2));
AND3_1bit CLA5_C5_TMP3(.A(p4), .B(p3), .C(g2), .Out(c5_tmp3));
AND2_1bit CLA5_C5_TMP4(.A(p4), .B(g3), .Out(c5_tmp4));
OR6_1bit CLA5_C5(.A(g4), .B(c5_tmp0), .C(c5_tmp1), .D(c5_tmp2), .E(c5_tmp3), .F(c5_tmp4), .Out(Cout));

endmodule

