`timescale 1ns/1ps
module tb_traffic_fsm();

reg clk, reset;
wire [6:0] count;
wire [1:0] light;
wire [1:0] state;

parameter clk_period = 10;

traffic_fsm U0(.clk(clk), .reset(reset), .count(count), .light(light));

initial begin
	reset = 0;
	#13 reset = 1;
	#(clk_period) reset = 0;
end

always begin
	clk = 0;
	forever #(clk_period/2) clk = ~clk;
end

always begin
	#3 $display("%b", light);
end
endmodule
