`timescale 1ns/1ns

module Multiplier(A, B, Out);

input [15:0] A, B;
output [31:0] Out;

integer i;

wire [31:0] tmp01, tmp02;
reg [16:0] B_Zero;
wire [15:0] A_Bar;
reg [31:0] A_Ext_Pos, A_Ext_Neg;
reg [15:0] A_Neg;
reg [31:0] pp[3:0];

assign A_Bar = ~A;
assign A_Neg = A_Bar + 1;

assign A_Ext_Pos = {{16{A[15]}}, A};
assign A_Ext_Neg = {{16{A_Neg[15]}}, A_Neg};

assign B_Zero = {B, 1'b0};

assign tmp = 32'h0000_0000;

Adder Add01(.a(pp[0]), .b(pp[1]), .sum(tmp01));
Adder Add23(.a(pp[2]), .b(pp[3]), .sum(tmp02));
Adder Add04(.a(tmp01), .b(tmp02), .sum(Out));


always @(A, B) begin
	for(i = 0; i < 4; i = i + 1) begin
		case(B_Zero[4:0])
			5'b00000, 5'b11111 : begin
				pp[i] = 32'h0000_0000;
			end
			5'b00001, 5'b00010 : begin
				pp[i] = A_Ext_Pos;
			end
			5'b00011, 5'b00100 : begin
				pp[i] = (A_Ext_Pos << 1);
			end
			5'b00101, 5'b00110 : begin
				pp[i] = ((A_Ext_Pos << 1) + A_Ext_Pos);
			end
			5'b00111, 5'b01000 : begin
				pp[i] = (A_Ext_Pos << 2);
			end
			5'b01001, 5'b01010 : begin
				pp[i] = ((A_Ext_Pos << 2) + A_Ext_Pos);
			end
			5'b01011, 5'b01100 : begin
				pp[i] = ((A_Ext_Pos << 2) + (A_Ext_Pos << 1));
			end
			5'b01101, 5'b01110 : begin
				pp[i] = ((A_Ext_Pos << 3) + A_Ext_Neg);
			end
			5'b01111 : begin
				pp[i] = (A_Ext_Pos << 3);
			end
			5'b10000 : begin
				pp[i] = (A_Ext_Neg << 3);
			end
			5'b10001, 5'b10010 : begin
				pp[i] = ((A_Ext_Neg << 3) + A_Ext_Pos);
			end
			5'b10011, 5'b10100 : begin
				pp[i] = ((A_Ext_Neg << 2) + (A_Ext_Neg << 1));
			end
			5'b10101, 5'b10110 : begin
				pp[i] = ((A_Ext_Neg << 2) + A_Ext_Neg);
			end
			5'b10111, 5'b11000 : begin
				pp[i] = (A_Ext_Neg << 2);
			end
			5'b11001, 5'b11010 : begin
				pp[i] = (A_Ext_Neg << 1 + A_Ext_Neg);
			end
			5'b11011, 5'b11100 : begin
				pp[i] = (A_Ext_Neg << 1);

			end
			5'b11101, 5'b11110 : begin
				pp[i] = A_Ext_Neg;
			end
		endcase
		A_Ext_Pos = A_Ext_Pos << 4;
		A_Ext_Neg = A_Ext_Neg << 4;
		B_Zero = B_Zero >> 4;
	end
end
endmodule

