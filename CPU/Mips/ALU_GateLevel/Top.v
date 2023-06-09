module Top(A, B, ALUOp, InstructionOp, High, Low, ZeroFlag);

input [31:0] A, B;
input [1:0] ALUOp;
input [5:0] InstructionOp;
output [31:0] High, Low;
output ZeroFlag;

wire [3:0] ALUControlSig;

ALU_Control ALU_CONTROL(.ALUOp(ALUOp), .InstructionOp(InstructionOp), .ALUControlInput(ALUControlSig));
ALU ALU_OUT(.A(A), .B(B), .Control(ALUControlSig), .High(High), .Low(Low), .ZeroFlag(ZeroFlag));

endmodule