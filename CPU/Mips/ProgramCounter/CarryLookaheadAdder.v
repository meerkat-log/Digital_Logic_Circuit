`timescale 1ns/1ns
module CarryLookaheadAdder(n ,a, b, ci, sum, co);

input [2:0] n;
input [4:0] a, b;
input ci;
output [4:0] sum;
output co;

reg [4:0] sum;
reg co;

wire [4:0] sum_tmp;
wire p0, p1, p2, p3, p4;
wire g0, g1, g2, g3, g4;
reg c1, c2, c3, c4;

PartialFullAdder pfa0(.a(a[0]), .b(b[0]), .ci(ci), .sum(sum_tmp[0]), .g(g0), .p(p0));
PartialFullAdder pfa1(.a(a[1]), .b(b[1]), .ci(c1), .sum(sum_tmp[1]), .g(g1), .p(p1));
PartialFullAdder pfa2(.a(a[2]), .b(b[2]), .ci(c2), .sum(sum_tmp[2]), .g(g2), .p(p2));
PartialFullAdder pfa3(.a(a[3]), .b(b[3]), .ci(c3), .sum(sum_tmp[3]), .g(g3), .p(p3));
PartialFullAdder pfa4(.a(a[4]), .b(b[4]), .ci(c4), .sum(sum_tmp[4]), .g(g4), .p(p4));

always @(*) begin
case(n)
	3'd2 : begin
		#20 c1 <= g0 | (p0 & ci);
		#40 co <= g1 | (p1 & g0) | (p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd3 : begin
		#20 c1 <= g0 | (p0 & ci);
		#40 c2 <= g1 | (p1 & g0) | (p1 & p0 & ci);
		#60 co <= g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd4 : begin
		#20 c1 <= g0 | (p0 & ci);
		#40 c2 <= g1 | (p1 & g0) | (p1 & p0 & ci);
		#60 c3 <= g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		#80 co <= g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd5 : begin
		#20 c1 <= g0 | (p0 & ci);
		#40 c2 <= g1 | (p1 & g0) | (p1 & p0 & ci);
		#60 c3 <= g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		#80 c4 <= g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & ci);
		#100 co <= g4 | (p4 & g3) | (p4 & p3 & g2) | (p4 & p3 & p2 & g1) | (p4 & p3 & p2 & p1 & g0) | (p4 & p3 & p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
endcase
end

endmodule
