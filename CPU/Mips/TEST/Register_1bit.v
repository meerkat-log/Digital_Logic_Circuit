module Register_1bit(Clk, En, Reset, In, Out);

input Clk, En, Reset, In;
output Out;

D_FlipFlop DFF(.Clk(Clk), .En(En), .Reset(Reset), .D(In), .Q(Out));

endmodule
