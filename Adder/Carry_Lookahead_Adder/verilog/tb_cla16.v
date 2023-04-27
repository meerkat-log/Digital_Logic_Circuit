`timescale 1ns/1ps

module tb_cla16();

reg [15:0] a, b;
reg ci;
wire [15:0] s;
wire co, gg, pg;

cla16 U0(.a(a), .b(b), .ci(ci), .co(co), .s(s), .gg(gg), .pg(pg));

initial begin
	a = 16'b1111_1111_1111_1111; b = 16'b1111_1111_1111_1111; ci = 1'b1;
end
endmodule
