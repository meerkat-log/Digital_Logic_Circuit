`timescale 1ns/1ns

module Clock_100(Clk);

output reg Clk;

initial begin
	Clk = 1'b1;
end

always begin
	#50 Clk = 1'b0;
	#50 Clk = 1'b1;
end
endmodule



module TB_Clock_100();

wire Clk;

Clock_100 CLOCK(.Clk(Clk));

endmodule
