`timescale 1ns/1ns

module carry_select_adder(n, a, b, ci, sum, co);

input [2:0] n;
input [4:0] a, b;
input ci;
output [4:0] sum;
output co;

reg [4:0] sum;
reg co;

wire [4:0]cla2_0_sum_tmp, cla2_1_sum_tmp, cla2_sum_tmp, cla3_0_sum_tmp, cla3_1_sum_tmp, cla3_sum_tmp, cla4_0_sum_tmp, cla4_1_sum_tmp, cla4_sum_tmp, cla5_0_sum_tmp, cla5_1_sum_tmp, cla5_sum_tmp;
wire cla2_0_co_tmp, cla2_1_co_tmp, cla2_co_tmp, cla3_0_co_tmp, cla3_1_co_tmp, cla3_co_tmp, cla4_0_co_tmp, cla4_1_co_tmp, cla4_co_tmp, cla5_0_co_tmp, cla5_1_co_tmp, cla5_co_tmp;

carry_lookahead_adder cla2_0(.n(3'd2), .a(a), .b(b), .ci(1'b0), .sum(cla2_0_sum_tmp), .co(cla2_0_co_tmp));
carry_lookahead_adder cla2_1(.n(3'd2), .a(a), .b(b), .ci(1'b1), .sum(cla2_1_sum_tmp), .co(cla2_1_co_tmp));
mux2_to_1 mux_cla2_co(.i0(cla2_0_co_tmp), .i1(cla2_1_co_tmp), .sel(ci), .out(cla2_co_tmp));
mux2_to_1 mux_cla2_sum(.i0(cla2_0_sum_tmp), .i1(cla2_1_sum_tmp), .sel(ci), .out(cla2_sum_tmp));

carry_lookahead_adder cla3_0(.n(3'd3), .a(a), .b(b), .ci(1'b0), .sum(cla3_0_sum_tmp), .co(cla3_0_co_tmp));
carry_lookahead_adder cla3_1(.n(3'd3), .a(a), .b(b), .ci(1'b1), .sum(cla3_1_sum_tmp), .co(cla3_1_co_tmp));
mux2_to_1 mux_cla3_co(.i0(cla3_0_co_tmp), .i1(cla3_1_co_tmp), .sel(ci), .out(cla3_co_tmp));
mux2_to_1 mux_cla3_sum(.i0(cla3_0_sum_tmp), .i1(cla3_1_sum_tmp), .sel(ci), .out(cla3_sum_tmp));

carry_lookahead_adder cla4_0(.n(3'd4), .a(a), .b(b), .ci(1'b0), .sum(cla4_0_sum_tmp), .co(cla4_0_co_tmp));
carry_lookahead_adder cla4_1(.n(3'd4), .a(a), .b(b), .ci(1'b1), .sum(cla4_1_sum_tmp), .co(cla4_1_co_tmp));
mux2_to_1 mux_cla4_co(.i0(cla4_0_co_tmp), .i1(cla4_1_co_tmp), .sel(ci), .out(cla4_co_tmp));
mux2_to_1 mux_cla4_sum(.i0(cla4_0_sum_tmp), .i1(cla4_1_sum_tmp), .sel(ci), .out(cla4_sum_tmp));

carry_lookahead_adder cla5_0(.n(3'd5), .a(a), .b(b), .ci(1'b0), .sum(cla5_0_sum_tmp), .co(cla5_0_co_tmp));
carry_lookahead_adder cla5_1(.n(3'd5), .a(a), .b(b), .ci(1'b1), .sum(cla5_1_sum_tmp), .co(cla5_1_co_tmp));
mux2_to_1 mux_cla5_co(.i0(cla5_0_co_tmp), .i1(cla5_1_co_tmp), .sel(ci), .out(cla5_co_tmp));
mux2_to_1 mux_cla5_sum(.i0(cla5_0_sum_tmp), .i1(cla5_1_sum_tmp), .sel(ci), .out(cla5_sum_tmp));

always @(*) begin
case(n)
	3'd2 : begin
		sum <= cla2_sum_tmp;
		co <= cla2_co_tmp;
	end
	3'd3 : begin
		sum <= cla3_sum_tmp;
		co <= cla3_co_tmp;
	end
	3'd4 : begin
		sum <= cla4_sum_tmp;
		co <= cla4_co_tmp;
	end
	3'd5 : begin
		sum <= cla5_sum_tmp;
		co <= cla5_co_tmp;
	end
	default : $display("Invalid N bits.");
endcase
end

endmodule
