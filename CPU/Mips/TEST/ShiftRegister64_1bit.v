`timescale 1ns/1ns

module ShiftRegister64_1bit(Clk, En, Reset, In, Out);

input Clk, En, Reset;
input [63:0] In;
output [63:0] Out;

D_FlipFlop_with_Preset DFF(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[0]), .D(1'b0), .Q(Out[0]));

genvar i;
generate
	for(i = 1; i < 64; i = i + 1) begin
		D_FlipFlop_with_Preset DFF(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[i]), .D(Out[i-1]), .Q(Out[i]));
	end
endgenerate

endmodule

module TB_ShiftRegister64_1bit();

reg En, Reset;
reg [63:0] In;
wire Clk;
wire [63:0] Out;

Clock_100 CLOCK(.Clk(Clk));
ShiftRegister64_1bit SR(.Clk(Clk), .En(En), .Reset(Reset), .In(In), .Out(Out));

initial begin
	En = 1'b0; Reset = 1'b0;
	In = 64'HFFFFFFFFFFFFFFFF;
	#100;
	In = 64'H0000000000000000;
	En = 1'b1;
	#500;
	En = 1'b0;
end
endmodule
