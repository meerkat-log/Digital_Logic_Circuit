`timescale 1ns/1ns

module Register_64bit_with_Preset(Clk, En, Reset, Preset, In, Out);

input Clk, En, Reset;
input [63:0] Preset, In;
output [63:0] Out;

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		D_FlipFlop_with_Preset DFF(.Clk(Clk), .En(En), .Reset(Reset), .Preset(Preset[i]), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule



module TB_Register_64bit_with_Preset();

reg En, Reset;
reg [63:0] Preset, In;
wire Clk;
wire [63:0] Out;

Clock_100 CLOCK(.Clk(Clk));
Register_64bit_with_Preset REG64(.Clk(Clk), .En(En), .Reset(Reset), .Preset(Preset), .In(In), .Out(Out));

initial begin
	In = 64'H0000000000000000;
	Preset = 64'H1234567887654321;
	Reset = 1'b1; En = 1'b0;
	#100;
	Reset = 1'b1; En = 1'b0;
	#100;
	Reset = 1'b0;
end
endmodule
