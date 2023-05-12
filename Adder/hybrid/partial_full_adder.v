module partial_full_adder(a, b, g, p);

input a, b;
output g, p;

or2 or_2(.a(a), .b(b), .out(p));
and2 and_2(.a(a), .b(b), .out(g));

endmodule