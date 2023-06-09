module ALU(A, B, Control, High, Low, ZeroFlag);

input [31:0] A, B;
input [3:0] Control;
output [31:0] High, Low;
output ZeroFlag;

wire AdderIn;
wire [31:0] And, Or, SumOrSub, Mul, DivQ, DivR, Slt;

AND2_32bit AND(.A(A), .B(B), .Out(And));
OR2_32bit OR(.A(A), .B(B), .Out(Or));

Mux16to1_1bit ADDER_SIGN(.I2(1'b0), .I6(1'b1), .Sel(Control), .Out(AdderIn));
AdderAndSubtractor ADDorSub(.A(A), .B(B), .Cin(AdderIn), .Out(SumOrSub));
ZeroFlagGenerator ZFG(.A(SumOrSub), .Out(ZeroFlag));

Multiplier MUL(.A(A), .B(B), .Out(Mul));
Divider DIV(.A(A), .B(B), .Q(DivQ), .R(DivR));

SetOnLessThan SLT(.A(A), .B(B), .Out(Slt));

Mux16to1_32bit LOW_OUT(.I0(And), .I1(Or), .I2(SumOrSub), .I3(Mul[31:0]), .I4(DivR), .I6(SumOrSub), .I7(Slt), .Sel(Control), .Out(Low));
Mux16to1_32bit HIGH_OUT(.I0(32'h00000000), .I1(32'h00000000), .I2(32'h00000000), .I3(Mul[63:32]), .I4(DivQ), .I6(32'h00000000), .I7(32'h00000000), .Sel(Control), .Out(High));

endmodule
