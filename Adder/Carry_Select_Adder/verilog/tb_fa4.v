`timescale 1ns/1ps

module tb_fa4();

reg [3:0] a, b;
reg ci;
wire [3:0] s;
wire co;

fa4 fa0(.a(a), .b(b), .ci(ci), .s(s), .co(co));

initial begin
	#10 a = 4'b0110; b = 4'b1001; ci = 1'b0;
	#100 a = 4'b0110; b = 4'b1001; ci = 1'b1;
end
endmodule