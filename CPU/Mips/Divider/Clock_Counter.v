`timescale 1ns/1ns

module Clock_Counter(Clk);

output reg Clk;

initial begin
	Clk = 1'b0;
end

always begin
	#200 Clk = 1'b1;
	#100 Clk = 1'b0;
end
endmodule
