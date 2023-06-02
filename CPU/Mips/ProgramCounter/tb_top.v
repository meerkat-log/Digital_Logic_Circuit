`timescale 1ns/1ns

module tb_top();

reg [5:0] OpCode;
reg [31:0] A, B;
reg [15:0] Address;
reg [3:0] Control;
reg Reset, Zero;

wire [31:0] PresentState;
top tp(.OpCode(OpCode), .Control(Control), .A(A), .B(B), .Address(Address), .Zero(Zero), .Reset(Reset), .PresentState(PresentState));

initial begin
	OpCode <= 6'b000100;
	Control <= 4'b0010;
	A <= 32'h0000_0000;
	B <= 32'h0000_0004;
	Address <= 16'h4321;
	Zero <= 0;
	Reset <= 0;
	#500;
	OpCode <= 6'b000100;
	Control <= 4'b0010;
	A <= 32'h0000_0000;
	B <= 32'h0000_0004;
	Address <= 16'h1234;
	Zero <= 1;
	Reset <= 0;

end
endmodule

