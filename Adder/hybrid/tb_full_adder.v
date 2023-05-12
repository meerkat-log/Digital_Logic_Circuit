module tb_full_adder();

reg a, b, ci;
wire s, co;

full_adder fa(.a(a), .b(b), .ci(ci), .s(s), .co(co));

initial begin
	a = 1;
	b = 0;
	ci = 1;
end

endmodule