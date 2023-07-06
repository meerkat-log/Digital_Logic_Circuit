module Register_1bit(CLK, En, Reset, In, Out);

input CLK, En, Reset, In;
output Out;

DFF D(.CLK(CLK), .En(En), .Reset(Reset), .D(In), .Q(Out));

endmodule

module Register_3bit(CLK, En, Reset, In, Out);

input CLK, En, Reset;
input [2:0] In;
output [2:0] Out;

genvar i;
generate
	for(i = 0; i < 3; i = i + 1) begin
		DFF D(.CLK(CLK), .En(En), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule

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

module Register_32bit(CLK, En, Reset, In, Out);

input CLK, En, Reset;
input [31:0] In;
output [31:0] Out;

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
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
