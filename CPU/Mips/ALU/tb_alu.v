module tb_alu();

reg [31:0] A, B;
reg [1:0] rtype;
reg [5:0] andi, ori, addi, muli, divi, subi, slti;

wire [3:0] andc, orc, addc, mulc, divc, subc, sltc;
wire [31:0] ando, oro, addo, mulo, divo, subo, slto;
wire zero;

//AND
ALU_Control ALUC0(.ALUOp(rtype), .InstructionOp(andi), .ALUControlInput(andc));
//OR
ALU_Control ALUC1(.ALUOp(rtype), .InstructionOp(ori), .ALUControlInput(orc));
//ADD
ALU_Control ALUC2(.ALUOp(rtype), .InstructionOp(addi), .ALUControlInput(addc));
//MUL
ALU_Control ALUC3(.ALUOp(rtype), .InstructionOp(muli), .ALUControlInput(mulc));
//DIV
ALU_Control ALUC4(.ALUOp(rtype), .InstructionOp(divi), .ALUControlInput(divc));
//SUB
ALU_Control ALUC5(.ALUOp(rtype), .InstructionOp(subi), .ALUControlInput(subc));
//Set on less than
ALU_Control ALUC6(.ALUOp(rtype), .InstructionOp(slti), .ALUControlInput(sltc));

//AND
ALU ALU0(.A(A), .B(B), .Control(andc), .Out(ando));
//OR
ALU ALU1(.A(A), .B(B), .Control(orc), .Out(oro));
//ADD
ALU ALU2(.A(A), .B(B), .Control(addc), .Out(addo));
//MUL
ALU ALU3(.A(32'h0000_0070), .B(32'h0000_007E), .Control(mulc), .Out(mulo));
//DIV
ALU ALU4(.A(32'h0000_0147), .B(32'h0000_0018), .Control(divc), .Out(divo));
//SUB
ALU ALU5(.A(A), .B(B), .Control(subc), .Out(subo), .ZeroFlag(zero));
//Set on less than
ALU ALU6(.A(A), .B(B), .Control(sltc), .Out(slto));

initial begin
	A = 32'h1234_5678;
	B = 32'h8765_4321;
	rtype = 2'b10;
	andi = 6'b10_0100;
	ori = 6'b10_0101;
	addi = 6'b10_0000;
	subi = 6'b10_0010;
	muli = 6'b10_0001;
	divi = 6'b10_0011;
	slti = 6'b10_1010;
end

endmodule


