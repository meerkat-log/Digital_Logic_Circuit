`timescale 1ns/1ns

module Clock(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#50 CLK = 1'b0;
	#50 CLK = 1'b1;
end

endmodule
	
