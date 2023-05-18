`timescale 1ns/1ns

module tb_top();

reg [15:0] a, b;
reg ci;
wire [15:0] sum;
wire co;

integer count;

top top0(.a(a), .b(b), .ci(ci), .sum(sum), .co(co));

initial begin
	count = 0;
	a <= 0; b <= 131071; ci <= 1;
	while(count < 17) begin
		a = (a << 1) | 1'b1;
		b = b << 1;
		count = count + 1;
		#100;
	end

end

endmodule
