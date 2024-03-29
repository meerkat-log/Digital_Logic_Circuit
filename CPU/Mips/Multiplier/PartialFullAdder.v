`timescale 1ns/1ns

module PartialFullAdder(A, B, Cin, Sum, G, P);

input A, B, Cin;
output Sum, G, P;

AND2_1bit G_OUT(.A(A), .B(B), .Out(G));
XOR2_1bit P_OUT(.A(A), .B(B), .Out(P));
XOR2_1bit SUM_OUT(.A(P), .B(Cin), .Out(Sum));

endmodule
