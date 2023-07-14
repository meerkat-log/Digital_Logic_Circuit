module CarrySelectAdder_4bit(A, B, Cin, Sum, Cout);

input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Cout;

wire [3:0]cla4_0_sum_tmp, cla4_1_sum_tmp;
wire cla4_0_co_tmp, cla4_1_co_tmp;

CarryLookaheadAdder_4bit CLA4_0(.A(A), .B(B), .Cin(1'b0), .Sum(cla4_0_sum_tmp), .Cout(cla4_0_co_tmp));
CarryLookaheadAdder_4bit CLA4_1(.A(A), .B(B), .Cin(1'b1), .Sum(cla4_1_sum_tmp), .Cout(cla4_1_co_tmp));

Mux2to1_1bit MUX_CLA4_Cout(.I0(cla4_0_co_tmp), .I1(cla4_1_co_tmp), .Sel(Cin), .Out(Cout));
Mux2to1_4bit MUX_CLA4_Sum(.I0(cla4_0_sum_tmp), .I1(cla4_1_sum_tmp), .Sel(Cin), .Out(Sum));

endmodule
