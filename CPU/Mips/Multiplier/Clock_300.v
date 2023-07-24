`timescale 1ns/1ns

module Clock_300(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#150 CLK = 1'b0;
	#150 CLK = 1'b1;
end

endmodule

