`timescale 1ns/1ns

module Clock_400(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#200 CLK = 1'b0;
	#200 CLK = 1'b1;
end

endmodule

