module AdderAndSubtractor_32bit(A, B, Cin, Cout, Out);

input [31:0] A, B;
input Cin;
output Cout;
output [31:0] Out;

wire [31:0] B_Sign;

wire c2, c4, c7, c11, c16;
wire c18_0, c20_0, c23_0, c27_0, c32_0;
wire c18_1, c20_1, c23_1, c27_1, c32_1;
wire [15:0] high_sum_0, high_sum_1;

XOR2_32bit XOR_SIGN(.A(B), .B({32{Cin}}), .Out(B_Sign));

//Low 16bit
CarryLookaheadAdder_2bit CLA2_16(.A(A[1:0]), .B(B_Sign[1:0]), .Cin(Cin), .Sum(Out[1:0]), .Cout(c2));
CarrySelectAdder_2bit CSA2_16(.A(A[3:2]), .B(B_Sign[3:2]), .Cin(c2), .Sum(Out[3:2]), .Cout(c4));
CarrySelectAdder_3bit CSA3_16(.A(A[6:4]), .B(B_Sign[6:4]), .Cin(c4), .Sum(Out[6:4]), .Cout(c7));
CarrySelectAdder_4bit CSA4_16(.A(A[10:7]), .B(B_Sign[10:7]), .Cin(c7), .Sum(Out[10:7]), .Cout(c11));
CarrySelectAdder_5bit CSA5_16(.A(A[15:11]), .B(B_Sign[15:11]), .Cin(c11), .Sum(Out[15:11]), .Cout(c16));

//High 16bit
CarryLookaheadAdder_2bit CLA2_32_0(.A(A[17:16]), .B(B_Sign[17:16]), .Cin(1'b0), .Sum(high_sum_0[1:0]), .Cout(c18_0));
CarrySelectAdder_2bit CSA2_32_0(.A(A[19:18]), .B(B_Sign[19:18]), .Cin(c18_0), .Sum(high_sum_0[3:2]), .Cout(c20_0));
CarrySelectAdder_3bit CSA3_32_0(.A(A[22:20]), .B(B_Sign[22:20]), .Cin(c20_0), .Sum(high_sum_0[6:4]), .Cout(c23_0));
CarrySelectAdder_4bit CSA4_32_0(.A(A[26:23]), .B(B_Sign[26:23]), .Cin(c23_0), .Sum(high_sum_0[10:7]), .Cout(c27_0));
CarrySelectAdder_5bit CSA5_32_0(.A(A[31:27]), .B(B_Sign[31:27]), .Cin(c27_0), .Sum(high_sum_0[15:11]), .Cout(c32_0));

CarryLookaheadAdder_2bit CLA2_32_1(.A(A[17:16]), .B(B_Sign[17:16]), .Cin(1'b1), .Sum(high_sum_1[1:0]), .Cout(c18_1));
CarrySelectAdder_2bit CSA2_32_1(.A(A[19:18]), .B(B_Sign[19:18]), .Cin(c18_1), .Sum(high_sum_1[3:2]), .Cout(c20_1));
CarrySelectAdder_3bit CSA3_32_1(.A(A[22:20]), .B(B_Sign[22:20]), .Cin(c20_1), .Sum(high_sum_1[6:4]), .Cout(c23_1));
CarrySelectAdder_4bit CSA4_32_1(.A(A[26:23]), .B(B_Sign[26:23]), .Cin(c23_1), .Sum(high_sum_1[10:7]), .Cout(c27_1));
CarrySelectAdder_5bit CSA5_32_1(.A(A[31:27]), .B(B_Sign[31:27]), .Cin(c27_1), .Sum(high_sum_1[15:11]), .Cout(c32_1));

Mux2to1_1bit MUX_COUT(.I0(c32_0), .I1(c32_1), .Sel(c16), .Out(Cout));
Mux2to1_16bit MUX_HIGH(.I0(high_sum_0), .I1(high_sum_1), .Sel(c16), .Out(Out[31:16]));

endmodule
