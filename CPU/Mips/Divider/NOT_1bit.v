`timescale 1ns/1ns

module NOT_1bit(A, Out);

input A;
output Out;

assign #5 Out = ~A;

endmodule

module TB_NOT_1ibt();

reg A;
wire Out;

NOT_1bit NOT(.A(A), .Out(Out));

initial begin
	A = 1'b0;
	#100;
	A = 1'b1;
end
endmodule
