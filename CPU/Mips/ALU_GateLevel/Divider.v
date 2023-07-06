`timescale 1ns/1ns

module DFF_Preset(CLK, En, Preset, Reset, D, Q, Qbar);

input CLK, En, Preset, Reset, D;
output Q, Qbar;

wire CLKbar, D_Tmp, Dbar, SMaster, RMaster, Y, Ybar, SSlave, RSlave;

NOT1 NOTCLK(.A(CLK), .Out(CLKbar));

Mux2to1_1bit ENABLE(.I0(Q), .I1(D), .Sel(En), .Out(D_Tmp));
NOT1 NOTD(.A(D_Tmp), .Out(Dbar));

NAND3 SMOut(.A(D_Tmp), .B(CLK), .C(Reset), .Out(SMaster));
NAND3 RMOut(.A(Dbar), .B(CLK), .C(Preset), .Out(RMaster));
NAND3 YOut(.A(SMaster), .B(Ybar), .C(Preset), .Out(Y));
NAND3 YbarOut(.A(RMaster), .B(Y), .C(Reset), .Out(Ybar));

NAND2 SSOut(.A(Y), .B(CLKbar), .Out(SSlave));
NAND2 RSOut(.A(Ybar), .B(CLKbar), .Out(RSlave));
NAND3 QOut(.A(SSlave), .B(Qbar), .C(Preset), .Out(Q));
NAND3 QbarOut(.A(RSlave), .B(Q), .C(Reset), .Out(Qbar));

endmodule

module Register_32bit_Preset(CLK, En, Preset, Reset, In, Out);

input CLK, En, Reset;
input [31:0] Preset, In;
output [31:0] Out;

genvar i;
generate
	for(i = 0; i < 32; i = i + 1) begin
		DFF_Preset DFFP(.CLK(CLK), .En(En), .Preset(Preset[i]), .Reset(Reset), .D(In[i]), .Q(Out[i]));
	end
endgenerate
endmodule

module DividerCounter(CLK, En, Reset, Out);

input CLK, En, Reset;
output [31:0] Out;

TFF TFF0(.CLK(CLK), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[0]));
genvar i;
generate
	for(i = 1; i < 32; i = i + 1) begin
		TFF TFFi(.CLK(Out[i-1]), .En(En), .Reset(Reset), .T(1'b1), .Q(Out[i]));
	end
endgenerate

endmodule

module Divider(A, B, Out);

input [31:0] A, B;
output [63:0] Out;

wire [31:0] A_Tmp, A_Out, B_Out, NotA, PreA;
wire CLK, Run, ALB, AEB, AGB, NotALB, CompOut;
reg En, Preset, Reset, SubEn, CompEn;

Clock CLOCK(CLK);

NOT32 NOT(.A(A), .Out(NotA));

Mux2to1_32bit MUX_PRESET(.I0(32'HFFFFFFFF), .I1(NotA), .Sel(Preset), .Out(PreA));
Register_32bit_Preset REG_A(.CLK(CLK), .En(Run), .Preset(PreA), .Reset(Reset), .In(A_Tmp), .Out(Out[31:0]));

Comparator_32bit COMP(.A(Out[31:0]), .B(B), .ALB(ALB), .AEB(AEB), .AGB(AGB));
Register_1bit REG_COMP(.CLK(CLK), .En(CompEn), .Reset(Reset), .In(ALB), .Out(CompOut));

NOT1 NOTALB(.A(CompOut), .Out(NotALB));

AND2 AND(.A(NotALB), .B(SubEn), .Out(Run));

Mux2to1_32bit MUXA(.I0(32'H00000000), .I1(Out[31:0]), .Sel(Run), .Out(A_Out));
Mux2to1_32bit MUXB(.I0(32'H00000000), .I1(B), .Sel(Run), .Out(B_Out));

AdderAndSubtractor_32bit SUB(.A(A_Out), .B(B_Out), .Cin(Run), .Out(A_Tmp));

Clock_Counter CLOCK_COUNTER(.CLK(CounterCLK));
DividerCounter COUNT_Q(.CLK(Run), .En(1), .Reset(Reset), .Out(Out[63:32]));

initial begin
	En = 1'b0;
	CompEn = 1'b0;
	SubEn = 1'b0;
	Preset = 1'b1;
	Reset = 1'b0;
	#100;
	Preset = 1'b0;
	Reset = 1'b1;

	while(CompOut != 1) begin
	#300;
	CompEn = 1'b1;
	#100;
	CompEn = 1'b1;	
	#100;
	CompEn = 1'b0;
	SubEn = 1'b1;
	#100;
	En = 1'b1;
	#100;
	SubEn = 1'b0;
	En = 1'b0;
	end

end

endmodule
 