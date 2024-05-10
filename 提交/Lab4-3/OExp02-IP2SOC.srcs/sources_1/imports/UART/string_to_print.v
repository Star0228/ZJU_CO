module string_to_print #(parameter str_idx_end=516) (
    input [11:0] str_idx,
    output [7:0] data,
    input [31:0] pc,
    input [31:0] inst,
    input [31:0] x0,
    input [31:0] ra,
    input [31:0] sp,
    input [31:0] gp,
    input [31:0] tp,
    input [31:0] t0,
    input [31:0] t1,
    input [31:0] t2,
    input [31:0] s0,
    input [31:0] s1,
    input [31:0] a0,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] a4,
    input [31:0] a5,
    input [31:0] a6,
    input [31:0] a7,
    input [31:0] s2,
    input [31:0] s3,
    input [31:0] s4,
    input [31:0] s5,
    input [31:0] s6,
    input [31:0] s7,
    input [31:0] s8,
    input [31:0] s9,
    input [31:0] s10,
    input [31:0] s11,
    input [31:0] t3,
    input [31:0] t4,
    input [31:0] t5,
    input [31:0] t6
  );

  wire[7:0] str_print[str_idx_end-1:0];
  assign data = str_print[str_idx];

  // Value for constant part
  assign str_print[0] = 8'h09; //
  assign str_print[1] = 8'h09; //
  assign str_print[2] = 8'h20; //
  assign str_print[3] = 8'h20; //
  assign str_print[4] = 8'h43; //C
  assign str_print[5] = 8'h6F; //o
  assign str_print[6] = 8'h6D; //m
  assign str_print[7] = 8'h70; //p
  assign str_print[8] = 8'h75; //u
  assign str_print[9] = 8'h74; //t
  assign str_print[10] = 8'h65; //e
  assign str_print[11] = 8'h72; //r
  assign str_print[12] = 8'h20; //
  assign str_print[13] = 8'h4F; //O
  assign str_print[14] = 8'h72; //r
  assign str_print[15] = 8'h67; //g
  assign str_print[16] = 8'h61; //a
  assign str_print[17] = 8'h6E; //n
  assign str_print[18] = 8'h69; //i
  assign str_print[19] = 8'h7A; //z
  assign str_print[20] = 8'h61; //a
  assign str_print[21] = 8'h74; //t
  assign str_print[22] = 8'h69; //i
  assign str_print[23] = 8'h6F; //o
  assign str_print[24] = 8'h6E; //n
  assign str_print[25] = 8'h20; //
  assign str_print[26] = 8'h4C; //L
  assign str_print[27] = 8'h61; //a
  assign str_print[28] = 8'h62; //b
  assign str_print[29] = 8'h20; //
  assign str_print[30] = 8'h32; //2
  assign str_print[31] = 8'h34; //4
  assign str_print[32] = 8'h20; //
  assign str_print[33] = 8'h53; //S
  assign str_print[34] = 8'h70; //p
  assign str_print[35] = 8'h72; //r
  assign str_print[36] = 8'h69; //i
  assign str_print[37] = 8'h6E; //n
  assign str_print[38] = 8'h67; //g
  assign str_print[39] = 8'h0A; //

  assign str_print[40] = 8'h0D; //

  assign str_print[41] = 8'h0A; //

  assign str_print[42] = 8'h0D; //

  assign str_print[43] = 8'h50; //P
  assign str_print[44] = 8'h43; //C
  assign str_print[45] = 8'h3A; //:
  assign str_print[46] = 8'h20; //
  assign str_print[55] = 8'h09; //
  assign str_print[56] = 8'h69; //i
  assign str_print[57] = 8'h6E; //n
  assign str_print[58] = 8'h73; //s
  assign str_print[59] = 8'h74; //t
  assign str_print[60] = 8'h3A; //:
  assign str_print[61] = 8'h20; //
  assign str_print[70] = 8'h0A; //

  assign str_print[71] = 8'h0D; //

  assign str_print[72] = 8'h0A; //

  assign str_print[73] = 8'h0D; //

  assign str_print[74] = 8'h78; //x
  assign str_print[75] = 8'h30; //0
  assign str_print[76] = 8'h3A; //:
  assign str_print[77] = 8'h20; //
  assign str_print[86] = 8'h09; //
  assign str_print[87] = 8'h72; //r
  assign str_print[88] = 8'h61; //a
  assign str_print[89] = 8'h3A; //:
  assign str_print[90] = 8'h20; //
  assign str_print[99] = 8'h09; //
  assign str_print[100] = 8'h73; //s
  assign str_print[101] = 8'h70; //p
  assign str_print[102] = 8'h3A; //:
  assign str_print[103] = 8'h20; //
  assign str_print[112] = 8'h09; //
  assign str_print[113] = 8'h67; //g
  assign str_print[114] = 8'h70; //p
  assign str_print[115] = 8'h3A; //:
  assign str_print[116] = 8'h20; //
  assign str_print[125] = 8'h09; //
  assign str_print[126] = 8'h74; //t
  assign str_print[127] = 8'h70; //p
  assign str_print[128] = 8'h3A; //:
  assign str_print[129] = 8'h20; //
  assign str_print[138] = 8'h0A; //

  assign str_print[139] = 8'h0D; //

  assign str_print[140] = 8'h74; //t
  assign str_print[141] = 8'h30; //0
  assign str_print[142] = 8'h3A; //:
  assign str_print[143] = 8'h20; //
  assign str_print[152] = 8'h09; //
  assign str_print[153] = 8'h74; //t
  assign str_print[154] = 8'h31; //1
  assign str_print[155] = 8'h3A; //:
  assign str_print[156] = 8'h20; //
  assign str_print[165] = 8'h09; //
  assign str_print[166] = 8'h74; //t
  assign str_print[167] = 8'h32; //2
  assign str_print[168] = 8'h3A; //:
  assign str_print[169] = 8'h20; //
  assign str_print[178] = 8'h09; //
  assign str_print[179] = 8'h73; //s
  assign str_print[180] = 8'h30; //0
  assign str_print[181] = 8'h3A; //:
  assign str_print[182] = 8'h20; //
  assign str_print[191] = 8'h09; //
  assign str_print[192] = 8'h73; //s
  assign str_print[193] = 8'h31; //1
  assign str_print[194] = 8'h3A; //:
  assign str_print[195] = 8'h20; //
  assign str_print[204] = 8'h0A; //

  assign str_print[205] = 8'h0D; //

  assign str_print[206] = 8'h61; //a
  assign str_print[207] = 8'h30; //0
  assign str_print[208] = 8'h3A; //:
  assign str_print[209] = 8'h20; //
  assign str_print[218] = 8'h09; //
  assign str_print[219] = 8'h61; //a
  assign str_print[220] = 8'h31; //1
  assign str_print[221] = 8'h3A; //:
  assign str_print[222] = 8'h20; //
  assign str_print[231] = 8'h09; //
  assign str_print[232] = 8'h61; //a
  assign str_print[233] = 8'h32; //2
  assign str_print[234] = 8'h3A; //:
  assign str_print[235] = 8'h20; //
  assign str_print[244] = 8'h09; //
  assign str_print[245] = 8'h61; //a
  assign str_print[246] = 8'h33; //3
  assign str_print[247] = 8'h3A; //:
  assign str_print[248] = 8'h20; //
  assign str_print[257] = 8'h09; //
  assign str_print[258] = 8'h61; //a
  assign str_print[259] = 8'h34; //4
  assign str_print[260] = 8'h3A; //:
  assign str_print[261] = 8'h20; //
  assign str_print[270] = 8'h0A; //

  assign str_print[271] = 8'h0D; //

  assign str_print[272] = 8'h61; //a
  assign str_print[273] = 8'h35; //5
  assign str_print[274] = 8'h3A; //:
  assign str_print[275] = 8'h20; //
  assign str_print[284] = 8'h09; //
  assign str_print[285] = 8'h61; //a
  assign str_print[286] = 8'h36; //6
  assign str_print[287] = 8'h3A; //:
  assign str_print[288] = 8'h20; //
  assign str_print[297] = 8'h09; //
  assign str_print[298] = 8'h61; //a
  assign str_print[299] = 8'h37; //7
  assign str_print[300] = 8'h3A; //:
  assign str_print[301] = 8'h20; //
  assign str_print[310] = 8'h09; //
  assign str_print[311] = 8'h73; //s
  assign str_print[312] = 8'h32; //2
  assign str_print[313] = 8'h3A; //:
  assign str_print[314] = 8'h20; //
  assign str_print[323] = 8'h09; //
  assign str_print[324] = 8'h73; //s
  assign str_print[325] = 8'h33; //3
  assign str_print[326] = 8'h3A; //:
  assign str_print[327] = 8'h20; //
  assign str_print[336] = 8'h0A; //

  assign str_print[337] = 8'h0D; //

  assign str_print[338] = 8'h73; //s
  assign str_print[339] = 8'h34; //4
  assign str_print[340] = 8'h3A; //:
  assign str_print[341] = 8'h20; //
  assign str_print[350] = 8'h09; //
  assign str_print[351] = 8'h73; //s
  assign str_print[352] = 8'h35; //5
  assign str_print[353] = 8'h3A; //:
  assign str_print[354] = 8'h20; //
  assign str_print[363] = 8'h09; //
  assign str_print[364] = 8'h73; //s
  assign str_print[365] = 8'h36; //6
  assign str_print[366] = 8'h3A; //:
  assign str_print[367] = 8'h20; //
  assign str_print[376] = 8'h09; //
  assign str_print[377] = 8'h73; //s
  assign str_print[378] = 8'h37; //7
  assign str_print[379] = 8'h3A; //:
  assign str_print[380] = 8'h20; //
  assign str_print[389] = 8'h09; //
  assign str_print[390] = 8'h73; //s
  assign str_print[391] = 8'h38; //8
  assign str_print[392] = 8'h3A; //:
  assign str_print[393] = 8'h20; //
  assign str_print[402] = 8'h0A; //

  assign str_print[403] = 8'h0D; //

  assign str_print[404] = 8'h73; //s
  assign str_print[405] = 8'h39; //9
  assign str_print[406] = 8'h3A; //:
  assign str_print[407] = 8'h20; //
  assign str_print[416] = 8'h09; //
  assign str_print[417] = 8'h73; //s
  assign str_print[418] = 8'h31; //1
  assign str_print[419] = 8'h30; //0
  assign str_print[420] = 8'h3A; //:
  assign str_print[429] = 8'h09; //
  assign str_print[430] = 8'h73; //s
  assign str_print[431] = 8'h31; //1
  assign str_print[432] = 8'h31; //1
  assign str_print[433] = 8'h3A; //:
  assign str_print[442] = 8'h09; //
  assign str_print[443] = 8'h74; //t
  assign str_print[444] = 8'h33; //3
  assign str_print[445] = 8'h3A; //:
  assign str_print[446] = 8'h20; //
  assign str_print[455] = 8'h09; //
  assign str_print[456] = 8'h74; //t
  assign str_print[457] = 8'h34; //4
  assign str_print[458] = 8'h3A; //:
  assign str_print[459] = 8'h20; //
  assign str_print[468] = 8'h0A; //

  assign str_print[469] = 8'h0D; //

  assign str_print[470] = 8'h74; //t
  assign str_print[471] = 8'h35; //5
  assign str_print[472] = 8'h3A; //:
  assign str_print[473] = 8'h20; //
  assign str_print[482] = 8'h09; //
  assign str_print[483] = 8'h74; //t
  assign str_print[484] = 8'h36; //6
  assign str_print[485] = 8'h3A; //:
  assign str_print[486] = 8'h20; //
  assign str_print[495] = 8'h0D; //

  assign str_print[496] = 8'h08; //
  assign str_print[497] = 8'h0D; //

  assign str_print[498] = 8'h08; //
  assign str_print[499] = 8'h0D; //

  assign str_print[500] = 8'h08; //
  assign str_print[501] = 8'h0D; //

  assign str_print[502] = 8'h08; //
  assign str_print[503] = 8'h0D; //

  assign str_print[504] = 8'h08; //
  assign str_print[505] = 8'h0D; //

  assign str_print[506] = 8'h08; //
  assign str_print[507] = 8'h0D; //

  assign str_print[508] = 8'h08; //
  assign str_print[509] = 8'h0D; //

  assign str_print[510] = 8'h08; //
  assign str_print[511] = 8'h0D; //

  assign str_print[512] = 8'h08; //
  assign str_print[513] = 8'h0D; //

  assign str_print[514] = 8'h08; //
  assign str_print[515] = 8'h0D; //



  // Instance for hex2ascii
  hex_to_ascii inst_pc_7(.hex(pc[31:28]), .ascii(str_print[47]));
  hex_to_ascii inst_pc_6(.hex(pc[27:24]), .ascii(str_print[48]));
  hex_to_ascii inst_pc_5(.hex(pc[23:20]), .ascii(str_print[49]));
  hex_to_ascii inst_pc_4(.hex(pc[19:16]), .ascii(str_print[50]));
  hex_to_ascii inst_pc_3(.hex(pc[15:12]), .ascii(str_print[51]));
  hex_to_ascii inst_pc_2(.hex(pc[11:8]), .ascii(str_print[52]));
  hex_to_ascii inst_pc_1(.hex(pc[7:4]), .ascii(str_print[53]));
  hex_to_ascii inst_pc_0(.hex(pc[3:0]), .ascii(str_print[54]));
  hex_to_ascii inst_inst_7(.hex(inst[31:28]), .ascii(str_print[62]));
  hex_to_ascii inst_inst_6(.hex(inst[27:24]), .ascii(str_print[63]));
  hex_to_ascii inst_inst_5(.hex(inst[23:20]), .ascii(str_print[64]));
  hex_to_ascii inst_inst_4(.hex(inst[19:16]), .ascii(str_print[65]));
  hex_to_ascii inst_inst_3(.hex(inst[15:12]), .ascii(str_print[66]));
  hex_to_ascii inst_inst_2(.hex(inst[11:8]), .ascii(str_print[67]));
  hex_to_ascii inst_inst_1(.hex(inst[7:4]), .ascii(str_print[68]));
  hex_to_ascii inst_inst_0(.hex(inst[3:0]), .ascii(str_print[69]));
  hex_to_ascii inst_x0_7(.hex(x0[31:28]), .ascii(str_print[78]));
  hex_to_ascii inst_x0_6(.hex(x0[27:24]), .ascii(str_print[79]));
  hex_to_ascii inst_x0_5(.hex(x0[23:20]), .ascii(str_print[80]));
  hex_to_ascii inst_x0_4(.hex(x0[19:16]), .ascii(str_print[81]));
  hex_to_ascii inst_x0_3(.hex(x0[15:12]), .ascii(str_print[82]));
  hex_to_ascii inst_x0_2(.hex(x0[11:8]), .ascii(str_print[83]));
  hex_to_ascii inst_x0_1(.hex(x0[7:4]), .ascii(str_print[84]));
  hex_to_ascii inst_x0_0(.hex(x0[3:0]), .ascii(str_print[85]));
  hex_to_ascii inst_ra_7(.hex(ra[31:28]), .ascii(str_print[91]));
  hex_to_ascii inst_ra_6(.hex(ra[27:24]), .ascii(str_print[92]));
  hex_to_ascii inst_ra_5(.hex(ra[23:20]), .ascii(str_print[93]));
  hex_to_ascii inst_ra_4(.hex(ra[19:16]), .ascii(str_print[94]));
  hex_to_ascii inst_ra_3(.hex(ra[15:12]), .ascii(str_print[95]));
  hex_to_ascii inst_ra_2(.hex(ra[11:8]), .ascii(str_print[96]));
  hex_to_ascii inst_ra_1(.hex(ra[7:4]), .ascii(str_print[97]));
  hex_to_ascii inst_ra_0(.hex(ra[3:0]), .ascii(str_print[98]));
  hex_to_ascii inst_sp_7(.hex(sp[31:28]), .ascii(str_print[104]));
  hex_to_ascii inst_sp_6(.hex(sp[27:24]), .ascii(str_print[105]));
  hex_to_ascii inst_sp_5(.hex(sp[23:20]), .ascii(str_print[106]));
  hex_to_ascii inst_sp_4(.hex(sp[19:16]), .ascii(str_print[107]));
  hex_to_ascii inst_sp_3(.hex(sp[15:12]), .ascii(str_print[108]));
  hex_to_ascii inst_sp_2(.hex(sp[11:8]), .ascii(str_print[109]));
  hex_to_ascii inst_sp_1(.hex(sp[7:4]), .ascii(str_print[110]));
  hex_to_ascii inst_sp_0(.hex(sp[3:0]), .ascii(str_print[111]));
  hex_to_ascii inst_gp_7(.hex(gp[31:28]), .ascii(str_print[117]));
  hex_to_ascii inst_gp_6(.hex(gp[27:24]), .ascii(str_print[118]));
  hex_to_ascii inst_gp_5(.hex(gp[23:20]), .ascii(str_print[119]));
  hex_to_ascii inst_gp_4(.hex(gp[19:16]), .ascii(str_print[120]));
  hex_to_ascii inst_gp_3(.hex(gp[15:12]), .ascii(str_print[121]));
  hex_to_ascii inst_gp_2(.hex(gp[11:8]), .ascii(str_print[122]));
  hex_to_ascii inst_gp_1(.hex(gp[7:4]), .ascii(str_print[123]));
  hex_to_ascii inst_gp_0(.hex(gp[3:0]), .ascii(str_print[124]));
  hex_to_ascii inst_tp_7(.hex(tp[31:28]), .ascii(str_print[130]));
  hex_to_ascii inst_tp_6(.hex(tp[27:24]), .ascii(str_print[131]));
  hex_to_ascii inst_tp_5(.hex(tp[23:20]), .ascii(str_print[132]));
  hex_to_ascii inst_tp_4(.hex(tp[19:16]), .ascii(str_print[133]));
  hex_to_ascii inst_tp_3(.hex(tp[15:12]), .ascii(str_print[134]));
  hex_to_ascii inst_tp_2(.hex(tp[11:8]), .ascii(str_print[135]));
  hex_to_ascii inst_tp_1(.hex(tp[7:4]), .ascii(str_print[136]));
  hex_to_ascii inst_tp_0(.hex(tp[3:0]), .ascii(str_print[137]));
  hex_to_ascii inst_t0_7(.hex(t0[31:28]), .ascii(str_print[144]));
  hex_to_ascii inst_t0_6(.hex(t0[27:24]), .ascii(str_print[145]));
  hex_to_ascii inst_t0_5(.hex(t0[23:20]), .ascii(str_print[146]));
  hex_to_ascii inst_t0_4(.hex(t0[19:16]), .ascii(str_print[147]));
  hex_to_ascii inst_t0_3(.hex(t0[15:12]), .ascii(str_print[148]));
  hex_to_ascii inst_t0_2(.hex(t0[11:8]), .ascii(str_print[149]));
  hex_to_ascii inst_t0_1(.hex(t0[7:4]), .ascii(str_print[150]));
  hex_to_ascii inst_t0_0(.hex(t0[3:0]), .ascii(str_print[151]));
  hex_to_ascii inst_t1_7(.hex(t1[31:28]), .ascii(str_print[157]));
  hex_to_ascii inst_t1_6(.hex(t1[27:24]), .ascii(str_print[158]));
  hex_to_ascii inst_t1_5(.hex(t1[23:20]), .ascii(str_print[159]));
  hex_to_ascii inst_t1_4(.hex(t1[19:16]), .ascii(str_print[160]));
  hex_to_ascii inst_t1_3(.hex(t1[15:12]), .ascii(str_print[161]));
  hex_to_ascii inst_t1_2(.hex(t1[11:8]), .ascii(str_print[162]));
  hex_to_ascii inst_t1_1(.hex(t1[7:4]), .ascii(str_print[163]));
  hex_to_ascii inst_t1_0(.hex(t1[3:0]), .ascii(str_print[164]));
  hex_to_ascii inst_t2_7(.hex(t2[31:28]), .ascii(str_print[170]));
  hex_to_ascii inst_t2_6(.hex(t2[27:24]), .ascii(str_print[171]));
  hex_to_ascii inst_t2_5(.hex(t2[23:20]), .ascii(str_print[172]));
  hex_to_ascii inst_t2_4(.hex(t2[19:16]), .ascii(str_print[173]));
  hex_to_ascii inst_t2_3(.hex(t2[15:12]), .ascii(str_print[174]));
  hex_to_ascii inst_t2_2(.hex(t2[11:8]), .ascii(str_print[175]));
  hex_to_ascii inst_t2_1(.hex(t2[7:4]), .ascii(str_print[176]));
  hex_to_ascii inst_t2_0(.hex(t2[3:0]), .ascii(str_print[177]));
  hex_to_ascii inst_s0_7(.hex(s0[31:28]), .ascii(str_print[183]));
  hex_to_ascii inst_s0_6(.hex(s0[27:24]), .ascii(str_print[184]));
  hex_to_ascii inst_s0_5(.hex(s0[23:20]), .ascii(str_print[185]));
  hex_to_ascii inst_s0_4(.hex(s0[19:16]), .ascii(str_print[186]));
  hex_to_ascii inst_s0_3(.hex(s0[15:12]), .ascii(str_print[187]));
  hex_to_ascii inst_s0_2(.hex(s0[11:8]), .ascii(str_print[188]));
  hex_to_ascii inst_s0_1(.hex(s0[7:4]), .ascii(str_print[189]));
  hex_to_ascii inst_s0_0(.hex(s0[3:0]), .ascii(str_print[190]));
  hex_to_ascii inst_s1_7(.hex(s1[31:28]), .ascii(str_print[196]));
  hex_to_ascii inst_s1_6(.hex(s1[27:24]), .ascii(str_print[197]));
  hex_to_ascii inst_s1_5(.hex(s1[23:20]), .ascii(str_print[198]));
  hex_to_ascii inst_s1_4(.hex(s1[19:16]), .ascii(str_print[199]));
  hex_to_ascii inst_s1_3(.hex(s1[15:12]), .ascii(str_print[200]));
  hex_to_ascii inst_s1_2(.hex(s1[11:8]), .ascii(str_print[201]));
  hex_to_ascii inst_s1_1(.hex(s1[7:4]), .ascii(str_print[202]));
  hex_to_ascii inst_s1_0(.hex(s1[3:0]), .ascii(str_print[203]));
  hex_to_ascii inst_a0_7(.hex(a0[31:28]), .ascii(str_print[210]));
  hex_to_ascii inst_a0_6(.hex(a0[27:24]), .ascii(str_print[211]));
  hex_to_ascii inst_a0_5(.hex(a0[23:20]), .ascii(str_print[212]));
  hex_to_ascii inst_a0_4(.hex(a0[19:16]), .ascii(str_print[213]));
  hex_to_ascii inst_a0_3(.hex(a0[15:12]), .ascii(str_print[214]));
  hex_to_ascii inst_a0_2(.hex(a0[11:8]), .ascii(str_print[215]));
  hex_to_ascii inst_a0_1(.hex(a0[7:4]), .ascii(str_print[216]));
  hex_to_ascii inst_a0_0(.hex(a0[3:0]), .ascii(str_print[217]));
  hex_to_ascii inst_a1_7(.hex(a1[31:28]), .ascii(str_print[223]));
  hex_to_ascii inst_a1_6(.hex(a1[27:24]), .ascii(str_print[224]));
  hex_to_ascii inst_a1_5(.hex(a1[23:20]), .ascii(str_print[225]));
  hex_to_ascii inst_a1_4(.hex(a1[19:16]), .ascii(str_print[226]));
  hex_to_ascii inst_a1_3(.hex(a1[15:12]), .ascii(str_print[227]));
  hex_to_ascii inst_a1_2(.hex(a1[11:8]), .ascii(str_print[228]));
  hex_to_ascii inst_a1_1(.hex(a1[7:4]), .ascii(str_print[229]));
  hex_to_ascii inst_a1_0(.hex(a1[3:0]), .ascii(str_print[230]));
  hex_to_ascii inst_a2_7(.hex(a2[31:28]), .ascii(str_print[236]));
  hex_to_ascii inst_a2_6(.hex(a2[27:24]), .ascii(str_print[237]));
  hex_to_ascii inst_a2_5(.hex(a2[23:20]), .ascii(str_print[238]));
  hex_to_ascii inst_a2_4(.hex(a2[19:16]), .ascii(str_print[239]));
  hex_to_ascii inst_a2_3(.hex(a2[15:12]), .ascii(str_print[240]));
  hex_to_ascii inst_a2_2(.hex(a2[11:8]), .ascii(str_print[241]));
  hex_to_ascii inst_a2_1(.hex(a2[7:4]), .ascii(str_print[242]));
  hex_to_ascii inst_a2_0(.hex(a2[3:0]), .ascii(str_print[243]));
  hex_to_ascii inst_a3_7(.hex(a3[31:28]), .ascii(str_print[249]));
  hex_to_ascii inst_a3_6(.hex(a3[27:24]), .ascii(str_print[250]));
  hex_to_ascii inst_a3_5(.hex(a3[23:20]), .ascii(str_print[251]));
  hex_to_ascii inst_a3_4(.hex(a3[19:16]), .ascii(str_print[252]));
  hex_to_ascii inst_a3_3(.hex(a3[15:12]), .ascii(str_print[253]));
  hex_to_ascii inst_a3_2(.hex(a3[11:8]), .ascii(str_print[254]));
  hex_to_ascii inst_a3_1(.hex(a3[7:4]), .ascii(str_print[255]));
  hex_to_ascii inst_a3_0(.hex(a3[3:0]), .ascii(str_print[256]));
  hex_to_ascii inst_a4_7(.hex(a4[31:28]), .ascii(str_print[262]));
  hex_to_ascii inst_a4_6(.hex(a4[27:24]), .ascii(str_print[263]));
  hex_to_ascii inst_a4_5(.hex(a4[23:20]), .ascii(str_print[264]));
  hex_to_ascii inst_a4_4(.hex(a4[19:16]), .ascii(str_print[265]));
  hex_to_ascii inst_a4_3(.hex(a4[15:12]), .ascii(str_print[266]));
  hex_to_ascii inst_a4_2(.hex(a4[11:8]), .ascii(str_print[267]));
  hex_to_ascii inst_a4_1(.hex(a4[7:4]), .ascii(str_print[268]));
  hex_to_ascii inst_a4_0(.hex(a4[3:0]), .ascii(str_print[269]));
  hex_to_ascii inst_a5_7(.hex(a5[31:28]), .ascii(str_print[276]));
  hex_to_ascii inst_a5_6(.hex(a5[27:24]), .ascii(str_print[277]));
  hex_to_ascii inst_a5_5(.hex(a5[23:20]), .ascii(str_print[278]));
  hex_to_ascii inst_a5_4(.hex(a5[19:16]), .ascii(str_print[279]));
  hex_to_ascii inst_a5_3(.hex(a5[15:12]), .ascii(str_print[280]));
  hex_to_ascii inst_a5_2(.hex(a5[11:8]), .ascii(str_print[281]));
  hex_to_ascii inst_a5_1(.hex(a5[7:4]), .ascii(str_print[282]));
  hex_to_ascii inst_a5_0(.hex(a5[3:0]), .ascii(str_print[283]));
  hex_to_ascii inst_a6_7(.hex(a6[31:28]), .ascii(str_print[289]));
  hex_to_ascii inst_a6_6(.hex(a6[27:24]), .ascii(str_print[290]));
  hex_to_ascii inst_a6_5(.hex(a6[23:20]), .ascii(str_print[291]));
  hex_to_ascii inst_a6_4(.hex(a6[19:16]), .ascii(str_print[292]));
  hex_to_ascii inst_a6_3(.hex(a6[15:12]), .ascii(str_print[293]));
  hex_to_ascii inst_a6_2(.hex(a6[11:8]), .ascii(str_print[294]));
  hex_to_ascii inst_a6_1(.hex(a6[7:4]), .ascii(str_print[295]));
  hex_to_ascii inst_a6_0(.hex(a6[3:0]), .ascii(str_print[296]));
  hex_to_ascii inst_a7_7(.hex(a7[31:28]), .ascii(str_print[302]));
  hex_to_ascii inst_a7_6(.hex(a7[27:24]), .ascii(str_print[303]));
  hex_to_ascii inst_a7_5(.hex(a7[23:20]), .ascii(str_print[304]));
  hex_to_ascii inst_a7_4(.hex(a7[19:16]), .ascii(str_print[305]));
  hex_to_ascii inst_a7_3(.hex(a7[15:12]), .ascii(str_print[306]));
  hex_to_ascii inst_a7_2(.hex(a7[11:8]), .ascii(str_print[307]));
  hex_to_ascii inst_a7_1(.hex(a7[7:4]), .ascii(str_print[308]));
  hex_to_ascii inst_a7_0(.hex(a7[3:0]), .ascii(str_print[309]));
  hex_to_ascii inst_s2_7(.hex(s2[31:28]), .ascii(str_print[315]));
  hex_to_ascii inst_s2_6(.hex(s2[27:24]), .ascii(str_print[316]));
  hex_to_ascii inst_s2_5(.hex(s2[23:20]), .ascii(str_print[317]));
  hex_to_ascii inst_s2_4(.hex(s2[19:16]), .ascii(str_print[318]));
  hex_to_ascii inst_s2_3(.hex(s2[15:12]), .ascii(str_print[319]));
  hex_to_ascii inst_s2_2(.hex(s2[11:8]), .ascii(str_print[320]));
  hex_to_ascii inst_s2_1(.hex(s2[7:4]), .ascii(str_print[321]));
  hex_to_ascii inst_s2_0(.hex(s2[3:0]), .ascii(str_print[322]));
  hex_to_ascii inst_s3_7(.hex(s3[31:28]), .ascii(str_print[328]));
  hex_to_ascii inst_s3_6(.hex(s3[27:24]), .ascii(str_print[329]));
  hex_to_ascii inst_s3_5(.hex(s3[23:20]), .ascii(str_print[330]));
  hex_to_ascii inst_s3_4(.hex(s3[19:16]), .ascii(str_print[331]));
  hex_to_ascii inst_s3_3(.hex(s3[15:12]), .ascii(str_print[332]));
  hex_to_ascii inst_s3_2(.hex(s3[11:8]), .ascii(str_print[333]));
  hex_to_ascii inst_s3_1(.hex(s3[7:4]), .ascii(str_print[334]));
  hex_to_ascii inst_s3_0(.hex(s3[3:0]), .ascii(str_print[335]));
  hex_to_ascii inst_s4_7(.hex(s4[31:28]), .ascii(str_print[342]));
  hex_to_ascii inst_s4_6(.hex(s4[27:24]), .ascii(str_print[343]));
  hex_to_ascii inst_s4_5(.hex(s4[23:20]), .ascii(str_print[344]));
  hex_to_ascii inst_s4_4(.hex(s4[19:16]), .ascii(str_print[345]));
  hex_to_ascii inst_s4_3(.hex(s4[15:12]), .ascii(str_print[346]));
  hex_to_ascii inst_s4_2(.hex(s4[11:8]), .ascii(str_print[347]));
  hex_to_ascii inst_s4_1(.hex(s4[7:4]), .ascii(str_print[348]));
  hex_to_ascii inst_s4_0(.hex(s4[3:0]), .ascii(str_print[349]));
  hex_to_ascii inst_s5_7(.hex(s5[31:28]), .ascii(str_print[355]));
  hex_to_ascii inst_s5_6(.hex(s5[27:24]), .ascii(str_print[356]));
  hex_to_ascii inst_s5_5(.hex(s5[23:20]), .ascii(str_print[357]));
  hex_to_ascii inst_s5_4(.hex(s5[19:16]), .ascii(str_print[358]));
  hex_to_ascii inst_s5_3(.hex(s5[15:12]), .ascii(str_print[359]));
  hex_to_ascii inst_s5_2(.hex(s5[11:8]), .ascii(str_print[360]));
  hex_to_ascii inst_s5_1(.hex(s5[7:4]), .ascii(str_print[361]));
  hex_to_ascii inst_s5_0(.hex(s5[3:0]), .ascii(str_print[362]));
  hex_to_ascii inst_s6_7(.hex(s6[31:28]), .ascii(str_print[368]));
  hex_to_ascii inst_s6_6(.hex(s6[27:24]), .ascii(str_print[369]));
  hex_to_ascii inst_s6_5(.hex(s6[23:20]), .ascii(str_print[370]));
  hex_to_ascii inst_s6_4(.hex(s6[19:16]), .ascii(str_print[371]));
  hex_to_ascii inst_s6_3(.hex(s6[15:12]), .ascii(str_print[372]));
  hex_to_ascii inst_s6_2(.hex(s6[11:8]), .ascii(str_print[373]));
  hex_to_ascii inst_s6_1(.hex(s6[7:4]), .ascii(str_print[374]));
  hex_to_ascii inst_s6_0(.hex(s6[3:0]), .ascii(str_print[375]));
  hex_to_ascii inst_s7_7(.hex(s7[31:28]), .ascii(str_print[381]));
  hex_to_ascii inst_s7_6(.hex(s7[27:24]), .ascii(str_print[382]));
  hex_to_ascii inst_s7_5(.hex(s7[23:20]), .ascii(str_print[383]));
  hex_to_ascii inst_s7_4(.hex(s7[19:16]), .ascii(str_print[384]));
  hex_to_ascii inst_s7_3(.hex(s7[15:12]), .ascii(str_print[385]));
  hex_to_ascii inst_s7_2(.hex(s7[11:8]), .ascii(str_print[386]));
  hex_to_ascii inst_s7_1(.hex(s7[7:4]), .ascii(str_print[387]));
  hex_to_ascii inst_s7_0(.hex(s7[3:0]), .ascii(str_print[388]));
  hex_to_ascii inst_s8_7(.hex(s8[31:28]), .ascii(str_print[394]));
  hex_to_ascii inst_s8_6(.hex(s8[27:24]), .ascii(str_print[395]));
  hex_to_ascii inst_s8_5(.hex(s8[23:20]), .ascii(str_print[396]));
  hex_to_ascii inst_s8_4(.hex(s8[19:16]), .ascii(str_print[397]));
  hex_to_ascii inst_s8_3(.hex(s8[15:12]), .ascii(str_print[398]));
  hex_to_ascii inst_s8_2(.hex(s8[11:8]), .ascii(str_print[399]));
  hex_to_ascii inst_s8_1(.hex(s8[7:4]), .ascii(str_print[400]));
  hex_to_ascii inst_s8_0(.hex(s8[3:0]), .ascii(str_print[401]));
  hex_to_ascii inst_s9_7(.hex(s9[31:28]), .ascii(str_print[408]));
  hex_to_ascii inst_s9_6(.hex(s9[27:24]), .ascii(str_print[409]));
  hex_to_ascii inst_s9_5(.hex(s9[23:20]), .ascii(str_print[410]));
  hex_to_ascii inst_s9_4(.hex(s9[19:16]), .ascii(str_print[411]));
  hex_to_ascii inst_s9_3(.hex(s9[15:12]), .ascii(str_print[412]));
  hex_to_ascii inst_s9_2(.hex(s9[11:8]), .ascii(str_print[413]));
  hex_to_ascii inst_s9_1(.hex(s9[7:4]), .ascii(str_print[414]));
  hex_to_ascii inst_s9_0(.hex(s9[3:0]), .ascii(str_print[415]));
  hex_to_ascii inst_s10_7(.hex(s10[31:28]), .ascii(str_print[421]));
  hex_to_ascii inst_s10_6(.hex(s10[27:24]), .ascii(str_print[422]));
  hex_to_ascii inst_s10_5(.hex(s10[23:20]), .ascii(str_print[423]));
  hex_to_ascii inst_s10_4(.hex(s10[19:16]), .ascii(str_print[424]));
  hex_to_ascii inst_s10_3(.hex(s10[15:12]), .ascii(str_print[425]));
  hex_to_ascii inst_s10_2(.hex(s10[11:8]), .ascii(str_print[426]));
  hex_to_ascii inst_s10_1(.hex(s10[7:4]), .ascii(str_print[427]));
  hex_to_ascii inst_s10_0(.hex(s10[3:0]), .ascii(str_print[428]));
  hex_to_ascii inst_s11_7(.hex(s11[31:28]), .ascii(str_print[434]));
  hex_to_ascii inst_s11_6(.hex(s11[27:24]), .ascii(str_print[435]));
  hex_to_ascii inst_s11_5(.hex(s11[23:20]), .ascii(str_print[436]));
  hex_to_ascii inst_s11_4(.hex(s11[19:16]), .ascii(str_print[437]));
  hex_to_ascii inst_s11_3(.hex(s11[15:12]), .ascii(str_print[438]));
  hex_to_ascii inst_s11_2(.hex(s11[11:8]), .ascii(str_print[439]));
  hex_to_ascii inst_s11_1(.hex(s11[7:4]), .ascii(str_print[440]));
  hex_to_ascii inst_s11_0(.hex(s11[3:0]), .ascii(str_print[441]));
  hex_to_ascii inst_t3_7(.hex(t3[31:28]), .ascii(str_print[447]));
  hex_to_ascii inst_t3_6(.hex(t3[27:24]), .ascii(str_print[448]));
  hex_to_ascii inst_t3_5(.hex(t3[23:20]), .ascii(str_print[449]));
  hex_to_ascii inst_t3_4(.hex(t3[19:16]), .ascii(str_print[450]));
  hex_to_ascii inst_t3_3(.hex(t3[15:12]), .ascii(str_print[451]));
  hex_to_ascii inst_t3_2(.hex(t3[11:8]), .ascii(str_print[452]));
  hex_to_ascii inst_t3_1(.hex(t3[7:4]), .ascii(str_print[453]));
  hex_to_ascii inst_t3_0(.hex(t3[3:0]), .ascii(str_print[454]));
  hex_to_ascii inst_t4_7(.hex(t4[31:28]), .ascii(str_print[460]));
  hex_to_ascii inst_t4_6(.hex(t4[27:24]), .ascii(str_print[461]));
  hex_to_ascii inst_t4_5(.hex(t4[23:20]), .ascii(str_print[462]));
  hex_to_ascii inst_t4_4(.hex(t4[19:16]), .ascii(str_print[463]));
  hex_to_ascii inst_t4_3(.hex(t4[15:12]), .ascii(str_print[464]));
  hex_to_ascii inst_t4_2(.hex(t4[11:8]), .ascii(str_print[465]));
  hex_to_ascii inst_t4_1(.hex(t4[7:4]), .ascii(str_print[466]));
  hex_to_ascii inst_t4_0(.hex(t4[3:0]), .ascii(str_print[467]));
  hex_to_ascii inst_t5_7(.hex(t5[31:28]), .ascii(str_print[474]));
  hex_to_ascii inst_t5_6(.hex(t5[27:24]), .ascii(str_print[475]));
  hex_to_ascii inst_t5_5(.hex(t5[23:20]), .ascii(str_print[476]));
  hex_to_ascii inst_t5_4(.hex(t5[19:16]), .ascii(str_print[477]));
  hex_to_ascii inst_t5_3(.hex(t5[15:12]), .ascii(str_print[478]));
  hex_to_ascii inst_t5_2(.hex(t5[11:8]), .ascii(str_print[479]));
  hex_to_ascii inst_t5_1(.hex(t5[7:4]), .ascii(str_print[480]));
  hex_to_ascii inst_t5_0(.hex(t5[3:0]), .ascii(str_print[481]));
  hex_to_ascii inst_t6_7(.hex(t6[31:28]), .ascii(str_print[487]));
  hex_to_ascii inst_t6_6(.hex(t6[27:24]), .ascii(str_print[488]));
  hex_to_ascii inst_t6_5(.hex(t6[23:20]), .ascii(str_print[489]));
  hex_to_ascii inst_t6_4(.hex(t6[19:16]), .ascii(str_print[490]));
  hex_to_ascii inst_t6_3(.hex(t6[15:12]), .ascii(str_print[491]));
  hex_to_ascii inst_t6_2(.hex(t6[11:8]), .ascii(str_print[492]));
  hex_to_ascii inst_t6_1(.hex(t6[7:4]), .ascii(str_print[493]));
  hex_to_ascii inst_t6_0(.hex(t6[3:0]), .ascii(str_print[494]));


endmodule //string_to_print
module hex_to_ascii(
    input [3:0] hex,
    output[7:0] ascii
  );
  assign ascii = (hex > 4'h9) ? {4'h0, hex} + 8'h37 : {4'h0, hex} + 8'h30;
endmodule
