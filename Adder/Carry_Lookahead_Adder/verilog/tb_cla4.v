`timescale 1ns/1ps

module tb_cla4();

reg [3:0] a, b;
reg ci;
wire [3:0] s;
wire co, gg, pg;

cla4 U0(.a(a), .b(b), .ci(ci), .co(co), .s(s), .gg(gg), .pg(pg));

initial begin
	#10 a = 4'b1001; b = 4'b0110; ci = 1'b1;

end
endmodule
