module CarryLookaheadAdder_2bit(A, B, Cin, Sum, Cout);

input [1:0] A, B;
input Cin;
output [1:0] Sum;
output Cout;

wire p0, p1;
wire g0, g1;
wire c1;
wire c2_tmp0, c2_tmp1;

PartialFullAdder PFA0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .G(g0), .P(p0));
PartialFullAdder PFA1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .G(g1), .P(p1));

AND2_1bit CLA2_C1_TMP0(.A(p0), .B(Cin), .Out(c1_tmp0));
OR2_1bit CLA2_C1(.A(g0), .B(c1_tmp0), .Out(c1));

AND3_1bit CLA2_C2_TMP0(.A(p1), .B(p0), .C(Cin), .Out(c2_tmp0));
AND2_1bit CLA2_C2_TMP1(.A(p1), .B(g0), .Out(c2_tmp1));
OR3_1bit CLA2_C2(.A(g1), .B(c2_tmp0), .C(c2_tmp1), .Out(Cout));

endmodule