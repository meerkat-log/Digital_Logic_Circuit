`timescale 1ns/1ns

module Clock(Clk);

output Clk;
reg Clk;

initial begin
	Clk = 1'b0;
end

always begin
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
end

endmodule
	
