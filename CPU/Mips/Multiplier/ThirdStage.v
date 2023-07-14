module ThirdStage(Clk, A, B, Out);

input Clk;
input [63:0] A, B;
output [63:0] Out;

AdderAndSubtractor_64bit ADDER(.A(A), .B(B), .Cin(1'b0), .Out(Out));

endmodule