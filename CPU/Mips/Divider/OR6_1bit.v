module OR6_1bit(A, B, C, D, E, F, Out);

input A, B, C, D, E, F;
output Out;

wire tmp0, tmp1, tmp2, tmp3;

OR2_1bit OR2_0(.A(A), .B(B), .Out(tmp0));
OR2_1bit OR2_1(.A(C), .B(D), .Out(tmp1));
OR2_1bit OR2_2(.A(E), .B(F), .Out(tmp2));
OR2_1bit OR2_3(.A(tmp0), .B(tmp1), .Out(tmp3));
OR2_1bit OR2_4(.A(tmp3), .B(tmp2), .Out(Out));

endmodule
