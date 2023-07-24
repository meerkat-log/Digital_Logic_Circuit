// This Module is the Top Module of the Multiplier.

module Multiplier(A, B, Out);

input [31:0] A, B;
output [63:0] Out;

wire Sign, SS_Sign_In;
wire [3:0] Num, SS_Num_In;
wire [63:0] A_Tmp, NextA, AfterA, BoothOut, TS_Booth_In, OutIn, PresetIn;
wire [32:0] B_Tmp;
wire [3:0] Count, Preset;

// Expand A to 64bit and add 0 to LSB of B to expand to 33bit.
assign A_Tmp = {{32{A[31]}}, A};
assign B_Tmp = {B, 1'b0};

// Clock for Register
Clock_100 CLOCK100(.Clk(Clk));

// Resetting, activating and pre-settings are created, and Radix-5 boot multipliers require eight processes and use the counter to operate according to each process.
Multiplier_Controller MCTRL(.En(En), .Reset(Reset), .Count(Count), .Preset(Preset));

// First Stage
// Enter 5 bits of B to output a number representing the sign bit and the number of A required.
// And it outputs the value that A shifted 4 times to the left.
FirstStage FS(.Clk(Clk), .En(En), .Reset(Reset), .Count(Count), .A(NextA), .B(B_Tmp), .Sign(Sign), .AfterA(AfterA), .Num(Num));
Register_1bit REG_SIGN(.Clk(Clk), .En(En), .Reset(Reset), .In(Sign), .Out(SS_Sign_In));
Register_4bit REG_NUM(.Clk(Clk), .En(En), .Reset(Reset), .In(Num), .Out(SS_Num_In));
// Mux to initially store A value in Register.
Mux16to1_64bit MUX_PRESET(.I0(64'H0000000000000000), .I1(A_Tmp), .I2(64'H0000000000000000), .I3(64'H0000000000000000), .I4(64'H0000000000000000), .I5(64'H0000000000000000), 
			  .I6(64'H0000000000000000), .I7(64'H0000000000000000), .I8(64'H0000000000000000), .I9(64'H0000000000000000), .I10(64'H0000000000000000), 
			  .I11(64'H0000000000000000), .I12(64'H0000000000000000), .I13(64'H0000000000000000), .I14(64'H0000000000000000), .I15(64'H0000000000000000), .Sel(Preset), .Out(PresetIn));
Register_64bit_with_Preset REG_ShiftA0(.Clk(Clk), .En(En), .Reset(Reset), .Preset(PresetIn), .In(AfterA), .Out(NextA));


// Second Stage
// It receives the transmitted number, code, and A and outputs a 4-bit shift value and a Booth result value.
SecondStage SS(.Clk(Clk), .En(En), .Reset(Reset), .A(NextA), .Sign(Sign), .Num(SS_Num_In), .BoothOut(BoothOut));
Register_64bit REG_BOOTH(.Clk(Clk), .En(En), .Reset(Reset), .In(BoothOut), .Out(TS_Booth_In));


// Third Stage
// In the last stage, the existing value and the Booth result value generated in the previous stage are added and stored.
ThirdStage TS(.Clk(Clk), .A(TS_Booth_In), .B(Out), .Out(OutIn));
Register_64bit REG_Result(.Clk(Clk), .En(En), .Reset(Reset), .In(OutIn), .Out(Out));


endmodule



module tb_Multiplier();

reg [31:0] A, B;
wire [63:0] Out;

Multiplier MUL(.A(A), .B(B), . Out(Out));

initial begin
	A = 32'H11111111;
	B = 32'H11111111;
end
endmodule
