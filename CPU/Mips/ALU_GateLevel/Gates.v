`timescale 1ns/1ns

module AND2(A, B, Out);

input A, B;
output Out;

assign #10 Out = A & B;

endmodule
module AND2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #10 Out = A & B;

endmodule
module AND3(A, B, C, Out);

input A, B, C;
output Out;

wire tmp0;

AND2 AND2_0(.A(A), .B(B), .Out(tmp0));
AND2 AND2_1(.A(tmp0), .B(C), .Out(Out));

endmodule
module AND4(A, B, C, D, Out);

input A, B, C, D;
output Out;

wire tmp0, tmp1;

AND2  AND2_0(.A(A), .B(B), .Out(tmp0));
AND2  AND2_1(.A(C), .B(D), .Out(tmp1));
AND2  AND2_2(.A(tmp0), .B(tmp1), .Out(Out));

endmodule
module AND5(A, B, C, D, E, Out);

input A, B, C, D, E;
output Out;

wire tmp0, tmp1, tmp2;

AND2 AND2_0(.A(A), .B(B), .Out(tmp0));
AND2 AND2_1(.A(C), .B(D), .Out(tmp1));
AND2 AND2_2(.A(tmp0), .B(tmp1), .Out(tmp2));
AND2 AND2_3(.A(tmp2), .B(E), .Out(Out));

endmodule
module AND6(A, B, C, D, E, F, Out);

input A, B, C, D, E, F;
output Out;

wire tmp0, tmp1, tmp2, tmp3;

AND2 AND2_0(.A(A), .B(B), .Out(tmp0));
AND2 AND2_1(.A(C), .B(D), .Out(tmp1));
AND2 AND2_2(.A(E), .B(F), .Out(tmp2));
AND2 AND2_3(.A(tmp0), .B(tmp1), .Out(tmp3));
AND2 AND2_4(.A(tmp3), .B(tmp2), .Out(Out));

endmodule



module OR2(A, B, Out);

input A, B;
output Out;

assign #10 Out = A | B;

endmodule
module OR2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #10 Out = A | B;

endmodule
module OR3(A, B, C, Out);

input A, B, C;
output Out;

wire tmp0;

OR2 OR2_0(.A(A), .B(B), .Out(tmp0));
OR2 OR2_1(.A(tmp0), .B(C), .Out(Out));

endmodule
module OR4(A, B, C, D, Out);

input A, B, C, D;
output Out;

wire tmp0, tmp1;

OR2 OR2_0(.A(A), .B(B), .Out(tmp0));
OR2 OR2_1(.A(C), .B(D), .Out(tmp1));
OR2 OR2_2(.A(tmp0), .B(tmp1), .Out(Out));

endmodule
module OR5(A, B, C, D, E, Out);

input A, B, C, D, E;
output Out;

wire tmp0, tmp1, tmp2;

OR2 OR2_0(.A(A), .B(B), .Out(tmp0));
OR2 OR2_1(.A(C), .B(D), .Out(tmp1));
OR2 OR2_2(.A(tmp0), .B(tmp1), .Out(tmp2));
OR2 OR2_3(.A(tmp2), .B(E), .Out(Out));

endmodule
module OR6(A, B, C, D, E, F, Out);

input A, B, C, D, E, F;
output Out;

wire tmp0, tmp1, tmp2, tmp3;

OR2 OR2_0(.A(A), .B(B), .Out(tmp0));
OR2 OR2_1(.A(C), .B(D), .Out(tmp1));
OR2 OR2_2(.A(E), .B(F), .Out(tmp2));
OR2 OR2_3(.A(tmp0), .B(tmp1), .Out(tmp3));
OR2 OR2_4(.A(tmp3), .B(tmp2), .Out(Out));

endmodule


module XOR2(A, B, Out);

input A, B;
output Out;

assign #5 Out = A ^ B;

endmodule
module XOR2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #5 Out = A ^ B;

endmodule


module NOT1(A, Out);

input A;
output Out;

assign #5 Out = ~A;

endmodule
module NOT32(A, Out);

input [31:0] A;
output [31:0] Out;

assign #5 Out = ~A;

endmodule


module NAND2(A, B, Out);

input A, B;
output Out;

assign #15 Out = ~(A & B);

endmodule

module NOR2(A, B, Out);

input A, B;
output Out;

assign #15 Out = ~(A | B);

endmodule
module NOR2_32bit(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

assign #15 Out = ~(A | B);

endmodule