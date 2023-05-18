`timescale 1ns/1ns

module carry_lookahead_adder(n ,a, b, ci, sum, co);

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

partial_full_adder pfa0(.a(a[0]), .b(b[0]), .ci(ci), .sum(sum_tmp[0]), .g(g0), .p(p0));
partial_full_adder pfa1(.a(a[1]), .b(b[1]), .ci(c1), .sum(sum_tmp[1]), .g(g1), .p(p1));
partial_full_adder pfa2(.a(a[2]), .b(b[2]), .ci(c2), .sum(sum_tmp[2]), .g(g2), .p(p2));
partial_full_adder pfa3(.a(a[3]), .b(b[3]), .ci(c3), .sum(sum_tmp[3]), .g(g3), .p(p3));
partial_full_adder pfa4(.a(a[4]), .b(b[4]), .ci(c4), .sum(sum_tmp[4]), .g(g4), .p(p4));

always @(*) begin
case(n)
	3'd2 : begin
		c1 <= #20 g0 | (p0 & ci);
		co <= #20 g1 | (p1 & g0) | (p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd3 : begin
		c1 <= #20 g0 | (p0 & ci);
		c2 <= #20 g1 | (p1 & g0) | (p1 & p0 & ci);
		co <= #20 g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd4 : begin
		c1 <= #20 g0 | (p0 & ci);
		c2 <= #20 g1 | (p1 & g0) | (p1 & p0 & ci);
		c3 <= #20 g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		co <= #20 g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
	3'd5 : begin
		c1 <= #20 g0 | (p0 & ci);
		c2 <= #20 g1 | (p1 & g0) | (p1 & p0 & ci);
		c3 <= #20 g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & ci);
		c4 <= #20 g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & ci);
		co <= #20 g4 | (p4 & g3) | (p4 & p3 & g2) | (p4 & p3 & p2 & g1) | (p4 & p3 & p2 & p1 & g0) | (p4 & p3 & p2 & p1 & p0 & ci);
		sum <= sum_tmp;
	end
endcase
end

endmodule
