`timescale 1ns/1ns

module OR4_1bit(A, B, C, D, Out);

input A, B, C, D;
output Out;

wire tmp0, tmp1;

OR2_1bit OR2_0(.A(A), .B(B), .Out(tmp0));
OR2_1bit OR2_1(.A(C), .B(D), .Out(tmp1));
OR2_1bit OR2_2(.A(tmp0), .B(tmp1), .Out(Out));

endmodule



module TB_OR4_1bit();

reg A, B, C, D;
wire Out;

OR4_1bit OR(.A(A), .B(B), .C(C), .D(D), .Out(Out));

initial begin
	A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
	#100;
	A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
	#100;
	A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;
	#100;
	A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b0;
	#100;
	A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b0;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0;
	#100;
	A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;
end
endmodule
