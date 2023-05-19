module tb_Carry_Select_Adder();

reg [15:0] a, b;
reg ci;
wire [15:0] sum;
wire co;

Carry_Select_Adder cas(.a(a), .b(b), .ci(ci), .sum(sum), .co(co));

initial begin
	a <= 16'b1111_1100_0011_0000;
	b <= 16'b0000_0011_1100_1111;
	ci <= 1'b1;
end

endmodule
