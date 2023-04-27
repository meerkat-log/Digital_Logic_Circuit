`timescale 1ns/1ps

module tb_csa16();

reg [15:0] a, b;
reg ci;
wire [15:0] s;
wire co;

csa16 U0(.a(a), .b(b), .ci(ci), .s(s), .co(co));

initial begin
	#10 a = 16'b1000_0100_0010_0001; b = 16'b0001_0010_0100_1000; ci = 1'b0;
	#100 a = 16'b1000_0100_0010_0001; b = 16'b0001_0010_0100_1000; ci = 1'b1;
end
endmodule