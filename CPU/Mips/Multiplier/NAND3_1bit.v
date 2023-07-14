module NAND3_1bit(A, B, C, Out);

input A, B, C;
output Out;

wire Tmp;

AND3_1bit AND(.A(A), .B(B), .C(C), .Out(Tmp));
NOT_1bit NOT(.A(Tmp), .Out(Out));

endmodule
