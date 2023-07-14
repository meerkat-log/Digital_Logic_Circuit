`timescale 1ns/1ns

module AND2_1bit(A, B, Out);

input A, B;
output Out;

assign #10 Out = A & B;

endmodule




module TB_AND2_1bit();

reg A, B;
wire Out;

AND2_1bit AND(.A(A), .B(B), .Out(Out));

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
