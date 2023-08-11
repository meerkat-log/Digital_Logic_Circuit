`timescale 1ns/1ns

// D-FlipFlop with Enable, Reset, Preset Signal
// The Enable, Reset and Preset signals are set to High-active.
module D_FlipFlop_with_Preset(Clk, En, Reset, Preset, D, Q, Qbar);

input Clk, En, Reset, Preset, D;
output reg Q, Qbar;

always @(posedge Clk or posedge En or posedge Reset or posedge Preset) begin
	if(Preset) begin
		Q <= #95 1'b1;
		Qbar <= #95 1'b0;
	end
	else if(Reset) begin
		Q <= #95 1'b0;
		Qbar <= #95 1'b1;
	end
	else if(Clk & En) begin
		Q <= #95 D;
		Qbar <= #95 ~D;
	end
	else begin
		Q <= #95 Q;
		Qbar <= #95 Qbar;
	end
end

/*
input Clk, En, Reset, Preset, D;
output Q, Qbar;

wire NotClk, NotD, U3_Out, U4_Out, U5_Out, U6_Out, U7_Out, U8_Out;

NOT_1bit RESET(.A(Reset), .Out(ResetIn));
NOT_1bit PRESET(.A(Preset), .Out(PresetIn));
NOT_1bit U1(.A(D), .Out(NotD));
NOT_1bit U2(.A(Clk), .Out(NotClk));

NAND3_1bit U3(.A(ResetIn), .B(D), .C(Clk), .Out(U3_Out));
NAND3_1bit U4(.A(PresetIn), .B(NotD), .C(Clk), .Out(U4_Out));
NAND3_1bit U5(.A(PresetIn), .B(U3_Out), .C(U6_Out), .Out(U5_Out));
NAND3_1bit U6(.A(ResetIn), .B(U4_Out), .C(U5_Out), .Out(U6_Out));

NAND2_1bit U7(.A(U5_Out), .B(NotClk), .Out(U7_Out));
NAND2_1bit U8(.A(U6_Out), .B(NotClk), .Out(U8_Out));
NAND3_1bit U9(.A(PresetIn), .B(U7_Out), .C(Qbar), .Out(Q));
NAND3_1bit U10(.A(ResetIn), .B(U8_Out), .C(Q), .Out(Qbar));
*/
endmodule

 

module TB_D_FlipFlop_with_Preset();

reg En, Reset, Preset, D;
wire Clk, Q, Qbar;

Clock_100 CLOCK(.Clk(Clk));
D_FlipFlop_Preset DFF(.Clk(Clk), .En(En), .Reset(Reset), .Preset(Preset), .D(D), .Q(Q), .Qbar(Qbar));

initial begin
	D = 1'b1;
	Reset = 1'b1; En = 1'b0; Preset = 1'b0;
	#100;
	Reset = 1'b0; En = 1'b1; Preset = 1'b0;
end
endmodule
