module Register_5bit(CLK, En, Reset, In, Out);

input CLK, En, Reset;
input [4:0] In;
output [4:0] Out;

genvar i;
generate
	for(i = 0; i < 5; i = i + 1) begin
		DFF D(.CLK(CLK), .En(En), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule

module Register_64bit(CLK, En, Reset, In, Out);

input CLK, En, Reset;
input [63:0] In;
output [63:0] Out;

genvar i;
generate
	for(i = 0; i < 64; i = i + 1) begin
		DFF D(.CLK(CLK), .En(En), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule
