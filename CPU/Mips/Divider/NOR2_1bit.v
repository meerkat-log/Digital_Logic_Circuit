`timescale 1ns/1ns

module NOR2_1bit(A, B, Out);

input A, B;
output Out;

wire Tmp;

OR2_1bit OR(.A(A), .B(B), .Out(Tmp));
NOT_1bit NOT(.A(Tmp), .Out(Out));

endmodule

module TB_NOR2_1bit();

reg A, B;
wire Out;

NOR2_1bit NOR(.A(A), .B(B), .Out(Out));

initial begin
	A = 1'b0; B = 1'b0;
	#100;
	A = 1'b0; B = 1'b1;
	#100;
	A = 1'b1; B = 1'b0;
	#100;
	A = 1'b1; B = 1'b1;
end
endmodule
