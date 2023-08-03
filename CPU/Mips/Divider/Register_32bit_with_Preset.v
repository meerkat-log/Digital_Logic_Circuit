`timescale 1ns/1ns

module Register_32bit_with_Preset(Clk, En, Reset, Preset, In, Out);

input Clk, En, Reset;
input [31:0] Preset, In;
output [31:0] Out;

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
		D_FlipFlop_with_Preset DFF(.Clk(Clk), .En(En), .Reset(Reset), .Preset(Preset[i]), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule
