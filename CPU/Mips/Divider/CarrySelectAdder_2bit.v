module CarrySelectAdder_2bit(A, B, Cin, Sum, Cout);

input [1:0] A, B;
input Cin;
output [1:0] Sum;
output Cout;

wire [1:0]cla2_0_sum_tmp, cla2_1_sum_tmp;
wire cla2_0_co_tmp, cla2_1_co_tmp;

CarryLookaheadAdder_2bit CLA2_0(.A(A), .B(B), .Cin(1'b0), .Sum(cla2_0_sum_tmp), .Cout(cla2_0_co_tmp));
CarryLookaheadAdder_2bit CLA2_1(.A(A), .B(B), .Cin(1'b1), .Sum(cla2_1_sum_tmp), .Cout(cla2_1_co_tmp));

Mux2to1_1bit MUX_CLA2_Cout(.I0(cla2_0_co_tmp), .I1(cla2_1_co_tmp), .Sel(Cin), .Out(Cout));
Mux2to1_2bit MUX_CLA2_Sum(.I0(cla2_0_sum_tmp), .I1(cla2_1_sum_tmp), .Sel(Cin), .Out(Sum));

endmodule
