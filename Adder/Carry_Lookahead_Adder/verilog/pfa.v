module pfa(a, b, c, s, g, p);

input a, b, c;
output s, g, p;

wire tmp_xor2;

and2 U_AND2(.a(a), .b(b), .out(g));
xor2 U_XOR2_0(.a(a), .b(b), .out(tmp_xor2));
xor2 U_XOR2_1(.a(tmp_xor2), .b(c), .out(s));
assign p = tmp_xor2;
endmodule

