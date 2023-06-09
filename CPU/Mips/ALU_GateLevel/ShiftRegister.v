module D_FlipFlop(CLK, D, Q, Qbar);

input CLK, D;
output Q, Qbar;

wire CLKbar, Dbar, SMaster, RMaster, Y, Ybar, SSlave, RSlave;

NOT1 NOTCLK(.A(CLK), .Out(CLKbar));
NOT1 NOTD(.A(D), .Out(Dbar));

NAND2 SMOut(.A(D), .B(CLK), .Out(SMaster));
NAND2 RMOut(.A(Dbar), .B(CLK), .Out(RMaster));
NAND2 YOut(.A(SMaster), .B(Ybar), .Out(Y));
NAND2 YbarOut(.A(RMaster), .B(Y), .Out(Ybar));

NAND2 SSOut(.A(Y), .B(CLKbar), .Out(SSlave));
NAND2 RSOut(.A(Ybar), .B(CLKbar), .Out(RSlave));
NAND2 QOut(.A(SSlave), .B(Qbar), .Out(Q));
NAND2 QbarOut(.A(RSlave), .B(Q), .Out(Qbar));

endmodule

module ShiftRegister_32bit(CLK, Mode, In, Out);

input CLK;
input [1:0] Mode;
input [31:0] In;
output [31:0] Out;

wire dff0_in, dff1_in, dff2_in, dff3_in, dff4_in, dff5_in, dff6_in, dff7_in, dff8_in, dff9_in, dff10_in, dff11_in, dff12_in, dff13_in, dff14_in, dff15_in,
     dff16_in, dff17_in, dff18_in, dff19_in, dff20_in, dff21_in, dff22_in, dff23_in, dff24_in, dff25_in, dff26_in, dff27_in, dff28_in, dff29_in, dff30_in, dff31_in;

