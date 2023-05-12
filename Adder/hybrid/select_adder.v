module select_adder(a, b, ci, c4, c8, c12, s);

input [15:0] a, b;
input ci, c4, c8, c12;
output [15:0] s;

wire [3:0] sum_3to0_0, sum_3to0_1, sum_7to4_0, sum_7to4_1, sum_11to8_0, sum_11to8_1, sum_15to12_0, sum_15to12_1;

full_adder_4bit fa_3to0_0(.a(a[3:0]), .b(b[3:0]), .ci(1'b0), .s(sum_3to0_0));
full_adder_4bit fa_3to0_1(.a(a[3:0]), .b(b[3:0]), .ci(1'b1), .s(sum_3to0_1));

full_adder_4bit fa_7to4_0(.a(a[7:4]), .b(b[7:4]), .ci(1'b0), .s(sum_7to4_0));
full_adder_4bit fa_7to4_1(.a(a[7:4]), .b(b[7:4]), .ci(1'b1), .s(sum_7to4_1));

full_adder_4bit fa_11to8_0(.a(a[11:8]), .b(b[11:8]), .ci(1'b0), .s(sum_11to8_0));
full_adder_4bit fa_11to8_1(.a(a[11:8]), .b(b[11:8]), .ci(1'b1), .s(sum_11to8_1));

full_adder_4bit fa_15to12_0(.a(a[15:12]), .b(b[15:12]), .ci(1'b0), .s(sum_15to12_0));
full_adder_4bit fa_15to12_1(.a(a[15:12]), .b(b[15:12]), .ci(1'b1), .s(sum_15to12_1));

mux_21 mux_3to0(.a(sum_3to0_0), .b(sum_3to0_1), .sel(ci), .out(s[3:0]));
mux_21 mux_7to4(.a(sum_7to4_0), .b(sum_7to4_1), .sel(c4), .out(s[7:4]));
mux_21 mux_11to8(.a(sum_11to8_0), .b(sum_11to8_1), .sel(c8), .out(s[11:8]));
mux_21 mux_15to12(.a(sum_15to12_0), .b(sum_15to12_1), .sel(c12), .out(s[15:12]));

endmodule
