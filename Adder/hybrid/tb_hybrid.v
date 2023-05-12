module tb_hybrid();

reg [15:0] a, b;
reg ci;
wire [15:0] s;
wire co;

hybrid hy(.a(a), .b(b), .ci(ci), .s(s), .co(co));

initial begin
	a = 16'b1101_0101_1111_0010;
	b = 16'b1110_1101_0100_1010;
	ci = 0;
end

endmodule