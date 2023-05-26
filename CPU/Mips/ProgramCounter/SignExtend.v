module SignExtend(BeforeExtend, AfterExtend);

input [15:0] BeforeExtend;
output reg [31:0] AfterExtend;

always @(BeforeExtend) begin
case(BeforeExtend[15])
	1'b0 : begin
		AfterExtend = {16'h0000, BeforeExtend};
	end
	1'b1 : begin
		AfterExtend = {16'hffff, BeforeExtend};
	end
endcase
end
endmodule
