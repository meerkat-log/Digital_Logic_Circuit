`timescale 1ns/1ns

module Register_4bit(Clk, En, Reset, In, Out);

input Clk, En, Reset;
input [3:0] In;
output [3:0] Out;

genvar i;
generate
	for(i = 0; i < 4; i = i + 1) begin
		D_FlipFlop DFF(.Clk(Clk), .En(En), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule
