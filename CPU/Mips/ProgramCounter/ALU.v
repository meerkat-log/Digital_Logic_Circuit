module ALU(A, B, Control, Out);

input [31:0] A, B;
input [3:0] Control;
output reg [31:0] Out;

always @(*) begin
	case(Control)
		4'b0010 : begin
			Out = A + B;
		end
		4'b0110 : begin
			Out = A - B;
		end
	endcase
end
endmodule

