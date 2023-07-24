`timescale 1ns/1ns

module Clock_200(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#100 CLK = 1'b0;
	#100 CLK = 1'b1;
end

endmodule

