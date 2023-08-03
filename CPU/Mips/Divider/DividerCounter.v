`timescale 1ns/1ns

module DividerCounter(Clk, En, Reset, Out);

input Clk, En, Reset;
output [31:0] Out;

wire TffIn[29:0];

T_FlipFlop TFF0(.Clk(Clk), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
T_FlipFlop TFF1(.Clk(Clk), .En(En), .Reset(Reset), .T(Out[0]), .Q(Out[1]));
AND2_1bit TFF2IN(.A(Out[0]), .B(Out[1]), .Out(TffIn[0]));
T_FlipFlop TFF2(.Clk(Clk), .En(En), .Reset(Reset), .T(TffIn[0]), .Q(Out[2]));

AND2_1bit TFF3IN(.A(TffIn[0]), .B(Out[2]), .Out(TffIn[1]));
T_FlipFlop TFF3(.Clk(Clk), .En(En), .Reset(Reset), .T(TffIn[1]), .Q(Out[3]));


genvar i;
generate
	for(i = 3; i < 32; i = i + 1) begin
		AND2_1bit TFF_IN(.A(TffIn[i-3]), .B(Out[i-1]), .Out(TffIn[i-2]));
		T_FlipFlop TFF(.Clk(Clk), .En(En), .Reset(Reset), .T(TffIn[i-2]), .Q(Out[i]));
	end
endgenerate
endmodule

module TB_DividerCounter();

reg En, Reset;
wire Clk;
wire [31:0] Out;

Clock_200 CLOCK(.Clk(Clk));
DividerCounter DC(.Clk(Clk), .En(En), .Reset(Reset), .Out(Out));

initial begin
	En = 1'b0; Reset = 1'b1;
	#100;
	En = 1'b1; Reset = 1'b0;
end
endmodule
