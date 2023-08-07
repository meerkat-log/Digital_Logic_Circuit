`timescale 1ns/1ns

module AND5_1bit(A, B, C, D, E, Out);

input A, B, C, D, E;
output Out;

wire tmp0, tmp1, tmp2;

AND2_1bit AND2_0(.A(A), .B(B), .Out(tmp0));
AND2_1bit AND2_1(.A(C), .B(D), .Out(tmp1));
AND2_1bit AND2_2(.A(tmp0), .B(tmp1), .Out(tmp2));
AND2_1bit AND2_3(.A(tmp2), .B(E), .Out(Out));

endmodule

