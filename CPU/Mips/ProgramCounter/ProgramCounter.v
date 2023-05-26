module ProgramCounter(Clk, Reset, PresentState, NextState);

input Clk, Reset;
input [31:0] NextState;
output reg [31:0] PresentState;

initial begin
	PresentState <= 32'h0000_0000;
end

always @(posedge Clk or Reset) begin
	if(Reset) begin
		PresentState <= 32'h0000_0000;
	end
	else begin
		if(Clk) begin
			PresentState <= NextState;
		end
	end
end

endmodule
