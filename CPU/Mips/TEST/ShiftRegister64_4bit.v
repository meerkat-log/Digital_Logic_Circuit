`timescale 1ns/1ns

module ShiftRegister64_4bit(Clk, En, Reset, In, Out);

input Clk, En, Reset;
input [63:0] In;
output [63:0] Out;

D_FlipFlop_with_Preset DFF0(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[0]), .D(1'b0), .Q(Out[0]));
D_FlipFlop_with_Preset DFF1(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[1]), .D(1'b0), .Q(Out[1]));
D_FlipFlop_with_Preset DFF2(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[2]), .D(1'b0), .Q(Out[2]));
D_FlipFlop_with_Preset DFF3(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[3]), .D(1'b0), .Q(Out[3]));

genvar i;
generate
	for(i = 4; i < 64; i = i + 4) begin
		D_FlipFlop_with_Preset DFF4(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[i]), .D(Out[i-4]), .Q(Out[i]));
		D_FlipFlop_with_Preset DFF5(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[i+1]), .D(Out[i-3]), .Q(Out[i+1]));
		D_FlipFlop_with_Preset DFF6(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[i+2]), .D(Out[i-2]), .Q(Out[i+2]));
		D_FlipFlop_with_Preset DFF7(.Clk(Clk), .En(En), .Reset(Reset), .Preset(In[i+3]), .D(Out[i-1]), .Q(Out[i+3]));
	end
endgenerate

endmodule

module TB_ShiftRegister64_4bit();

reg En, Reset;
reg [63:0] In;
wire Clk;
wire [63:0] Out;

Clock_100 CLOCK(.Clk(Clk));
ShiftRegister64_4bit SR(.Clk(Clk), .En(En), .Reset(Reset), .In(In), .Out(Out));

initial begin
	En = 1'b0; Reset = 1'b1;
	In = 64'H0000000000000055;
	#100;
	In = 64'H0000000000000000;
	En = 1'b1; Reset = 1'b0;
	#500;
	En = 1'b0;
end
endmodule
