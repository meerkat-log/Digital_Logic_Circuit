module CarrySelectAdder_5bit(A, B, Cin, Sum, Cout);

input [4:0] A, B;
input Cin;
output [4:0] Sum;
output Cout;

wire [4:0]cla5_0_sum_tmp, cla5_1_sum_tmp;
wire cla5_0_co_tmp, cla5_1_co_tmp;

CarryLookaheadAdder_5bit CLA5_0(.A(A), .B(B), .Cin(1'b0), .Sum(cla5_0_sum_tmp), .Cout(cla5_0_co_tmp));
CarryLookaheadAdder_5bit CLA5_1(.A(A), .B(B), .Cin(1'b1), .Sum(cla5_1_sum_tmp), .Cout(cla5_1_co_tmp));

Mux2to1_1bit MUX_CLA5_Cout(.I0(cla5_0_co_tmp), .I1(cla5_1_co_tmp), .Sel(Cin), .Out(Cout));
Mux2to1_5bit MUX_CLA5_Sum(.I0(cla5_0_sum_tmp), .I1(cla5_1_sum_tmp), .Sel(Cin), .Out(Sum));

endmodule
