`timescale 1ns/1ns

module Counter_Mod8(Clk, En, Reset, Out);

input Clk, En, Reset;
output [2:0] Out;

wire Tff2In;

T_FlipFlop TFF0(.Clk(Clk), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
T_FlipFlop TFF1(.Clk(Clk), .En(En), .Reset(Reset), .T(Out[0]), .Q(Out[1]));
AND2_1bit TFF2IN(.A(Out[0]), .B(Out[1]), .Out(Tff2In));
T_FlipFlop TFF2(.Clk(Clk), .En(En), .Reset(Reset), .T(Tff2In), .Q(Out[2]));

/*
input Clk, En, Reset;
output [2:0] Out;

wire Tff2In;

T_FlipFlop TFF0(.Clk(Clk), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
T_FlipFlop TFF1(.Clk(Out[0]), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[1]));
T_FlipFlop TFF2(.Clk(Out[1]), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[2]));
*/
endmodule



module tb_Counter_Mod8();

reg Clk, En, Reset;
wire [2:0] Out;

Counter_Mod8 COUNTER(.Clk(Clk), .En(En), .Reset(Reset), .Out(Out));

always begin
	#150 Clk = 1'b0;
	#150 Clk = 1'b1;
end

initial begin
	Clk = 1'b1;
	En = 1'b0; Reset = 1'b1;
	#100;
	En = 1'b1; Reset = 1'b0;
end
endmodule
