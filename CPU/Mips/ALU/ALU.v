module ALU(A, B, Control, Out, ZeroFlag);

input [31:0] A, B;
input [3:0] Control;
output reg [31:0] Out;
output reg ZeroFlag;

wire [31:0] sum, sub, mul, div;

Adder ADD(.a(A), .b(B), .sum(sum));
Subtractor SUB(.a(A), .b(B), .sum(sub));
Multiplier MUL(.A(A), .B(B), .Out(mul));
Division DIV(.A(A), .B(B), .QR(div));


always @(*) begin
	case(Control)
		//AND
		4'b0000 : begin
			Out = A & B;
		end
		//OR
		4'b0001 : begin
			Out = A | B;
		end
		//ADD
		4'b0010 : begin
			Out = sum;
		end
		//MUL
		4'b0011 : begin
			Out = mul;
		end
		//DIV
		4'b0100 : begin
			Out = div;
		end
		//SUB
		4'b0110 : begin
			Out <= sub;
			ZeroFlag <= sub == 0 ? 1 : 0; 
		end
		//Set on less than
		4'b0111 : begin
			Out = A < B ? 1 : 0;
		end
	endcase
end
endmodule
