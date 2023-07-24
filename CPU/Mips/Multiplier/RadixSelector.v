`timescale 1ns/1ns

// It receives the current Count and B and outputs Radix as the Count value from Mux, and outputs the Sign bit and the number from the LookUp Table.
module RadixSelector(Count, B, Sign, Out);

input [3:0] Count;
input [32:0] B;
output Sign;
output [3:0] Out;

wire [4:0] Radix;

Mux16to1_5bit MUX(.I0(B[4:0]), .I1(B[8:4]), .I2(B[12:8]), .I3(B[16:12]), .I4(B[20:16]), .I5(B[24:20]), .I6(B[28:24]), .I7(B[32:28]), .I8(5'b00000), .Sel(Count), .Out(Radix));
RadixLookUpTable LUT(.Radix(Radix), .Sign(Sign), .Out(Out));

endmodule



module tb_RadixSelector();

reg [2:0] Count;
reg [32:0] B;
wire [4:0] Out;

RadixSelector RS(.Count(Count), .B(B), .Out(Out));

integer i;
initial begin
	B = $urandom;
	for(i = 0; i < 8; i = i + 1) begin
		Count = i;
		#100;

		
	end
end
endmodule

