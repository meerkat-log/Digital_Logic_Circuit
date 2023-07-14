`timescale 1ns/1ns

module Register_64bit(Clk, En, Reset, In, Out);

input Clk, En, Reset;
input [63:0] In;
output [63:0] Out;

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		D_FlipFlop DFF(.Clk(Clk), .En(En), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule



module TB_Register_64bit();

reg En, Reset;
reg [63:0] In;
wire Clk;
wire [63:0] Out;

Clock_100 CLOCK(.Clk(Clk));
Register_64bit REG64(.Clk(Clk), .En(En), .Reset(Reset), .In(In), .Out(Out));

initial begin
	In = 64'HFFFFFFFFFFFFFFFF;
	Reset = 1'b0; En = 1'b0;
	#100;
	Reset = 1'b1; En = 1'b1;
	#100;
	Reset = 1'b0;
end
endmodule
