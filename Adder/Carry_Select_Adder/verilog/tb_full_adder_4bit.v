module tb_full_adder_4bit();

reg [3:0] a, b;
reg ci;
wire [3:0] sum;
wire co;

full_adder_4bit fa0(.a(a), .b(b), .ci(ci), .sum(sum), .co(co));

initial begin
	a <= 4'b1010;
	b <= 4'b0101;
	ci <= 1'b0;
end

endmodule
