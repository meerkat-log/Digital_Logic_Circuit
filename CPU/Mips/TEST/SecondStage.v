module SecondStage(Clk, En, A, Shift1A, Shift2A, Shift3A, Shift4A);

input Clk, En, Sign;
input [63:0] A;
input [3:0] Num;
output [63:0] BoothOut;

wire [2:0] SelBoothA;
wire [1:0] SelBoothB;
wire SelBoothC;
wire [63:0] BoothA, BoothB, BoothC, Tmp;

AdderAndSubtractor_64bit SETNUM(.A(64'H0000000000000000), .B(A), .Cin(Sign), .Out(SetA));

NOT_1bit NOT_EN(.A(En), .Out(Reset));
Mux2to1_64bit SEL_A(.I0(SetA), I1(64'H0000000000000000), .Sel(En), .Out(In)

ShiftRegister64_1bit SR1(.Clk(Clk), .En(En), .Reset(Reset), .In(A), .Out(Shift1A));
ShiftRegister64_2bit SR2(.Clk(Clk), .En(En), .Reset(Reset), .In(A), .Out(Shift2A));
ShiftRegister64_3bit SR3(.Clk(Clk), .En(En), .Reset(Reset), .In(A), .Out(Shift3A));
ShiftRegister64_4bit SR4(.Clk(Clk), .En(En), .Reset(Reset), .In(A), .Out(Shift4A));

endmodule