Mux4to1_1bit MUX0(.I0(Out[0]), .I1(Out[1]), .I2(1'b0), .I3(In[0]), .Sel(Mode), .Out(dff0_in));
D_FlipFlop DFF0(.CLK(CLK), .D(dff0_in), .Q(Out[0]));

Mux4to1_1bit MUX1(.I0(Out[1]), .I1(Out[2]), .I2(Out[0]), .I3(In[1]), .Sel(Mode), .Out(dff1_in));
D_FlipFlop DFF1(.CLK(CLK), .D(dff1_in), .Q(Out[1]));

Mux4to1_1bit MUX2(.I0(Out[2]), .I1(Out[3]), .I2(Out[1]), .I3(In[2]), .Sel(Mode), .Out(dff2_in));
D_FlipFlop DFF2(.CLK(CLK), .D(dff2_in), .Q(Out[2]));

Mux4to1_1bit MUX3(.I0(Out[3]), .I1(Out[4]), .I2(Out[2]), .I3(In[3]), .Sel(Mode), .Out(dff3_in));
D_FlipFlop DFF3(.CLK(CLK), .D(dff3_in), .Q(Out[3]));

Mux4to1_1bit MUX4(.I0(Out[4]), .I1(Out[5]), .I2(Out[3]), .I3(In[4]), .Sel(Mode), .Out(dff4_in));
D_FlipFlop DFF4(.CLK(CLK), .D(dff4_in), .Q(Out[4]));

Mux4to1_1bit MUX5(.I0(Out[5]), .I1(Out[6]), .I2(Out[4]), .I3(In[5]), .Sel(Mode), .Out(dff5_in));
D_FlipFlop DFF5(.CLK(CLK), .D(dff5_in), .Q(Out[5]));

Mux4to1_1bit MUX6(.I0(Out[6]), .I1(Out[7]), .I2(Out[5]), .I3(In[6]), .Sel(Mode), .Out(dff6_in));
D_FlipFlop DFF6(.CLK(CLK), .D(dff6_in), .Q(Out[6]));

Mux4to1_1bit MUX7(.I0(Out[7]), .I1(Out[8]), .I2(Out[6]), .I3(In[7]), .Sel(Mode), .Out(dff7_in));
D_FlipFlop DFF7(.CLK(CLK), .D(dff7_in), .Q(Out[7]));

Mux4to1_1bit MUX8(.I0(Out[8]), .I1(Out[9]), .I2(Out[7]), .I3(In[8]), .Sel(Mode), .Out(dff8_in));
D_FlipFlop DFF8(.CLK(CLK), .D(dff8_in), .Q(Out[8]));

Mux4to1_1bit MUX9(.I0(Out[9]), .I1(Out[10]), .I2(Out[8]), .I3(In[9]), .Sel(Mode), .Out(dff9_in));
D_FlipFlop DFF9(.CLK(CLK), .D(dff9_in), .Q(Out[9]));

Mux4to1_1bit MUX10(.I0(Out[10]), .I1(Out[11]), .I2(Out[9]), .I3(In[10]), .Sel(Mode), .Out(dff10_in));
D_FlipFlop DFF10(.CLK(CLK), .D(dff10_in), .Q(Out[10]));

Mux4to1_1bit MUX11(.I0(Out[11]), .I1(Out[12]), .I2(Out[10]), .I3(In[11]), .Sel(Mode), .Out(dff11_in));
D_FlipFlop DFF11(.CLK(CLK), .D(dff11_in), .Q(Out[11]));

Mux4to1_1bit MUX12(.I0(Out[12]), .I1(Out[13]), .I2(Out[11]), .I3(In[12]), .Sel(Mode), .Out(dff12_in));
D_FlipFlop DFF12(.CLK(CLK), .D(dff12_in), .Q(Out[12]));

Mux4to1_1bit MUX13(.I0(Out[13]), .I1(Out[14]), .I2(Out[12]), .I3(In[13]), .Sel(Mode), .Out(dff13_in));
D_FlipFlop DFF13(.CLK(CLK), .D(dff13_in), .Q(Out[13]));

Mux4to1_1bit MUX14(.I0(Out[14]), .I1(Out[15]), .I2(Out[13]), .I3(In[14]), .Sel(Mode), .Out(dff14_in));
D_FlipFlop DFF14(.CLK(CLK), .D(dff14_in), .Q(Out[14]));

Mux4to1_1bit MUX15(.I0(Out[15]), .I1(Out[16]), .I2(Out[14]), .I3(In[15]), .Sel(Mode), .Out(dff15_in));
D_FlipFlop DFF15(.CLK(CLK), .D(dff15_in), .Q(Out[15]));

Mux4to1_1bit MUX16(.I0(Out[16]), .I1(Out[17]), .I2(Out[15]), .I3(In[16]), .Sel(Mode), .Out(dff16_in));
D_FlipFlop DFF16(.CLK(CLK), .D(dff16_in), .Q(Out[16]));

Mux4to1_1bit MUX17(.I0(Out[17]), .I1(Out[18]), .I2(Out[16]), .I3(In[17]), .Sel(Mode), .Out(dff17_in));
D_FlipFlop DFF17(.CLK(CLK), .D(dff17_in), .Q(Out[17]));

Mux4to1_1bit MUX18(.I0(Out[18]), .I1(Out[19]), .I2(Out[17]), .I3(In[18]), .Sel(Mode), .Out(dff18_in));
D_FlipFlop DFF18(.CLK(CLK), .D(dff18_in), .Q(Out[18]));

Mux4to1_1bit MUX19(.I0(Out[19]), .I1(Out[20]), .I2(Out[18]), .I3(In[19]), .Sel(Mode), .Out(dff19_in));
D_FlipFlop DFF19(.CLK(CLK), .D(dff19_in), .Q(Out[19]));

Mux4to1_1bit MUX20(.I0(Out[20]), .I1(Out[21]), .I2(Out[19]), .I3(In[20]), .Sel(Mode), .Out(dff20_in));
D_FlipFlop DFF20(.CLK(CLK), .D(dff20_in), .Q(Out[20]));

Mux4to1_1bit MUX21(.I0(Out[21]), .I1(Out[22]), .I2(Out[20]), .I3(In[21]), .Sel(Mode), .Out(dff21_in));
D_FlipFlop DFF21(.CLK(CLK), .D(dff21_in), .Q(Out[21]));

Mux4to1_1bit MUX22(.I0(Out[22]), .I1(Out[23]), .I2(Out[21]), .I3(In[22]), .Sel(Mode), .Out(dff22_in));
D_FlipFlop DFF22(.CLK(CLK), .D(dff22_in), .Q(Out[22]));

Mux4to1_1bit MUX23(.I0(Out[23]), .I1(Out[24]), .I2(Out[22]), .I3(In[23]), .Sel(Mode), .Out(dff23_in));
D_FlipFlop DFF23(.CLK(CLK), .D(dff23_in), .Q(Out[23]));

Mux4to1_1bit MUX24(.I0(Out[24]), .I1(Out[25]), .I2(Out[23]), .I3(In[24]), .Sel(Mode), .Out(dff24_in));
D_FlipFlop DFF24(.CLK(CLK), .D(dff24_in), .Q(Out[24]));

Mux4to1_1bit MUX25(.I0(Out[25]), .I1(Out[26]), .I2(Out[24]), .I3(In[25]), .Sel(Mode), .Out(dff25_in));
D_FlipFlop DFF25(.CLK(CLK), .D(dff25_in), .Q(Out[25]));

Mux4to1_1bit MUX26(.I0(Out[26]), .I1(Out[27]), .I2(Out[25]), .I3(In[26]), .Sel(Mode), .Out(dff26_in));
D_FlipFlop DFF26(.CLK(CLK), .D(dff26_in), .Q(Out[26]));

Mux4to1_1bit MUX27(.I0(Out[27]), .I1(Out[28]), .I2(Out[26]), .I3(In[27]), .Sel(Mode), .Out(dff27_in));
D_FlipFlop DFF27(.CLK(CLK), .D(dff27_in), .Q(Out[27]));

Mux4to1_1bit MUX28(.I0(Out[28]), .I1(Out[29]), .I2(Out[27]), .I3(In[28]), .Sel(Mode), .Out(dff28_in));
D_FlipFlop DFF28(.CLK(CLK), .D(dff28_in), .Q(Out[28]));

Mux4to1_1bit MUX29(.I0(Out[29]), .I1(Out[30]), .I2(Out[28]), .I3(In[29]), .Sel(Mode), .Out(dff29_in));
D_FlipFlop DFF29(.CLK(CLK), .D(dff29_in), .Q(Out[29]));

Mux4to1_1bit MUX30(.I0(Out[30]), .I1(Out[31]), .I2(Out[29]), .I3(In[30]), .Sel(Mode), .Out(dff30_in));
D_FlipFlop DFF30(.CLK(CLK), .D(dff30_in), .Q(Out[30]));

Mux4to1_1bit MUX31(.I0(Out[31]), .I1(In[31]), .I2(Out[30]), .I3(In[31]), .Sel(Mode), .Out(dff31_in));
D_FlipFlop DFF31(.CLK(CLK), .D(dff31_in), .Q(Out[31]));

endmodule

module ShiftRegister_64bit(CLK, Mode, In, Out);

input CLK;
input [1:0] Mode;
input [63:0] In;
output [63:0] Out;

wire dff0_in, dff1_in, dff2_in, dff3_in, dff4_in, dff5_in, dff6_in, dff7_in, dff8_in, dff9_in, dff10_in, dff11_in, dff12_in, dff13_in, dff14_in, dff15_in,
     dff16_in, dff17_in, dff18_in, dff19_in, dff20_in, dff21_in, dff22_in, dff23_in, dff24_in, dff25_in, dff26_in, dff27_in, dff28_in, dff29_in, dff30_in, dff31_in,
     dff32_in, dff33_in, dff34_in, dff35_in, dff36_in, dff37_in, dff38_in, dff39_in, dff40_in, dff41_in, dff42_in, dff43_in, dff44_in, dff45_in, dff46_in, dff47_in,
     dff48_in, dff49_in, dff50_in, dff51_in, dff52_in, dff53_in, dff54_in, dff55_in, dff56_in, dff57_in, dff58_in, dff59_in, dff60_in, dff61_in, dff62_in, dff63_in;

Mux4to1_1bit MUX0(.I0(Out[0]), .I1(Out[1]), .I2(1'b0), .I3(In[0]), .Sel(Mode), .Out(dff0_in));
D_FlipFlop DFF0(.CLK(CLK), .D(dff0_in), .Q(Out[0]));

Mux4to1_1bit MUX1(.I0(Out[1]), .I1(Out[2]), .I2(Out[0]), .I3(In[1]), .Sel(Mode), .Out(dff1_in));
D_FlipFlop DFF1(.CLK(CLK), .D(dff1_in), .Q(Out[1]));

Mux4to1_1bit MUX2(.I0(Out[2]), .I1(Out[3]), .I2(Out[1]), .I3(In[2]), .Sel(Mode), .Out(dff2_in));
D_FlipFlop DFF2(.CLK(CLK), .D(dff2_in), .Q(Out[2]));

Mux4to1_1bit MUX3(.I0(Out[3]), .I1(Out[4]), .I2(Out[2]), .I3(In[3]), .Sel(Mode), .Out(dff3_in));
D_FlipFlop DFF3(.CLK(CLK), .D(dff3_in), .Q(Out[3]));

Mux4to1_1bit MUX4(.I0(Out[4]), .I1(Out[5]), .I2(Out[3]), .I3(In[4]), .Sel(Mode), .Out(dff4_in));
D_FlipFlop DFF4(.CLK(CLK), .D(dff4_in), .Q(Out[4]));

Mux4to1_1bit MUX5(.I0(Out[5]), .I1(Out[6]), .I2(Out[4]), .I3(In[5]), .Sel(Mode), .Out(dff5_in));
D_FlipFlop DFF5(.CLK(CLK), .D(dff5_in), .Q(Out[5]));

Mux4to1_1bit MUX6(.I0(Out[6]), .I1(Out[7]), .I2(Out[5]), .I3(In[6]), .Sel(Mode), .Out(dff6_in));
D_FlipFlop DFF6(.CLK(CLK), .D(dff6_in), .Q(Out[6]));

Mux4to1_1bit MUX7(.I0(Out[7]), .I1(Out[8]), .I2(Out[6]), .I3(In[7]), .Sel(Mode), .Out(dff7_in));
D_FlipFlop DFF7(.CLK(CLK), .D(dff7_in), .Q(Out[7]));

Mux4to1_1bit MUX8(.I0(Out[8]), .I1(Out[9]), .I2(Out[7]), .I3(In[8]), .Sel(Mode), .Out(dff8_in));
D_FlipFlop DFF8(.CLK(CLK), .D(dff8_in), .Q(Out[8]));

Mux4to1_1bit MUX9(.I0(Out[9]), .I1(Out[10]), .I2(Out[8]), .I3(In[9]), .Sel(Mode), .Out(dff9_in));
D_FlipFlop DFF9(.CLK(CLK), .D(dff9_in), .Q(Out[9]));

Mux4to1_1bit MUX10(.I0(Out[10]), .I1(Out[11]), .I2(Out[9]), .I3(In[10]), .Sel(Mode), .Out(dff10_in));
D_FlipFlop DFF10(.CLK(CLK), .D(dff10_in), .Q(Out[10]));

Mux4to1_1bit MUX11(.I0(Out[11]), .I1(Out[12]), .I2(Out[10]), .I3(In[11]), .Sel(Mode), .Out(dff11_in));
D_FlipFlop DFF11(.CLK(CLK), .D(dff11_in), .Q(Out[11]));

Mux4to1_1bit MUX12(.I0(Out[12]), .I1(Out[13]), .I2(Out[11]), .I3(In[12]), .Sel(Mode), .Out(dff12_in));
D_FlipFlop DFF12(.CLK(CLK), .D(dff12_in), .Q(Out[12]));

Mux4to1_1bit MUX13(.I0(Out[13]), .I1(Out[14]), .I2(Out[12]), .I3(In[13]), .Sel(Mode), .Out(dff13_in));
D_FlipFlop DFF13(.CLK(CLK), .D(dff13_in), .Q(Out[13]));

Mux4to1_1bit MUX14(.I0(Out[14]), .I1(Out[15]), .I2(Out[13]), .I3(In[14]), .Sel(Mode), .Out(dff14_in));
D_FlipFlop DFF14(.CLK(CLK), .D(dff14_in), .Q(Out[14]));

Mux4to1_1bit MUX15(.I0(Out[15]), .I1(Out[16]), .I2(Out[14]), .I3(In[15]), .Sel(Mode), .Out(dff15_in));
D_FlipFlop DFF15(.CLK(CLK), .D(dff15_in), .Q(Out[15]));

Mux4to1_1bit MUX16(.I0(Out[16]), .I1(Out[17]), .I2(Out[15]), .I3(In[16]), .Sel(Mode), .Out(dff16_in));
D_FlipFlop DFF16(.CLK(CLK), .D(dff16_in), .Q(Out[16]));

Mux4to1_1bit MUX17(.I0(Out[17]), .I1(Out[18]), .I2(Out[16]), .I3(In[17]), .Sel(Mode), .Out(dff17_in));
D_FlipFlop DFF17(.CLK(CLK), .D(dff17_in), .Q(Out[17]));

Mux4to1_1bit MUX18(.I0(Out[18]), .I1(Out[19]), .I2(Out[17]), .I3(In[18]), .Sel(Mode), .Out(dff18_in));
D_FlipFlop DFF18(.CLK(CLK), .D(dff18_in), .Q(Out[18]));

Mux4to1_1bit MUX19(.I0(Out[19]), .I1(Out[20]), .I2(Out[18]), .I3(In[19]), .Sel(Mode), .Out(dff19_in));
D_FlipFlop DFF19(.CLK(CLK), .D(dff19_in), .Q(Out[19]));

Mux4to1_1bit MUX20(.I0(Out[20]), .I1(Out[21]), .I2(Out[19]), .I3(In[20]), .Sel(Mode), .Out(dff20_in));
D_FlipFlop DFF20(.CLK(CLK), .D(dff20_in), .Q(Out[20]));

Mux4to1_1bit MUX21(.I0(Out[21]), .I1(Out[22]), .I2(Out[20]), .I3(In[21]), .Sel(Mode), .Out(dff21_in));
D_FlipFlop DFF21(.CLK(CLK), .D(dff21_in), .Q(Out[21]));

Mux4to1_1bit MUX22(.I0(Out[22]), .I1(Out[23]), .I2(Out[21]), .I3(In[22]), .Sel(Mode), .Out(dff22_in));
D_FlipFlop DFF22(.CLK(CLK), .D(dff22_in), .Q(Out[22]));

Mux4to1_1bit MUX23(.I0(Out[23]), .I1(Out[24]), .I2(Out[22]), .I3(In[23]), .Sel(Mode), .Out(dff23_in));
D_FlipFlop DFF23(.CLK(CLK), .D(dff23_in), .Q(Out[23]));

Mux4to1_1bit MUX24(.I0(Out[24]), .I1(Out[25]), .I2(Out[23]), .I3(In[24]), .Sel(Mode), .Out(dff24_in));
D_FlipFlop DFF24(.CLK(CLK), .D(dff24_in), .Q(Out[24]));

Mux4to1_1bit MUX25(.I0(Out[25]), .I1(Out[26]), .I2(Out[24]), .I3(In[25]), .Sel(Mode), .Out(dff25_in));
D_FlipFlop DFF25(.CLK(CLK), .D(dff25_in), .Q(Out[25]));

Mux4to1_1bit MUX26(.I0(Out[26]), .I1(Out[27]), .I2(Out[25]), .I3(In[26]), .Sel(Mode), .Out(dff26_in));
D_FlipFlop DFF26(.CLK(CLK), .D(dff26_in), .Q(Out[26]));

Mux4to1_1bit MUX27(.I0(Out[27]), .I1(Out[28]), .I2(Out[26]), .I3(In[27]), .Sel(Mode), .Out(dff27_in));
D_FlipFlop DFF27(.CLK(CLK), .D(dff27_in), .Q(Out[27]));

Mux4to1_1bit MUX28(.I0(Out[28]), .I1(Out[29]), .I2(Out[27]), .I3(In[28]), .Sel(Mode), .Out(dff28_in));
D_FlipFlop DFF28(.CLK(CLK), .D(dff28_in), .Q(Out[28]));

Mux4to1_1bit MUX29(.I0(Out[29]), .I1(Out[30]), .I2(Out[28]), .I3(In[29]), .Sel(Mode), .Out(dff29_in));
D_FlipFlop DFF29(.CLK(CLK), .D(dff29_in), .Q(Out[29]));

Mux4to1_1bit MUX30(.I0(Out[30]), .I1(Out[31]), .I2(Out[29]), .I3(In[30]), .Sel(Mode), .Out(dff30_in));
D_FlipFlop DFF30(.CLK(CLK), .D(dff30_in), .Q(Out[30]));

Mux4to1_1bit MUX31(.I0(Out[31]), .I1(Out[32]), .I2(Out[30]), .I3(In[31]), .Sel(Mode), .Out(dff31_in));
D_FlipFlop DFF31(.CLK(CLK), .D(dff31_in), .Q(Out[31]));

Mux4to1_1bit MUX32(.I0(Out[32]), .I1(Out[33]), .I2(Out[31]), .I3(In[32]), .Sel(Mode), .Out(dff32_in));
D_FlipFlop DFF32(.CLK(CLK), .D(dff32_in), .Q(Out[32]));

Mux4to1_1bit MUX33(.I0(Out[33]), .I1(Out[34]), .I2(Out[32]), .I3(In[33]), .Sel(Mode), .Out(dff33_in));
D_FlipFlop DFF33(.CLK(CLK), .D(dff33_in), .Q(Out[33]));

Mux4to1_1bit MUX34(.I0(Out[34]), .I1(Out[35]), .I2(Out[33]), .I3(In[34]), .Sel(Mode), .Out(dff34_in));
D_FlipFlop DFF34(.CLK(CLK), .D(dff34_in), .Q(Out[34]));

Mux4to1_1bit MUX35(.I0(Out[35]), .I1(Out[36]), .I2(Out[34]), .I3(In[35]), .Sel(Mode), .Out(dff35_in));
D_FlipFlop DFF35(.CLK(CLK), .D(dff35_in), .Q(Out[35]));

Mux4to1_1bit MUX36(.I0(Out[36]), .I1(Out[37]), .I2(Out[35]), .I3(In[36]), .Sel(Mode), .Out(dff36_in));
D_FlipFlop DFF36(.CLK(CLK), .D(dff36_in), .Q(Out[36]));

Mux4to1_1bit MUX37(.I0(Out[37]), .I1(Out[38]), .I2(Out[36]), .I3(In[37]), .Sel(Mode), .Out(dff37_in));
D_FlipFlop DFF37(.CLK(CLK), .D(dff37_in), .Q(Out[37]));

Mux4to1_1bit MUX38(.I0(Out[38]), .I1(Out[39]), .I2(Out[37]), .I3(In[38]), .Sel(Mode), .Out(dff38_in));
D_FlipFlop DFF38(.CLK(CLK), .D(dff38_in), .Q(Out[38]));

Mux4to1_1bit MUX39(.I0(Out[39]), .I1(Out[40]), .I2(Out[38]), .I3(In[39]), .Sel(Mode), .Out(dff39_in));
D_FlipFlop DFF39(.CLK(CLK), .D(dff39_in), .Q(Out[39]));

Mux4to1_1bit MUX40(.I0(Out[40]), .I1(Out[41]), .I2(Out[39]), .I3(In[40]), .Sel(Mode), .Out(dff40_in));
D_FlipFlop DFF40(.CLK(CLK), .D(dff40_in), .Q(Out[40]));

Mux4to1_1bit MUX41(.I0(Out[41]), .I1(Out[42]), .I2(Out[40]), .I3(In[41]), .Sel(Mode), .Out(dff41_in));
D_FlipFlop DFF41(.CLK(CLK), .D(dff41_in), .Q(Out[41]));

Mux4to1_1bit MUX42(.I0(Out[42]), .I1(Out[43]), .I2(Out[41]), .I3(In[42]), .Sel(Mode), .Out(dff42_in));
D_FlipFlop DFF42(.CLK(CLK), .D(dff42_in), .Q(Out[42]));

Mux4to1_1bit MUX43(.I0(Out[43]), .I1(Out[44]), .I2(Out[42]), .I3(In[43]), .Sel(Mode), .Out(dff43_in));
D_FlipFlop DFF43(.CLK(CLK), .D(dff43_in), .Q(Out[43]));

Mux4to1_1bit MUX44(.I0(Out[44]), .I1(Out[45]), .I2(Out[43]), .I3(In[44]), .Sel(Mode), .Out(dff44_in));
D_FlipFlop DFF44(.CLK(CLK), .D(dff44_in), .Q(Out[44]));

Mux4to1_1bit MUX45(.I0(Out[45]), .I1(Out[46]), .I2(Out[44]), .I3(In[45]), .Sel(Mode), .Out(dff45_in));
D_FlipFlop DFF45(.CLK(CLK), .D(dff45_in), .Q(Out[45]));

Mux4to1_1bit MUX46(.I0(Out[46]), .I1(Out[47]), .I2(Out[45]), .I3(In[46]), .Sel(Mode), .Out(dff46_in));
D_FlipFlop DFF46(.CLK(CLK), .D(dff46_in), .Q(Out[46]));

Mux4to1_1bit MUX47(.I0(Out[47]), .I1(Out[48]), .I2(Out[46]), .I3(In[47]), .Sel(Mode), .Out(dff47_in));
D_FlipFlop DFF47(.CLK(CLK), .D(dff47_in), .Q(Out[47]));

Mux4to1_1bit MUX48(.I0(Out[48]), .I1(Out[49]), .I2(Out[47]), .I3(In[48]), .Sel(Mode), .Out(dff48_in));
D_FlipFlop DFF48(.CLK(CLK), .D(dff48_in), .Q(Out[48]));

Mux4to1_1bit MUX49(.I0(Out[49]), .I1(Out[50]), .I2(Out[48]), .I3(In[49]), .Sel(Mode), .Out(dff49_in));
D_FlipFlop DFF49(.CLK(CLK), .D(dff49_in), .Q(Out[49]));

Mux4to1_1bit MUX50(.I0(Out[50]), .I1(Out[51]), .I2(Out[49]), .I3(In[50]), .Sel(Mode), .Out(dff50_in));
D_FlipFlop DFF50(.CLK(CLK), .D(dff50_in), .Q(Out[50]));

Mux4to1_1bit MUX51(.I0(Out[51]), .I1(Out[52]), .I2(Out[50]), .I3(In[51]), .Sel(Mode), .Out(dff51_in));
D_FlipFlop DFF51(.CLK(CLK), .D(dff51_in), .Q(Out[51]));

Mux4to1_1bit MUX52(.I0(Out[52]), .I1(Out[53]), .I2(Out[51]), .I3(In[52]), .Sel(Mode), .Out(dff52_in));
D_FlipFlop DFF52(.CLK(CLK), .D(dff52_in), .Q(Out[52]));

Mux4to1_1bit MUX53(.I0(Out[53]), .I1(Out[54]), .I2(Out[52]), .I3(In[53]), .Sel(Mode), .Out(dff53_in));
D_FlipFlop DFF53(.CLK(CLK), .D(dff53_in), .Q(Out[53]));

Mux4to1_1bit MUX54(.I0(Out[54]), .I1(Out[55]), .I2(Out[53]), .I3(In[54]), .Sel(Mode), .Out(dff54_in));
D_FlipFlop DFF54(.CLK(CLK), .D(dff54_in), .Q(Out[54]));

Mux4to1_1bit MUX55(.I0(Out[55]), .I1(Out[56]), .I2(Out[54]), .I3(In[55]), .Sel(Mode), .Out(dff55_in));
D_FlipFlop DFF55(.CLK(CLK), .D(dff55_in), .Q(Out[55]));

Mux4to1_1bit MUX56(.I0(Out[56]), .I1(Out[57]), .I2(Out[55]), .I3(In[56]), .Sel(Mode), .Out(dff56_in));
D_FlipFlop DFF56(.CLK(CLK), .D(dff56_in), .Q(Out[56]));

Mux4to1_1bit MUX57(.I0(Out[57]), .I1(Out[58]), .I2(Out[56]), .I3(In[57]), .Sel(Mode), .Out(dff57_in));
D_FlipFlop DFF57(.CLK(CLK), .D(dff57_in), .Q(Out[57]));

Mux4to1_1bit MUX58(.I0(Out[58]), .I1(Out[59]), .I2(Out[57]), .I3(In[58]), .Sel(Mode), .Out(dff58_in));
D_FlipFlop DFF58(.CLK(CLK), .D(dff58_in), .Q(Out[58]));

Mux4to1_1bit MUX59(.I0(Out[59]), .I1(Out[60]), .I2(Out[58]), .I3(In[59]), .Sel(Mode), .Out(dff59_in));
D_FlipFlop DFF59(.CLK(CLK), .D(dff59_in), .Q(Out[59]));

Mux4to1_1bit MUX60(.I0(Out[60]), .I1(Out[61]), .I2(Out[59]), .I3(In[60]), .Sel(Mode), .Out(dff60_in));
D_FlipFlop DFF60(.CLK(CLK), .D(dff60_in), .Q(Out[60]));

Mux4to1_1bit MUX61(.I0(Out[61]), .I1(Out[62]), .I2(Out[60]), .I3(In[61]), .Sel(Mode), .Out(dff61_in));
D_FlipFlop DFF61(.CLK(CLK), .D(dff61_in), .Q(Out[61]));

Mux4to1_1bit MUX62(.I0(Out[62]), .I1(Out[63]), .I2(Out[61]), .I3(In[62]), .Sel(Mode), .Out(dff62_in));
D_FlipFlop DFF62(.CLK(CLK), .D(dff62_in), .Q(Out[62]));

Mux4to1_1bit MUX63(.I0(Out[63]), .I1(In[63]), .I2(Out[62]), .I3(In[63]), .Sel(Mode), .Out(dff63_in));
D_FlipFlop DFF63(.CLK(CLK), .D(dff63_in), .Q(Out[63]));

endmodule
