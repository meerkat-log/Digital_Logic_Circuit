module T_FlipFlop(Clk, En, Reset, T, Q, Qbar);

input Clk, En, Reset, T;
output Q, Qbar;

XOR2_1bit D_IN(.A(T), .B(Q), .Out(Din));
D_FlipFlop DFF(.Clk(Clk), .En(En), .Reset(Reset), .D(Din), .Q(Q), .Qbar(Qbar));

endmodule

