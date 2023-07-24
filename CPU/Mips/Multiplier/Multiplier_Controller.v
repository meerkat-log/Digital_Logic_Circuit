`timescale 1ns/1ns

// The Multiplier Controller module sends out signals for Enable, Reset, and Preset and exports Count indicating the current process.

module Multiplier_Controller(En, Reset, Count, Preset);

output En;
output reg Reset;
output [3:0] Count, Preset;

reg En0;
wire CounterReset, CounterResetIn;

// Clock for Enable
Clock_En CLOCKEN(En);
// Clock for Preset Counter
Clock_200 CLOCK200(Clk200);
// Clock for Process Counter
Clock_400 CLOCK400(Clk400);

// Counters from 0 to 8. 
// When zero, the registers are in the initialization stage, and the Boot Multiplier operates from 1 to 8.
Counter_Mod9 COUNTER(.Clk(Clk400), .En(En0), .Reset(CounterResetIn), .Out(Count));
and Counter_Mod9_Reset(CounterReset, Count[0], Count[3]);
or Counter_Reset_In(CounterResetIn, CounterReset, Reset);

// Counters for Preset Mux
Counter_Mod9 PRESET(.Clk(Clk200), .En(En0), .Reset(Reset), .Out(Preset));

initial begin
	Reset = 1'b1; En0 = 1'b0;
	#300; Reset = 1'b0; En0 = 1'b1;
end

endmodule

