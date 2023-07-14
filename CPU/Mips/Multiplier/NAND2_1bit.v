module NAND2_1bit(A, B, Out);

input A, B;
output Out;

wire Tmp;

AND2_1bit AND(.A(A), .B(B), .Out(Tmp));
NOT_1bit NOT(.A(Tmp), .Out(Out));

endmodule
