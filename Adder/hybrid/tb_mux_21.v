module tb_mux_21();

reg [3:0] a, b;
reg sel;
wire [3:0] out;

mux_21 mux0(.a(a), .b(b), .sel(sel), .out(out));

initial begin
	a = 4'b1111;
	b = 4'b0000;
	sel = 0;
end

endmodule