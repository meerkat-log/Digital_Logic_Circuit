`timescale 1ns/1ns

module D_FlipFlop(Clk, En, Reset, D, Q, Qbar);

input Clk, En, Reset, D;
output reg Q, Qbar;

always @(posedge Clk or posedge En or negedge Reset) begin
	if(!Reset) begin
		Q <= 1'b0;
		Qbar <= 1'b1;
	end
	else if(Clk & En) begin
		Q <= D;
		Qbar <= ~D;
	end
	else begin
		Q <= Q;
		Qbar <= Qbar;
	end
end
endmodule



module TB_D_FlipFlop();

reg En, Reset, D;
wire Clk, Q, Qbar;

Clock_100 CLOCK(.Clk(Clk));
D_FlipFlop DFF(.Clk(Clk), .En(En), .Reset(Reset), .D(D), .Q(Q), .Qbar(Qbar));

initial begin
	D = 1'b1;
	Reset = 1'b0; En = 1'b0;
	#100;
	Reset = 1'b1; En = 1'b1;
	#100;
	Reset = 1'b0;
end
endmodule
