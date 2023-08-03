`timescale 1ns/1ns

module Comparator_1bit(A, B, ALB, AEB, AGB);

input A, B;
output ALB, AEB, AGB;

NOT_1bit NOTA(.A(A), .Out(NotA));
NOT_1bit NOTB(.A(B), .Out(NotB));

AND2_1bit ALBOUT(.A(NotA), .B(B), .Out(ALB));
AND2_1bit AGBOUT(.A(NotB), .B(A), .Out(AGB));

NOR2_1bit AEBOUT(.A(ALB), .B(AGB), .Out(AEB));

endmodule


module TB_Comparator_1bit();

reg A, B;
wire ALB, AEB, AGB;

Comparator_1bit CMP(.A(A), .B(B), .ALB(ALB), .AEB(AEB), .AGB(AGB));

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
