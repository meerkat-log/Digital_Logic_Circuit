module ALU_Control(ALUOp, InstructionOp, ALUControlInput);

input [1:0] ALUOp;
input [5:0] InstructionOp;
output [3:0] ALUControlInput;

wire [3:0] InsSel;

Mux4to1_4bit MUX_ALU(.I0(4'b0010), .I1(4'b0110), .I2(InsSel), .Sel(ALUOp), .Out(ALUControlInput));
Mux64to1_4bit MUX_INS(.I32(4'b0010), .I33(4'b0011), .I34(4'b0110), .I35(4'b0100), .I36(4'b0000), .I37(4'b0001), .I42(4'b0111), .Sel(InstructionOp), .Out(InsSel)); 

endmodule


