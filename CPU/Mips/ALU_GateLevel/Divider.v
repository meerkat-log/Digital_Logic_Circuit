`timescale 1ns/1ns

module Divider(A, B, Out);

/*
input [31:0] A, B;
output reg [31:0] Q, R;

integer i;

reg [31:0] A_tmp;
wire [31:0] A_sub;

initial begin
	i = 0;
end

assign A_tmp = A;

always @(*) begin
	while(A_tmp >= B & B > 0) begin
		A_tmp = A_tmp - B;
		i = i + 1;
	end
	Q <= A_tmp;
	R <= i;
end
*/


input [31:0] A, B;
output reg [63:0] Out;

wire [31:0] Input, A_Tmp, B_Tmp, Sub;
wire Cout, AGB;

assign A_Tmp = A;
Comparator_32bit COMP(.A(A_Tmp), .B(B), .AGB(AGB));
Mux2to1_32bit RUN(.I0(32'H00000000), I1(A_Tmp), .Sel(AGB), .Out(Input));

AdderAndSubtractor_32bit SUB(.A(Input), .B(B), .Cin(1'b1), .Cout(Cout), .Out(Sub));

Mux2to1_32bit SELECT_OUT(.I0(), I1(Sub), .Sel(Cout), Out);




endmodule
