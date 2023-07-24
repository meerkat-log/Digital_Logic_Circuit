`timescale 1ns/1ns

module Clock_390(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#195 CLK = 1'b0;
	#195 CLK = 1'b1;
end

endmodule

