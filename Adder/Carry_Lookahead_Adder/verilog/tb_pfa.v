`timescale 1ns/1ps

module tb_pfa();

reg a, b, c;
wire s, g, p;

pfa U0(.a(a), .b(b), .c(c), .s(s), .g(g), .p(p));

initial begin
	#10 a = 1'b0; b = 1'b0; c = 1'b0;
	#10 a = 1'b0; b = 1'b0; c = 1'b1;
	#10 a = 1'b0; b = 1'b1; c = 1'b0;
	#10 a = 1'b0; b = 1'b1; c = 1'b1;
	#10 a = 1'b1; b = 1'b0; c = 1'b0;
	#10 a = 1'b1; b = 1'b0; c = 1'b1;
	#10 a = 1'b1; b = 1'b1; c = 1'b0;
	#10 a = 1'b1; b = 1'b1; c = 1'b1;
end
endmodule
