`timescale 1ns/1ns

module Divider(A, B, Q, R);

input [31:0] A, B;
output reg [31:0] Q, R;

integer i;

reg [31:0] A_tmp;
wire [31:0] A_sub;

initial begin
	i = 0;
end

assign A_tmp = A;

always @(*) begin
	while(A_tmp >= B & B > 0) begin
		A_tmp = A_tmp - B;
		i = i + 1;
	end
	Q <= A_tmp;
	R <= i;
end

endmodule
