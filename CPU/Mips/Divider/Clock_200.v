`timescale 1ns/1ns

module Clock_200(Clk);

output reg Clk;

initial begin
	Clk = 1'b1;
end

always begin
	#100 Clk = 1'b0;
	#100 Clk = 1'b1;
end
endmodule
