module SecondStage(Clk, En, Reset, A, Sign, Num, AfterA, BoothOut);

input Clk, En, Reset, Sign;
input [63:0] A;
input [3:0] Num;
output [63:0] AfterA, BoothOut;

wire [2:0] SelBoothA;
wire [1:0] SelBoothB;
wire SelBoothC;
wire [63:0] BoothA, BoothB, BoothC, Tmp;

BoothLookUpTable BOOTH_LUT(.In(Num), .SelBoothA(SelBoothA), .SelBoothB(SelBoothB), .SelBoothC(SelBoothC));
AfterShift AS(.SelBoothA(SelBoothA), .SelBoothB(SelBoothB), .SelBoothC(SelBoothC), .Sign(Sign), .A(A), .AfterA(AfterA), .BoothA(BoothA), .BoothB(BoothB), .BoothC(BoothC));
AdderAndSubtractor_64bit ADDER0(.A(BoothA), .B(BoothB), .Cin(1'b0), .Out(Tmp));
AdderAndSubtractor_64bit ADDER1(.A(Tmp), .B(BoothC), .Cin(1'b0), .Out(BoothOut));

endmodule