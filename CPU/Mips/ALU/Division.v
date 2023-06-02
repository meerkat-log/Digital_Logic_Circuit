`timescale 1ns/1ns

module Division(A, B, QR);

input [15:0] A, B;
output reg [31:0] QR;

integer i;

reg [15:0] A_tmp;
wire [15:0] A_sub;

initial begin
	i = 0;
end
assign A_tmp = A;


//Subtractor Sub(.a({{16{A_tmp[15]}},A_tmp}), .b({{16{B[15]}},B}), .sum(A_sub));

always @(*) begin
	while(A_tmp >= B & B > 0) begin
		A_tmp = A_tmp - B;
		//A_tmp = A_sub;
		i = i + 1;
	end
	QR[15:0] <= A_tmp;
	QR[31:16] <= i;
end

endmodule