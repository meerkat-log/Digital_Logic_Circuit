`timescale 1ns/1ns

module FirstStage(Clk, En, Reset, Count, A, B, Sign, AfterA, Num);

input Clk, En, Reset;
input [3:0] Count;
input [63:0] A;
input [32:0] B;
output Sign;
output [63:0] AfterA;
output [3:0] Num;

RadixSelector RS(.Count(Count), .B(B), .Sign(Sign), .Out(Num));
assign AfterA = {A[59:0], 4'b0000};

endmodule

