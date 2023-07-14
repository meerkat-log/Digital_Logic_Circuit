module BoothLookUpTable(In, SelBoothA, SelBoothB, SelBoothC);

input [3:0] In;
output reg [2:0] SelBoothA;
output reg [1:0] SelBoothB;
output reg SelBoothC;

always @(In) begin
	case(In)
		4'b0000 : begin	SelBoothA = 3'b000; SelBoothB = 2'b00; SelBoothC = 1'b0; end
		4'b0001 : begin	SelBoothA = 3'b001; SelBoothB = 2'b00; SelBoothC = 1'b0; end
		4'b0010 : begin	SelBoothA = 3'b010; SelBoothB = 2'b00; SelBoothC = 1'b0; end
		4'b0011 : begin	SelBoothA = 3'b010; SelBoothB = 2'b01; SelBoothC = 1'b0; end
		4'b0100 : begin SelBoothA = 3'b011; SelBoothB = 2'b00; SelBoothC = 1'b0; end
		4'b0101 : begin	SelBoothA = 3'b011; SelBoothB = 2'b01; SelBoothC = 1'b0; end
		4'b0110 : begin	SelBoothA = 3'b011; SelBoothB = 2'b10; SelBoothC = 1'b0; end
		4'b0111 : begin	SelBoothA = 3'b011; SelBoothB = 2'b10; SelBoothC = 1'b1; end
		4'b1000 : begin	SelBoothA = 3'b100; SelBoothB = 2'b00; SelBoothC = 1'b0; end
	endcase
end
endmodule

