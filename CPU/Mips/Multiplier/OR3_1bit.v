`timescale 1ns/1ns

module OR3_1bit(A, B, C, Out);

input A, B, C;
output Out;

wire tmp0;

OR2_1bit OR2_0(.A(A), .B(B), .Out(tmp0));
OR2_1bit OR2_1(.A(tmp0), .B(C), .Out(Out));

endmodule



module TB_OR3_1bit();

reg A, B, C;
wire Out;

OR3_1bit OR(.A(A), .B(B), .C(C), .Out(Out));

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
