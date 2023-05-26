module ShiftLeft(BeforeShift, AfterShift);

input [31:0] BeforeShift;
output [31:0] AfterShift;

assign AfterShift = BeforeShift << 2;

endmodule