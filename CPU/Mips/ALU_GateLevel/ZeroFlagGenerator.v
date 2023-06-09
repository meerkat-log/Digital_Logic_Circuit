module ZeroFlagGenerator(A, Out);

input [31:0] A;
output Out;

wire tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10, tmp11, tmp12, tmp13, tmp14, tmp15;
wire tmp_0, tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6, tmp_7;
wire tmp__0, tmp__1, tmp__2, tmp__3;
wire tmp___0, tmp___1;

OR2 ZF0(.A(A[0]), .B(A[1]), .Out(tmp0));
OR2 ZF1(.A(A[2]), .B(A[3]), .Out(tmp1));
OR2 ZF2(.A(A[4]), .B(A[5]), .Out(tmp2));
OR2 ZF3(.A(A[6]), .B(A[7]), .Out(tmp3));
OR2 ZF4(.A(A[8]), .B(A[9]), .Out(tmp4));
OR2 ZF5(.A(A[10]), .B(A[11]), .Out(tmp5));
OR2 ZF6(.A(A[12]), .B(A[13]), .Out(tmp6));
OR2 ZF7(.A(A[14]), .B(A[15]), .Out(tmp7));
OR2 ZF8(.A(A[16]), .B(A[17]), .Out(tmp8));
OR2 ZF9(.A(A[18]), .B(A[19]), .Out(tmp9));
OR2 ZF10(.A(A[20]), .B(A[21]), .Out(tmp10));
OR2 ZF11(.A(A[22]), .B(A[23]), .Out(tmp11));
OR2 ZF12(.A(A[24]), .B(A[25]), .Out(tmp12));
OR2 ZF13(.A(A[26]), .B(A[27]), .Out(tmp13));
OR2 ZF14(.A(A[28]), .B(A[29]), .Out(tmp14));
OR2 ZF15(.A(A[30]), .B(A[31]), .Out(tmp15));

OR2 ZF_0(.A(tmp0), .B(tmp1), .Out(tmp_0));
OR2 ZF_1(.A(tmp2), .B(tmp3), .Out(tmp_1));
OR2 ZF_2(.A(tmp4), .B(tmp5), .Out(tmp_2));
OR2 ZF_3(.A(tmp6), .B(tmp7), .Out(tmp_3));
OR2 ZF_4(.A(tmp8), .B(tmp9), .Out(tmp_4));
OR2 ZF_5(.A(tmp10), .B(tmp11), .Out(tmp_5));
OR2 ZF_6(.A(tmp12), .B(tmp13), .Out(tmp_6));
OR2 ZF_7(.A(tmp14), .B(tmp15), .Out(tmp_7));

OR2 ZF__0(.A(tmp_0), .B(tmp_1), .Out(tmp__0));
OR2 ZF__1(.A(tmp_2), .B(tmp_3), .Out(tmp__1));
OR2 ZF__2(.A(tmp_4), .B(tmp_5), .Out(tmp__2));
OR2 ZF__3(.A(tmp_6), .B(tmp_7), .Out(tmp__3));

OR2 ZF___0(.A(tmp__0), .B(tmp__1), .Out(tmp___0));
OR2 ZF___1(.A(tmp__2), .B(tmp__3), .Out(tmp___1));

NOR2 ZFOUT(.A(tmp___0), .B(tmp___1), .Out(Out));

endmodule