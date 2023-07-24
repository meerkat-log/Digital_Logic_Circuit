`timescale 1ns/1ns

module AfterShift(SelBoothA, SelBoothB, SelBoothC, Sign, A, BoothA, BoothB, BoothC);

input [2:0] SelBoothA;
input [1:0] SelBoothB;
input SelBoothC;
input Sign;
input [63:0] A;
output [63:0] BoothA, BoothB, BoothC;

wire [63:0] SetA;

AdderAndSubtractor_64bit SETNUM(.A(64'H0000000000000000), .B(A), .Cin(Sign), .Out(SetA));

Mux8to1_64bit MUX_BOOTHA(.I0(64'H0000000000000000), .I1(SetA), .I2({SetA[62:0], 1'b0}), .I3({SetA[61:0], 2'b00}), .I4({SetA[60:0], 3'b000}), .Sel(SelBoothA), .Out(BoothA));
Mux4to1_64bit MUX_BOOTHB(.I0(64'H0000000000000000), .I1(SetA), .I2({SetA[62:0], 1'b0}), .Sel(SelBoothB), .Out(BoothB));
Mux2to1_64bit MUX_BOOTHC(.I0(64'H0000000000000000), .I1(SetA), .Sel(SelBoothC), .Out(BoothC));

endmodule

module tb_AfterShift();

reg [2:0] SelBoothA;
reg [1:0] SelBoothB;
reg SelBoothC, Sign;
reg [63:0] A;
wire [63:0] BoothA, BoothB, BoothC;

AfterShift AS(.SelBoothA(SelBoothA), .SelBoothB(SelBoothB), .SelBoothC(SelBoothC), .Sign(Sign), .A(A), .BoothA(BoothA), .BoothB(BoothB), .BoothC(BoothC));

integer i;
initial begin
	Sign = 1'b0;
	A = 64'H0000000000000001;
	for(i = 0; i < 8; i = i + 1) begin
		SelBoothA = i;
		#100;
	end
	for(i = 0; i < 4; i = i + 1) begin
		SelBoothB = i;
		#100;
	end
	for(i = 0; i < 2; i = i + 1) begin
		SelBoothC = i;
		#100;
	end
end
endmodule
