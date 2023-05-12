`timescale 1ns/10ps

module tb_carry_generate();

reg ci;
reg [15:0] a, b;
wire c4, c8, c12, c16;

carry_generate carry0(.a(a), .b(b), .ci(ci), .c4(c4), .c8(c8), .c12(c12), .c16(c16));

initial begin
	a = 16'b0000_0000_1000_0000;
	b = 16'b0000_0000_1000_0000;
	ci = 0;
end

endmodule
