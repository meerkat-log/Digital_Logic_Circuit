module FirstStage(Clk, En, Reset, Count, B, Sign, Num);

input Clk, En, Reset;
input [2:0] Count;
input [32:0] B;
output Sign;
output [3:0] Num;

RadixSelector RS(.Count(Count), .B(B), .Sign(Sign), .Out(Num));

endmodule
