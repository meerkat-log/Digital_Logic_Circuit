`timescale 1ns/1ns

module Counter_Mod9(Clk, En, Reset, Out);

input Clk, En, Reset;
output [3:0] Out;

wire Tff2In, Tff3In;

T_FlipFlop TFF0(.Clk(Clk), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
T_FlipFlop TFF1(.Clk(Clk), .En(En), .Reset(Reset), .T(Out[0]), .Q(Out[1]));
and TFF2IN(Tff2In, Out[0], Out[1]);
T_FlipFlop TFF2(.Clk(Clk), .En(En), .Reset(Reset), .T(Tff2In), .Q(Out[2]));
and TFF3IN(Tff3In, Tff2In, Out[2]);
T_FlipFlop TFF3(.Clk(Clk), .En(En), .Reset(Reset), .T(Tff3In), .Q(Out[3]));

endmodule



module tb_Counter_Mod9();

reg Clk, En, Reset;
wire [3:0] Out;

Counter_Mod9 COUNTER(.Clk(Clk), .En(En), .Reset(Reset), .Out(Out));

always begin
	#200 Clk = 1'b0;
	#200 Clk = 1'b1;
end

initial begin
	Clk = 1'b1;
	En = 1'b0; Reset = 1'b0;
	#100;
	En = 1'b1; Reset = 1'b1;
end
endmodule
