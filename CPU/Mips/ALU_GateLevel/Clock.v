`timescale 1ns/1ns

module Clock_Radix(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#50 CLK = 1'b0;
	#500 CLK = 1'b1;
end

endmodule
	

module Clock_Register(CLK);

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

module Clock_Counter(CLK);

output CLK;
reg CLK;

initial begin
	CLK = 1'b1;
end

always begin
	#300 CLK = 1'b0;
	#300 CLK = 1'b1;
end

endmodule