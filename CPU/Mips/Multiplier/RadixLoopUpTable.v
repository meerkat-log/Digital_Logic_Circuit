`timescale 1ns/1ns

module RadixLookUpTable(Radix, Sign, Out);

input [4:0] Radix;
output reg Sign;
output reg [3:0] Out;

always @(Radix) begin
	case(Radix)
		5'b00000 : begin Out = 4'b0000; Sign = 1'b0; end
		5'b00001 : begin Out = 4'b0001; Sign = 1'b0; end
		5'b00010 : begin Out = 4'b0001; Sign = 1'b0; end
		5'b00011 : begin Out = 4'b0010; Sign = 1'b0; end
		5'b00100 : begin Out = 4'b0010; Sign = 1'b0; end
		5'b00101 : begin Out = 4'b0011; Sign = 1'b0; end
		5'b00110 : begin Out = 4'b0011; Sign = 1'b0; end
		5'b00111 : begin Out = 4'b0100; Sign = 1'b0; end
		5'b01000 : begin Out = 4'b0100; Sign = 1'b0; end
		5'b01001 : begin Out = 4'b0101; Sign = 1'b0; end
		5'b01010 : begin Out = 4'b0101; Sign = 1'b0; end
		5'b01011 : begin Out = 4'b0110; Sign = 1'b0; end
		5'b01100 : begin Out = 4'b0110; Sign = 1'b0; end
		5'b01101 : begin Out = 4'b0111; Sign = 1'b0; end
		5'b01110 : begin Out = 4'b0111; Sign = 1'b0; end
		5'b01111 : begin Out = 4'b1000; Sign = 1'b0; end
		5'b10000 : begin Out = 4'b1000; Sign = 1'b1; end
		5'b10001 : begin Out = 4'b0111; Sign = 1'b1; end
		5'b10010 : begin Out = 4'b0111; Sign = 1'b1; end
		5'b10011 : begin Out = 4'b0110; Sign = 1'b1; end
		5'b10100 : begin Out = 4'b0110; Sign = 1'b1; end
		5'b10101 : begin Out = 4'b0101; Sign = 1'b1; end
		5'b10110 : begin Out = 4'b0101; Sign = 1'b1; end
		5'b10111 : begin Out = 4'b0100; Sign = 1'b1; end
		5'b11000 : begin Out = 4'b0100; Sign = 1'b1; end
		5'b11001 : begin Out = 4'b0011; Sign = 1'b1; end
		5'b11010 : begin Out = 4'b0011; Sign = 1'b1; end
		5'b11011 : begin Out = 4'b0010; Sign = 1'b1; end
		5'b11100 : begin Out = 4'b0010; Sign = 1'b1; end
		5'b11101 : begin Out = 4'b0001; Sign = 1'b1; end
		5'b11110 : begin Out = 4'b0001; Sign = 1'b1; end
		5'b11111 : begin Out = 4'b0000; Sign = 1'b1; end


	endcase
end
endmodule

module tb_RadixLookupTable();

reg [4:0] Radix;
wire Sign;
wire [3:0] Out;

RadixLookupTable LUT(.Radix(Radix), .Sign(Sign), .Out(Out));

integer i;
initial begin
	for(i = 0; i < 32; i = i + 1) begin
		Radix = i;
		#100;
	end
end
endmodule

