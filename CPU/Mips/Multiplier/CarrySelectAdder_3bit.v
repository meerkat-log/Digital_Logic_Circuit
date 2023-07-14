module CarrySelectAdder_3bit(A, B, Cin, Sum, Cout);

input [2:0] A, B;
input Cin;
output [2:0] Sum;
output Cout;

wire [2:0]cla3_0_sum_tmp, cla3_1_sum_tmp;
wire cla3_0_co_tmp, cla3_1_co_tmp;

CarryLookaheadAdder_3bit CLA3_0(.A(A), .B(B), .Cin(1'b0), .Sum(cla3_0_sum_tmp), .Cout(cla3_0_co_tmp));
CarryLookaheadAdder_3bit CLA3_1(.A(A), .B(B), .Cin(1'b1), .Sum(cla3_1_sum_tmp), .Cout(cla3_1_co_tmp));

Mux2to1_1bit MUX_CLA3_Cout(.I0(cla3_0_co_tmp), .I1(cla3_1_co_tmp), .Sel(Cin), .Out(Cout));
Mux2to1_3bit MUX_CLA3_Sum(.I0(cla3_0_sum_tmp), .I1(cla3_1_sum_tmp), .Sel(Cin), .Out(Sum));

endmodule
