module AdderAndSubtractor_64bit(A, B, Cin, Cout, Out);

input [63:0] A, B;
input Cin;
output Cout;
output [63:0] Out;

wire [63:0] B_Sign;

wire c2, c4, c7, c11, c16, c32, c48;
wire c18_0, c20_0, c23_0, c27_0, c32_0, c34_0, c36_0, c39_0, c43_0, c48_0, c50_0, c52_0, c55_0, c59_0, c64_0; 
wire c18_1, c20_1, c23_1, c27_1, c32_1, c34_1, c36_1, c39_1, c43_1, c48_1, c50_1, c52_1, c55_1, c59_1, c64_1; 
wire [47:0] high_sum_0;
wire [47:0] high_sum_1;

XOR2_64bit XOR_SIGN(.A(B), .B({64{Cin}}), .Out(B_Sign));

//16bit
CarryLookaheadAdder_2bit CLA2_16(.A(A[1:0]), .B(B_Sign[1:0]), .Cin(Cin), .Sum(Out[1:0]), .Cout(c2));
CarrySelectAdder_2bit CSA2_16(.A(A[3:2]), .B(B_Sign[3:2]), .Cin(c2), .Sum(Out[3:2]), .Cout(c4));
CarrySelectAdder_3bit CSA3_16(.A(A[6:4]), .B(B_Sign[6:4]), .Cin(c4), .Sum(Out[6:4]), .Cout(c7));
CarrySelectAdder_4bit CSA4_16(.A(A[10:7]), .B(B_Sign[10:7]), .Cin(c7), .Sum(Out[10:7]), .Cout(c11));
CarrySelectAdder_5bit CSA5_16(.A(A[15:11]), .B(B_Sign[15:11]), .Cin(c11), .Sum(Out[15:11]), .Cout(c16));

//16bit
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

Mux2to1_1bit MUX_C32(.I0(c32_0), .I1(c32_1), .Sel(c16), .Out(c32));
Mux2to1_16bit MUX_S32(.I0(high_sum_0[15:0]), .I1(high_sum_1[15:0]), .Sel(c16), .Out(Out[31:16]));

//48bit
CarryLookaheadAdder_2bit CLA2_48_0(.A(A[33:32]), .B(B_Sign[33:32]), .Cin(1'b0), .Sum(high_sum_0[17:16]), .Cout(c34_0));
CarrySelectAdder_2bit CSA2_48_0(.A(A[35:34]), .B(B_Sign[35:34]), .Cin(c34_0), .Sum(high_sum_0[19:18]), .Cout(c36_0));
CarrySelectAdder_3bit CSA3_48_0(.A(A[38:36]), .B(B_Sign[38:36]), .Cin(c36_0), .Sum(high_sum_0[22:20]), .Cout(c39_0));
CarrySelectAdder_4bit CSA4_48_0(.A(A[42:39]), .B(B_Sign[42:39]), .Cin(c39_0), .Sum(high_sum_0[26:23]), .Cout(c43_0));
CarrySelectAdder_5bit CSA5_48_0(.A(A[47:43]), .B(B_Sign[47:43]), .Cin(c43_0), .Sum(high_sum_0[31:27]), .Cout(c48_0));

CarryLookaheadAdder_2bit CLA2_48_1(.A(A[33:32]), .B(B_Sign[33:32]), .Cin(1'b1), .Sum(high_sum_1[17:16]), .Cout(c34_1));
CarrySelectAdder_2bit CSA2_48_1(.A(A[35:34]), .B(B_Sign[35:34]), .Cin(c34_1), .Sum(high_sum_1[19:18]), .Cout(c36_1));
CarrySelectAdder_3bit CSA3_48_1(.A(A[38:36]), .B(B_Sign[38:36]), .Cin(c36_1), .Sum(high_sum_1[22:20]), .Cout(c39_1));
CarrySelectAdder_4bit CSA4_48_1(.A(A[42:39]), .B(B_Sign[42:39]), .Cin(c39_1), .Sum(high_sum_1[26:23]), .Cout(c43_1));
CarrySelectAdder_5bit CSA5_48_1(.A(A[47:43]), .B(B_Sign[47:43]), .Cin(c43_1), .Sum(high_sum_1[31:27]), .Cout(c48_1));

Mux2to1_1bit MUX_C48(.I0(c48_0), .I1(c48_1), .Sel(c32), .Out(c48));
Mux2to1_16bit MUX_S48(.I0(high_sum_0[31:16]), .I1(high_sum_1[31:16]), .Sel(c32), .Out(Out[47:32]));

//64bit
CarryLookaheadAdder_2bit CLA2_64_0(.A(A[49:48]), .B(B_Sign[49:48]), .Cin(1'b0), .Sum(high_sum_0[33:32]), .Cout(c50_0));
CarrySelectAdder_2bit CSA2_64_0(.A(A[51:50]), .B(B_Sign[51:50]), .Cin(c50_0), .Sum(high_sum_0[35:34]), .Cout(c52_0));
CarrySelectAdder_3bit CSA3_64_0(.A(A[54:52]), .B(B_Sign[54:52]), .Cin(c52_0), .Sum(high_sum_0[38:36]), .Cout(c55_0));
CarrySelectAdder_4bit CSA4_64_0(.A(A[58:55]), .B(B_Sign[58:55]), .Cin(c55_0), .Sum(high_sum_0[42:39]), .Cout(c59_0));
CarrySelectAdder_5bit CSA5_64_0(.A(A[63:59]), .B(B_Sign[63:59]), .Cin(c59_0), .Sum(high_sum_0[47:43]), .Cout(c64_0));

CarryLookaheadAdder_2bit CLA2_64_1(.A(A[49:48]), .B(B_Sign[49:48]), .Cin(1'b1), .Sum(high_sum_1[33:32]), .Cout(c50_1));
CarrySelectAdder_2bit CSA2_64_1(.A(A[51:50]), .B(B_Sign[51:50]), .Cin(c50_1), .Sum(high_sum_1[35:34]), .Cout(c52_1));
CarrySelectAdder_3bit CSA3_64_1(.A(A[54:52]), .B(B_Sign[54:52]), .Cin(c52_1), .Sum(high_sum_1[38:36]), .Cout(c55_1));
CarrySelectAdder_4bit CSA4_64_1(.A(A[58:55]), .B(B_Sign[58:55]), .Cin(c55_1), .Sum(high_sum_1[42:39]), .Cout(c59_1));
CarrySelectAdder_5bit CSA5_64_1(.A(A[63:59]), .B(B_Sign[63:59]), .Cin(c59_1), .Sum(high_sum_1[47:43]), .Cout(c64_1));

Mux2to1_1bit MUX_COUT(.I0(c64_0), .I1(c64_1), .Sel(c48), .Out(Cout));
Mux2to1_16bit MUX_S64(.I0(high_sum_0[47:32]), .I1(high_sum_1[47:32]), .Sel(c48), .Out(Out[63:48]));

endmodule

