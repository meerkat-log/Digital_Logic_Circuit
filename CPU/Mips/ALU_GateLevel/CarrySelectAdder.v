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

