`timescale 1ns/1ps

module tb_mux21_vector();

reg [3:0] d0, d1;
reg sel;
wire [3:0] out;

mux21_vector U0(.d0(d0), .d1(d1), .sel(sel), .out(out));

initial begin
	#10 d0 = 4'b1001; d1 = 4'b0110; sel = 1'b0;
	#10 d0 = 4'b1001; d1 = 4'b0000; sel = 1'b1;
	#10 d0 = 4'b0110; d1 = 4'b1100; sel = 1'b1;
end
endmodule
