module AND3_1bit(A, B, C, Out);

input A, B, C;
output Out;

wire tmp0;

AND2_1bit AND2_0(.A(A), .B(B), .Out(tmp0));
AND2_1bit AND2_1(.A(tmp0), .B(C), .Out(Out));

endmodule
