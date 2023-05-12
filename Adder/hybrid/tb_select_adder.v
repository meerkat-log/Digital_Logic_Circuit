module tb_select_adder();

reg [15:0] a, b;
reg ci, c4, c8, c12;
wire [15:0] s;

select_adder sa0(.a(a), .b(b), .ci(c0), .c4(c4), .c8(c8), .c12(c12), .s(s));

initial begin
	a = 16'b1010_0000_1111_0101;
	b = 16'b0101_1111_0000_1010;
	ci = 0;
	c4 = 0;
	c8 = 0;
	c12 = 1;
end

endmodule