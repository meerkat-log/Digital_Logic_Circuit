module Multiplier(A, B, Out);

input [31:0] A, B;
output [63:0] Out;

wire Sign, SS_Sign_In;
wire [3:0] Num, SS_Num_In;
wire [63:0] A_Tmp, NextA0, NextA1, NextA2, AfterA, BoothOut, TS_Booth_In, OutIn;
wire [32:0] B_Tmp;
wire [2:0] Count;

assign A_Tmp = {{32{A[31]}}, A};
assign B_Tmp = {B, 1'b0};

Clock_100 CLOCK100(.Clk(Clk));

Multiplier_Controller MCTRL(.En(En), .Reset(Reset), .Count(Count));

// First Stage
// It receives the 5 bits of B and outputs the numbers and signs that must be made.
// And pass the value of A together.
FirstStage FS(.Clk(Clk), .En(En), .Reset(Reset), .Count(Count), .B(B_Tmp), .Sign(Sign), .Num(Num));
Register_1bit REG_SIGN(.Clk(Clk), .En(En), .Reset(Reset), .In(Sign), .Out(SS_Sign_In));
Register_4bit REG_NUM(.Clk(Clk), .En(En), .Reset(Reset), .In(Num), .Out(SS_Num_In));
Register_64bit_with_Preset REG_ShiftA0(.Clk(Clk), .En(En), .Reset(Reset), .Preset(A_Tmp), .In(NextA2), .Out(NextA0));


// Second Stage
// It receives the transmitted number, code, and A and outputs a 4-bit shift value and a Booth result value.
SecondStage SS(.Clk(Clk), .En(En), .Reset(Reset), .A(NextA0), .Sign(Sign), .Num(SS_Num_In), .AfterA(AfterA), .BoothOut(BoothOut));
Register_64bit REG_ShiftA1(.Clk(Clk), .En(En), .Reset(Reset), .In(AfterA), .Out(NextA1));
Register_64bit REG_BOOTH(.Clk(Clk), .En(En), .Reset(Reset), .In(BoothOut), .Out(TS_Booth_In));


// Third Stage
// In the last stage, the existing value and the Booth result value generated in the previous stage are added and stored.
ThirdStage TS(.Clk(Clk), .A(TS_Booth_In), .B(Out), .Out(OutIn));
Register_64bit REG_Result(.Clk(Clk), .En(En), .Reset(Reset), .In(OutIn), .Out(Out));
Register_64bit REG_ShiftA2(.Clk(Clk), .En(En), .Reset(Reset), .In(NextA1), .Out(NextA2));

endmodule



module tb_Multiplier();

reg [31:0] A, B;
wire [63:0] Out;

Multiplier MUL(.A(A), .B(B), . Out(Out));

initial begin
	A = 32'H00000025;
	B = 32'H00000052;
end
endmodule
