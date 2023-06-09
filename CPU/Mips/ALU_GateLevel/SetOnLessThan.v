module Comparator(A, B, ALB, AEB, AGB);

input A, B;
output ALB, AEB, AGB;

NOT1 NOTA(.A(A), .Out(NotA));
NOT1 NOTB(.A(B), .Out(NotB));

AND2 ALBOUT(.A(NotA), .B(B), .Out(ALB));
AND2 AGBOUT(.A(NotB), .B(A), .Out(AGB));

NOR2 AEBOUT(.A(ALB), .B(AGB), .Out(AEB));

endmodule

module Comparator_4bit(A, B, ALBI, AEBI, AGBI, ALBO, AEBO, AGBO);
input [3:0] A, B;
input ALBI, AEBI, AGBI;
output ALBO, AEBO, AGBO;

wire CMP0_ALB, CMP1_ALB, CMP2_ALB, CMP3_ALB;
wire CMP0_AGB, CMP1_AGB, CMP2_AGB, CMP3_AGB;
wire CMP0_AEB, CMP1_AEB, CMP2_AEB, CMP3_AEB;

wire ALB_Tmp0, ALB_Tmp1, ALB_Tmp2, ALB_Tmp3;
wire AGB_Tmp0, AGB_Tmp1, AGB_Tmp2, AGB_Tmp3;
wire AEB_Tmp0;

Comparator CMP3(.A(A[3]), .B(B[3]), .ALB(CMP3_ALB), .AEB(CMP3_AEB), .AGB(CMP3_AGB));
Comparator CMP2(.A(A[2]), .B(B[2]), .ALB(CMP2_ALB), .AEB(CMP2_AEB), .AGB(CMP2_AGB));
Comparator CMP1(.A(A[1]), .B(B[1]), .ALB(CMP1_ALB), .AEB(CMP1_AEB), .AGB(CMP1_AGB));
Comparator CMP0(.A(A[0]), .B(B[0]), .ALB(CMP0_ALB), .AEB(CMP0_AEB), .AGB(CMP0_AGB));

AND2 ALB_TMP0(.A(CMP3_AEB), .B(CMP2_ALB), .Out(ALB_Tmp0));
AND2 AGB_TMP0(.A(CMP3_AEB), .B(CMP2_AGB), .Out(AGB_Tmp0));

AND3 ALB_TMP1(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_ALB), .Out(ALB_Tmp1));
AND3 AGB_TMP1(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AGB), .Out(AGB_Tmp1));

AND4 ALB_TMP2(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AEB), .D(CMP0_ALB), .Out(ALB_Tmp2));
AND4 AGB_TMP2(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AEB), .D(CMP0_AGB), .Out(AGB_Tmp2));

AND4 AEB_TMP0(.A(CMP0_AEB), .B(CMP1_AEB), .C(CMP2_AEB), .D(CMP2_AEB), .Out(AEB_Tmp0));

AND2 ALB_TMP3(.A(AEB_Tmp0), .B(ALBI), .Out(ALB_Tmp3));
AND2 AGB_TMP3(.A(AEB_Tmp0), .B(AGBI), .Out(AGB_Tmp3));

OR5 ALBOUT(.A(CMP3_ALB), .B(ALB_Tmp0), .C(ALB_Tmp1), .D(ALB_Tmp2), .E(ALB_Tmp3), .Out(ALBO));
OR5 AGBOUT(.A(CMP3_AGB), .B(AGB_Tmp0), .C(AGB_Tmp1), .D(AGB_Tmp2), .E(AGB_Tmp3), .Out(AGBO));
AND2 AEBOUT(.A(AEBI), .B(AEB_Tmp0), .Out(AEBO));

endmodule

module Comparator_32bit(A, B, ALB, AEB, AGB);

input [31:0] A, B;
output ALB, AEB, AGB;

wire CMP0_ALB, CMP1_ALB, CMP2_ALB, CMP3_ALB, CMP4_ALB, CMP5_ALB, CMP6_ALB;
wire CMP0_AEB, CMP1_AEB, CMP2_AEB, CMP3_AEB, CMP4_AEB, CMP5_AEB, CMP6_AEB;
wire CMP0_AGB, CMP1_AGB, CMP2_AGB, CMP3_AGB, CMP4_AGB, CMP5_AGB, CMP6_AGB;

Comparator_4bit CMP0(.A(A[3:0]), .B(B[3:0]), .ALBI(1'b0), .AEBI(1'b1), .AGBI(1'b0), .ALBO(CMP0_ALB), .AEBO(CMP0_AEB), .AGBO(CMP0_AGB));
Comparator_4bit CMP1(.A(A[7:4]), .B(B[7:4]), .ALBI(CMP0_ALB), .AEBI(CMP0_AEB), .AGBI(CMP0_AGB), .ALBO(CMP1_ALB), .AEBO(CMP1_AEB), .AGBO(CMP1_AGB));
Comparator_4bit CMP2(.A(A[11:8]), .B(B[11:8]), .ALBI(CMP1_ALB), .AEBI(CMP1_AEB), .AGBI(CMP1_AGB), .ALBO(CMP2_ALB), .AEBO(CMP2_AEB), .AGBO(CMP2_AGB));
Comparator_4bit CMP3(.A(A[15:12]), .B(B[15:12]), .ALBI(CMP2_ALB), .AEBI(CMP2_AEB), .AGBI(CMP2_AGB), .ALBO(CMP3_ALB), .AEBO(CMP3_AEB), .AGBO(CMP3_AGB));
Comparator_4bit CMP4(.A(A[19:16]), .B(B[19:16]), .ALBI(CMP3_ALB), .AEBI(CMP3_AEB), .AGBI(CMP3_AGB), .ALBO(CMP4_ALB), .AEBO(CMP4_AEB), .AGBO(CMP4_AGB));
Comparator_4bit CMP5(.A(A[23:20]), .B(B[23:20]), .ALBI(CMP4_ALB), .AEBI(CMP4_AEB), .AGBI(CMP4_AGB), .ALBO(CMP5_ALB), .AEBO(CMP5_AEB), .AGBO(CMP5_AGB));
Comparator_4bit CMP6(.A(A[27:24]), .B(B[27:24]), .ALBI(CMP5_ALB), .AEBI(CMP5_AEB), .AGBI(CMP5_AGB), .ALBO(CMP6_ALB), .AEBO(CMP6_AEB), .AGBO(CMP6_AGB));
Comparator_4bit CMP7(.A(A[31:28]), .B(B[31:28]), .ALBI(CMP6_ALB), .AEBI(CMP6_AEB), .AGBI(CMP6_AGB), .ALBO(ALB), .AEBO(AEB), .AGBO(AGB));

endmodule

module SetOnLessThan(A, B, Out);

input [31:0] A, B;
output [31:0] Out;

wire tmp;

Comparator_32bit SLT(.A(A), .B(B), .ALB(tmp));

assign Out = {31'h00000000,tmp};

endmodule