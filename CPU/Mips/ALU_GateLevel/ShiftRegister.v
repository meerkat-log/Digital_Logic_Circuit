module D_FlipFlop(CLK, D, Q, Qbar);

input CLK, D;
output Q, Qbar;


wire CLKbar, Dbar, SMaster, RMaster, Y, Ybar, SSlave, RSlave;

NOT1 NOTCLK(.A(CLK), .Out(CLKbar));
NOT1 NOTD(.A(D), .Out(Dbar));

NAND2 SMOut(.A(D), .B(CLK), .Out(SMaster));
NAND2 RMOut(.A(Dbar), .B(CLK), .Out(RMaster));
NAND2 YOut(.A(SMaster), .B(Ybar), .Out(Y));
NAND2 YbarOut(.A(RMaster), .B(Y), .Out(Ybar));

NAND2 SSOut(.A(Y), .B(CLKbar), .Out(SSlave));
NAND2 RSOut(.A(Ybar), .B(CLKbar), .Out(RSlave));
NAND2 QOut(.A(SSlave), .B(Qbar), .Out(Q));
NAND2 QbarOut(.A(RSlave), .B(Q), .Out(Qbar));

endmodule

module ShiftRegister_32bit(CLK, Mode, In, Out);

input CLK;
input [1:0] Mode;
input [31:0] In;
output [31:0] Out;

genvar i;

wire dff[31:0]; 

Mux4to1_1bit MUX0(.I0(Out[0]), .I1(Out[1]), .I2(1'b0), .I3(In[0]), .Sel(Mode), .Out(dff[0]));
D_FlipFlop DFF0(.CLK(CLK), .D(dff[0]), .Q(Out[0]));

generate
	for(i = 1; i < 31; i = i + 1) begin
		Mux4to1_1bit MUX(.I0(Out[i]), .I1(Out[i+1]), .I2(Out[i-1]), .I3(In[i]), .Sel(Mode), .Out(dff[i]));
		D_FlipFlop DFF(.CLK(CLK), .D(dff[i]), .Q(Out[i]));
	end
endgenerate

Mux4to1_1bit MUX31(.I0(Out[31]), .I1(In[31]), .I2(Out[30]), .I3(In[31]), .Sel(Mode), .Out(dff[31]));
D_FlipFlop DFF31(.CLK(CLK), .D(dff[31]), .Q(Out[31]));

endmodule

module ShiftRegister_33bit(CLK, Mode, In, Out);

input CLK;
input [1:0] Mode;
input [32:0] In;
output [32:0] Out;

genvar i;

wire dff[32:0]; 

Mux4to1_1bit MUX0(.I0(Out[0]), .I1(Out[1]), .I2(1'b0), .I3(In[0]), .Sel(Mode), .Out(dff[0]));
D_FlipFlop DFF0(.CLK(CLK), .D(dff[0]), .Q(Out[0]));

generate
	for(i = 1; i < 32; i = i + 1) begin
		Mux4to1_1bit MUX(.I0(Out[i]), .I1(Out[i+1]), .I2(Out[i-1]), .I3(In[i]), .Sel(Mode), .Out(dff[i]));
		D_FlipFlop DFF(.CLK(CLK), .D(dff[i]), .Q(Out[i]));
	end
endgenerate

Mux4to1_1bit MUX32(.I0(Out[32]), .I1(In[32]), .I2(Out[31]), .I3(In[32]), .Sel(Mode), .Out(dff[32]));
D_FlipFlop DFF32(.CLK(CLK), .D(dff[32]), .Q(Out[32]));

endmodule

module ShiftRegister_64bit(CLK, Mode, In, Out);

input CLK;
input [1:0] Mode;
input [63:0] In;
output [63:0] Out;

genvar i;

wire dff[63:0]; 

Mux4to1_1bit MUX0(.I0(Out[0]), .I1(Out[1]), .I2(1'b0), .I3(In[0]), .Sel(Mode), .Out(dff[0]));
D_FlipFlop DFF0(.CLK(CLK), .D(dff[0]), .Q(Out[0]));

generate
	for(i = 1; i < 63; i = i + 1) begin
		Mux4to1_1bit MUX(.I0(Out[i]), .I1(Out[i+1]), .I2(Out[i-1]), .I3(In[i]), .Sel(Mode), .Out(dff[i]));
		D_FlipFlop DFF(.CLK(CLK), .D(dff[i]), .Q(Out[i]));
	end
endgenerate

Mux4to1_1bit MUX63(.I0(Out[63]), .I1(In[63]), .I2(Out[62]), .I3(In[63]), .Sel(Mode), .Out(dff[63]));
D_FlipFlop DFF63(.CLK(CLK), .D(dff[63]), .Q(Out[63]));


endmodule

