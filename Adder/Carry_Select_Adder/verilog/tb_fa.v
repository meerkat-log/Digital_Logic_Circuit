`timescale 1ns/1ps

module tb_fa();

reg a, b, ci;
wire s, co;

fa fa0(.a(a), .b(b), .ci(ci), .s(s), .co(co));

initial begin
	#10 a = 1'b0; b = 1'b0; ci = 1'b0;
	#10 a = 1'b0; b = 1'b1; ci = 1'b0;
	#10 a = 1'b1; b = 1'b0; ci = 1'b0;
	#10 a = 1'b1; b = 1'b1; ci = 1'b0;

	#10 a = 1'b0; b = 1'b0; ci = 1'b1;
	#10 a = 1'b0; b = 1'b1; ci = 1'b1;
	#10 a = 1'b1; b = 1'b0; ci = 1'b1;
	#10 a = 1'b1; b = 1'b1; ci = 1'b1;
end
endmodule
