`timescale 1ns/1ns

module AND3_1bit(A, B, C, Out);

input A, B, C;
output Out;

wire tmp0;

AND2_1bit AND2_0(.A(A), .B(B), .Out(tmp0));
AND2_1bit AND2_1(.A(tmp0), .B(C), .Out(Out));

endmodule

module TB_AND3_1bit();

reg A, B, C;
wire Out;

AND3_1bit AND(.A(A), .B(B), .C(C), .Out(Out));

initial begin
	A = 1'b0; B = 1'b0; C = 1'b0;
	#100;
	A = 1'b0; B = 1'b0; C = 1'b1;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b0;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b1;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b0;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b1;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b0;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b1;
end
endmodule
