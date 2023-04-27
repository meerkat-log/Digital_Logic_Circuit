module csa16(a, b, ci, s, co);

input [15:0] a, b;
input ci;
output [15:0] s;
output co;

wire c4;
wire c8, c8_tmp0, c8_tmp1;
wire c12, c12_tmp0, c12_tmp1;
wire c16_tmp0, c16_tmp1;
wire [3:0] s8_tmp0, s8_tmp1;
wire [3:0] s12_tmp0, s12_tmp1;
wire [3:0] s16_tmp0, s16_tmp1;

fa4 a4_0(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c4));

fa4 a8_0(.a(a[7:4]), .b(b[7:4]), .ci(1'b0), .s(s8_tmp0), .co(c8_tmp0));
fa4 a4_1(.a(a[7:4]), .b(b[7:4]), .ci(1'b1), .s(s8_tmp1), .co(c8_tmp1));
mux21_vector m8_s(.d0(s8_tmp0), .d1(s8_tmp1), .sel(c4), .out(s[7:4]));
mux21_bit m8_c(.d0(c8_tmp0), .d1(c8_tmp1), .sel(c4), .out(c8));

fa4 a12_0(.a(a[11:8]), .b(b[11:8]), .ci(1'b0), .s(s12_tmp0), .co(c12_tmp0));
fa4 a12_1(.a(a[11:8]), .b(b[11:8]), .ci(1'b1), .s(s12_tmp1), .co(c12_tmp1));
mux21_vector m12_s(.d0(s12_tmp0), .d1(s12_tmp1), .sel(c8), .out(s[11:8]));
mux21_bit m12_c(.d0(c12_tmp0), .d1(c12_tmp1), .sel(c8), .out(c12));

fa4 a16_0(.a(a[15:12]), .b(b[15:12]), .ci(1'b0), .s(s16_tmp0), .co(c16_tmp0));
fa4 a16_1(.a(a[15:12]), .b(b[15:12]), .ci(1'b1), .s(s16_tmp1), .co(c16_tmp1));
mux21_vector m16_s(.d0(s16_tmp0), .d1(s16_tmp1), .sel(c12), .out(s[15:12]));
mux21_bit m16_c(.d0(c16_tmp0), .d1(c16_tmp1), .sel(c12), .out(co));

endmodule