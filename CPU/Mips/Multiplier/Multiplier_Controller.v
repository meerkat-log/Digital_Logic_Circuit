`timescale 1ns/1ns

module Multiplier_Controller(En, Reset, Count);

output En;
output reg Reset;
output [2:0] Count;

reg En0;

Clock_En CLOCKEN(En);
Clock_400 CLOCK400(Clk400);
Counter_Mod8 COUNTER(.Clk(Clk400), .En(En0), .Reset(Reset), .Out(Count));

initial begin
	Reset = 1'b0; En0 = 1'b0;
	#100;
	Reset = 1'b1; En0 = 1'b1;
end

endmodule

