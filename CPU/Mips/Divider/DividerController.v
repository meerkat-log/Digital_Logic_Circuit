`timescale 1ns/1ns

module DividerController(Reset);


output reg Reset;

initial begin
	Reset = 1'b1;
	#100;
	Reset = 1'b0;
end
endmodule
