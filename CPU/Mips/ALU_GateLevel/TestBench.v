`timescale 1ns/1ns

module TestBench();
/*
reg [31:0] A, B;
reg [1:0] ALUOp;
reg [5:0] InstructionOp;

wire [31:0] High, Low;
wire ZeroFlag;

Top TOP(.A(A), .B(B), .ALUOp(ALUOp), .InstructionOp(InstructionOp), .High(High), .Low(Low), .ZeroFlag(ZeroFlag));

initial begin
	A <= 32'h87654321;
	B <= 32'h12345678;
	ALUOp <= 2'b00;
	#200;
	ALUOp <= 2'b01;
	#1000;
	ALUOp <= 2'b10;
	InstructionOp <= 6'b100100;
	#1000;
	InstructionOp <= 6'b100101;
	#1000;
	InstructionOp <= 6'b100000;
	#1000;
	InstructionOp <= 6'b100010;
	#1000;
	InstructionOp <= 6'b100001;
	#1000;
	InstructionOp <= 6'b100011;
	#1000;
	InstructionOp <= 6'b101010;
end
*/
/*
reg CLR, J, K;
wire CLK;
wire Q, Qbar;
Clock CLOCK(.CLK(CLK));
JK_FlipFlop JKFF(.CLK(CLK), .Clear(CLR), .J(J), .K(K), .Q(Q), .Qbar(Qbar));

initial begin
	J = 1'b0;
	K = 1'b0;
	CLR = 1'b0;
	force JKFF.Y = 1'b0;
	force Q = 1'b0;
	force Qbar = 1'b1;
	#40 release JKFF.Y;
	release Q;
	release Qbar;
	#460;
	J = 1'b1;
	K = 1'b0;
	#500;
	J = 1'b0;
	K = 1'b1;
	#500;
	J = 1'b1;
	K = 1'b1;
	#400;
	CLR = 1'b1;
end
*/
/*
wire CLK;
wire [63:0] Out;

Clock CLOCK(.CLK(CLK));
Multiplier MUL(.CLK(CLK), .A(32'h0000007F), .B(32'h00000070), .Out(Out));
*/
/*
reg En, Rst;
wire CLK;
wire [2:0] Out;
Clock CLOCK(.CLK(CLK));
RadixCounter RC(.Clk(CLK), .En(En), .Rst(Rst), .Out(Out));

initial begin
	Rst = 1'b1;
	En = 1'b0;
	#100
	Rst = 1'b0;
	En = 1'b1;

end
*/
/*
reg En, Reset;
wire CLK;
wire [3:0] Out;

Clock_Radix CLOCK(.CLK(CLK));
RadixSelect RS(.CLK(CLK), .En(En), .Reset(Reset), .B(32'b00010010001101000101011001111000), .Out(Out));

initial begin
	Reset = 1'b0;
	En = 1'b0;
	#100 Reset = 1'b1;
	En = 1'b1;

end
*/

wire [63:0] Out;

Multiplier MUL(.A(32'H0000054A), .B(32'H000015ED), .Out(Out));

/*
wire ALB, AEB, AGB;
wire [63:0] Out;
Divider DIV(.A(32'H00000001), .B(32'H00000002), .Out(Out));
*/
/*
wire CLK, Q, Qbar;
reg En, Preset, Reset, D;

Clock_Register CLOCK(.CLK(CLK));
DFF_PRESET DFFP(.CLK(CLK), .En(En), .Preset(Preset), .Reset(Reset), .D(D), .Q(Q), .Qbar(Qbar));

initial begin
	D = 1'b0;
	Reset = 1'b1;
	En = 1'b0;
	Preset = 1'b0;
	#100 
	Reset = 1'b1;
	En = 1'b1;
	Preset = 1'b1;

end
*/
/*
wire CLK;
reg En, Reset;
wire [31:0] Out;
Clock_Counter CLOCK(.CLK(CLK));
DividerCounter DC(.CLK(CLK), .En(En), .Reset(Reset), .Out(Out));

initial begin
	En = 1'b0;
	Reset = 1'b0;
	#100;
	En = 1'b1;
	Reset = 1'b1;
end
*/
endmodule

