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

Comparator_1bit CMP0(.A(A[0]), .B(B[0]), .ALB(CMP0_ALB), .AEB(CMP0_AEB), .AGB(CMP0_AGB));
Comparator_1bit CMP1(.A(A[1]), .B(B[1]), .ALB(CMP1_ALB), .AEB(CMP1_AEB), .AGB(CMP1_AGB));
Comparator_1bit CMP2(.A(A[2]), .B(B[2]), .ALB(CMP2_ALB), .AEB(CMP2_AEB), .AGB(CMP2_AGB));
Comparator_1bit CMP3(.A(A[3]), .B(B[3]), .ALB(CMP3_ALB), .AEB(CMP3_AEB), .AGB(CMP3_AGB));

AND2_1bit ALB_TMP0(.A(CMP3_AEB), .B(CMP2_ALB), .Out(ALB_Tmp0));
AND2_1bit AGB_TMP0(.A(CMP3_AEB), .B(CMP2_AGB), .Out(AGB_Tmp0));

AND3_1bit ALB_TMP1(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_ALB), .Out(ALB_Tmp1));
AND3_1bit AGB_TMP1(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AGB), .Out(AGB_Tmp1));

AND4_1bit ALB_TMP2(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AEB), .D(CMP0_ALB), .Out(ALB_Tmp2));
AND4_1bit AGB_TMP2(.A(CMP3_AEB), .B(CMP2_AEB), .C(CMP1_AEB), .D(CMP0_AGB), .Out(AGB_Tmp2));

AND4_1bit AEB_TMP0(.A(CMP0_AEB), .B(CMP1_AEB), .C(CMP2_AEB), .D(CMP2_AEB), .Out(AEB_Tmp0));

AND2_1bit ALB_TMP3(.A(AEB_Tmp0), .B(ALBI), .Out(ALB_Tmp3));
AND2_1bit AGB_TMP3(.A(AEB_Tmp0), .B(AGBI), .Out(AGB_Tmp3));

OR5_1bit ALBOUT(.A(CMP3_ALB), .B(ALB_Tmp0), .C(ALB_Tmp1), .D(ALB_Tmp2), .E(ALB_Tmp3), .Out(ALBO));
OR5_1bit AGBOUT(.A(CMP3_AGB), .B(AGB_Tmp0), .C(AGB_Tmp1), .D(AGB_Tmp2), .E(AGB_Tmp3), .Out(AGBO));
AND2_1bit AEBOUT(.A(AEBI), .B(AEB_Tmp0), .Out(AEBO));

endmodule
