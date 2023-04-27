`timescale 1ns/1ps

module tb_mux21_bit();

reg d0, d1, sel;
wire out;

mux21_bit U0(.d0(d0), .d1(d1), .sel(sel), .out(out));

initial begin
	#10 d0 = 1'b1; d1 = 1'b1; sel = 1'b0;
	#10 d0 = 1'b0; d1 = 1'b0; sel = 1'b1;
	#10 d0 = 1'b0; d1 = 1'b1; sel = 1'b1;
end
endmodule