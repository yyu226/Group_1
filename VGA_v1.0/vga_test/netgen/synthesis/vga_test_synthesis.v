////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.76xd
//  \   \         Application: netgen
//  /   /         Filename: vga_test_synthesis.v
// /___/   /\     Timestamp: Fri Feb 27 09:16:25 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim vga_test.ngc vga_test_synthesis.v 
// Device	: xc3s400a-4-ft256
// Input file	: vga_test.ngc
// Output file	: C:\Users\yingyu\Desktop\ISEproj\VGA_v1.0\vga_test\netgen\synthesis\vga_test_synthesis.v
// # of Modules	: 1
// Design Name	: vga_test
// Xilinx        : C:\Xilinx\13.3\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module vga_test (
  VGA_CLK, VGA_HS, sync_out_1, VGA_VS, sync_out_2, VGA_BLANK_N, psave_n, VGA_SYNC_N, CLOCK_66, iso_gnd, sync_in_1, sync_in_2, VGA_B, VGA_G, VGA_R
)/* synthesis syn_black_box syn_noprune=1 */;
  output VGA_CLK;
  output VGA_HS;
  output sync_out_1;
  output VGA_VS;
  output sync_out_2;
  output VGA_BLANK_N;
  output psave_n;
  output VGA_SYNC_N;
  input CLOCK_66;
  output iso_gnd;
  input sync_in_1;
  input sync_in_2;
  output [7 : 0] VGA_B;
  output [7 : 0] VGA_G;
  output [7 : 0] VGA_R;
  
  // synthesis translate_off
  
  wire \DCMIP/CLK0_BUF ;
  wire \DCMIP/CLK2X_BUF ;
  wire \DCMIP/CLKDV_BUF ;
  wire \DCMIP/CLKFB_IN ;
  wire \DCMIP/CLKFX_BUF ;
  wire \DCMIP/CLKIN_IBUFG ;
  wire \HCM1/Mcount_cntrh_cy<1>_rt_9 ;
  wire \HCM1/Mcount_cntrh_cy<2>_rt_11 ;
  wire \HCM1/Mcount_cntrh_cy<3>_rt_13 ;
  wire \HCM1/Mcount_cntrh_cy<4>_rt_15 ;
  wire \HCM1/Mcount_cntrh_cy<5>_rt_17 ;
  wire \HCM1/Mcount_cntrh_cy<6>_rt_19 ;
  wire \HCM1/Mcount_cntrh_cy<7>_rt_21 ;
  wire \HCM1/Mcount_cntrh_cy<8>_rt_23 ;
  wire \HCM1/Mcount_cntrh_xor<9>_rt_25 ;
  wire \HCM1/N3 ;
  wire \HCM1/N6 ;
  wire \HCM1/N7 ;
  wire \HCM1/cntrh_not0001_49 ;
  wire \HCM1/hd_50 ;
  wire \HCM1/hd_mux0000 ;
  wire \HCM1/hd_mux000011 ;
  wire \HCM1/hd_not0001 ;
  wire \HCM1/hde_54 ;
  wire \HCM1/hde_mux0000_55 ;
  wire \HCM1/hde_not0001 ;
  wire \HCM1/hdeb_57 ;
  wire \HCM1/hdeb_mux0000 ;
  wire \HCM1/hdeb_not0001 ;
  wire \HCM1/hdeb_not000125_60 ;
  wire \HCM1/hdebc_61 ;
  wire \HCM1/hdebc_mux0000 ;
  wire \HDATO/q_63 ;
  wire \HDATO/q_mux0000 ;
  wire \HDATO/q_not0001 ;
  wire \HSYNC/q_66 ;
  wire \HSYNC/q_mux0000 ;
  wire \HSYNC/q_not0001 ;
  wire Madd_cdata_index0000;
  wire Mcount_frame;
  wire Mcount_frame1;
  wire Mcount_frame2;
  wire Mcount_frame3;
  wire N1;
  wire N11;
  wire N15;
  wire N17;
  wire N19;
  wire N2;
  wire N20;
  wire N7;
  wire N9;
  wire \VCM1/Mcount_cntrv_cy<1>_rt_98 ;
  wire \VCM1/Mcount_cntrv_cy<2>_rt_100 ;
  wire \VCM1/Mcount_cntrv_cy<3>_rt_102 ;
  wire \VCM1/Mcount_cntrv_cy<4>_rt_104 ;
  wire \VCM1/Mcount_cntrv_cy<5>_rt_106 ;
  wire \VCM1/Mcount_cntrv_cy<6>_rt_108 ;
  wire \VCM1/Mcount_cntrv_cy<7>_rt_110 ;
  wire \VCM1/Mcount_cntrv_cy<8>_rt_112 ;
  wire \VCM1/Mcount_cntrv_xor<9>_rt_114 ;
  wire \VCM1/N3 ;
  wire \VCM1/N5 ;
  wire \VCM1/N6 ;
  wire \VCM1/cntrv_not0001 ;
  wire \VCM1/cntrv_not00018_139 ;
  wire \VCM1/vr_140 ;
  wire \VCM1/vr_mux0000 ;
  wire \VCM1/vr_not0001 ;
  wire \VCM1/vrs_143 ;
  wire \VCM1/vrs_mux0000 ;
  wire \VCM1/vrs_not0001 ;
  wire \VCM1/vrs_not00011_146 ;
  wire \VCM1/vrs_not00012 ;
  wire \VCM1/vrsp_148 ;
  wire \VCM1/vrsp_mux0000 ;
  wire \VCM1/vrsp_not0001 ;
  wire \VCM1/vrspq_151 ;
  wire \VCM1/vrspq_mux0000 ;
  wire \VDATO/q_153 ;
  wire \VDATO/q_mux0000 ;
  wire \VDATO/q_not0001 ;
  wire VGA_R_0_OBUF_183;
  wire VGA_R_1_OBUF_184;
  wire VGA_R_2_OBUF_185;
  wire VGA_R_3_OBUF_186;
  wire VGA_R_4_OBUF_187;
  wire VGA_R_5_OBUF_188;
  wire VGA_R_6_OBUF_189;
  wire VGA_R_7_OBUF_190;
  wire VGA_SYNC_N_OBUF_192;
  wire VGA_VS_inv;
  wire \VSYNC/q_195 ;
  wire \VSYNC/q_1_196 ;
  wire \VSYNC/q_mux0000 ;
  wire \VSYNC/q_not0001 ;
  wire clk_25m_215;
  wire clk_25m1;
  wire clk_50;
  wire delay_st_FSM_FFd1_234;
  wire \delay_st_FSM_FFd1-In ;
  wire delay_st_FSM_FFd2_236;
  wire \delay_st_FSM_FFd2-In ;
  wire iso_gnd_OBUF_243;
  wire sgnl_248;
  wire srst;
  wire srst_cmp_eq000012_250;
  wire srst_cmp_eq000030_251;
  wire stch_252;
  wire stch_mux0000;
  wire sync_in_1_IBUF_255;
  wire sync_in_1_inv;
  wire sync_in_2_IBUF_258;
  wire sync_out_1_OBUF_260;
  wire sync_out_2_OBUF_262;
  wire wdata_cmp_eq0000;
  wire \NLW_DCMIP/DCM_SP_INST_CLK90_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_CLK180_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_CLK270_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_CLK2X180_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_CLKFX180_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_LOCKED_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_PSDONE_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<7>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<6>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<5>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<4>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<3>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<2>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<1>_UNCONNECTED ;
  wire \NLW_DCMIP/DCM_SP_INST_STATUS<0>_UNCONNECTED ;
  wire \NLW_DCMIP/CLK2X_BUFG_INST_O_UNCONNECTED ;
  wire \NLW_DCMIP/CLKDV_BUFG_INST_O_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<31>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<30>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<29>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<28>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<27>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<26>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<25>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<24>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<23>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<22>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<21>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<20>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<19>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<18>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<17>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<16>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<15>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<14>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<13>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<12>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<11>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<10>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<9>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<8>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<7>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<6>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<5>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<4>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<3>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<2>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<1>_UNCONNECTED ;
  wire \NLW_DDSM1_phase_out<0>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<31>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<30>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<29>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<28>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<27>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<26>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<25>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<24>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<23>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<22>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<21>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<20>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<19>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<18>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<17>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<16>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<15>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<14>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<13>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<12>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<11>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<10>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<9>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<8>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<7>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<6>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<5>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<4>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<3>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<2>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<1>_UNCONNECTED ;
  wire \NLW_DDSM2_phase_out<0>_UNCONNECTED ;
  wire [8 : 0] \HCM1/Mcount_cntrh_cy ;
  wire [0 : 0] \HCM1/Mcount_cntrh_lut ;
  wire [9 : 0] \HCM1/Result ;
  wire [9 : 0] \HCM1/cntrh ;
  wire [5 : 0] Madd_cdata_addsub0001_cy;
  wire [6 : 0] Madd_cdata_addsub0001_lut;
  wire [8 : 0] \VCM1/Mcount_cntrv_cy ;
  wire [0 : 0] \VCM1/Mcount_cntrv_lut ;
  wire [9 : 0] \VCM1/Result ;
  wire [9 : 0] \VCM1/cntrv ;
  wire [7 : 0] cdata;
  wire [6 : 1] cdata_addsub0001;
  wire [7 : 6] cdata_mux0000;
  wire [7 : 0] cosd2;
  wire [7 : 0] cosd;
  wire [3 : 0] frame;
  wire [31 : 29] phsr1;
  GND   XST_GND (
    .G(iso_gnd_OBUF_243)
  );
  VCC   XST_VCC (
    .P(VGA_SYNC_N_OBUF_192)
  );
  FD   cdata_0 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[1]),
    .Q(cdata[0])
  );
  FD   cdata_1 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[2]),
    .Q(cdata[1])
  );
  FD   cdata_2 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[3]),
    .Q(cdata[2])
  );
  FD   cdata_3 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[4]),
    .Q(cdata[3])
  );
  FD   cdata_4 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[5]),
    .Q(cdata[4])
  );
  FD   cdata_5 (
    .C(clk_25m_215),
    .D(cdata_addsub0001[6]),
    .Q(cdata[5])
  );
  FD   cdata_6 (
    .C(clk_25m_215),
    .D(cdata_mux0000[6]),
    .Q(cdata[6])
  );
  FD   cdata_7 (
    .C(clk_25m_215),
    .D(cdata_mux0000[7]),
    .Q(cdata[7])
  );
  FDR   sgnl (
    .C(\VSYNC/q_195 ),
    .D(VGA_SYNC_N_OBUF_192),
    .R(sync_in_1_inv),
    .Q(sgnl_248)
  );
  FD   stch (
    .C(\VSYNC/q_195 ),
    .D(stch_mux0000),
    .Q(stch_252)
  );
  FD #(
    .INIT ( 1'b0 ))
  delay_st_FSM_FFd1 (
    .C(\VSYNC/q_195 ),
    .D(\delay_st_FSM_FFd1-In ),
    .Q(delay_st_FSM_FFd1_234)
  );
  FD #(
    .INIT ( 1'b0 ))
  delay_st_FSM_FFd2 (
    .C(\VSYNC/q_195 ),
    .D(\delay_st_FSM_FFd2-In ),
    .Q(delay_st_FSM_FFd2_236)
  );
  FDRE   \VDATO/q  (
    .C(clk_25m_215),
    .CE(\VDATO/q_not0001 ),
    .D(\VDATO/q_mux0000 ),
    .R(iso_gnd_OBUF_243),
    .Q(\VDATO/q_153 )
  );
  FDRE   \VSYNC/q  (
    .C(clk_25m_215),
    .CE(\VSYNC/q_not0001 ),
    .D(\VSYNC/q_mux0000 ),
    .R(iso_gnd_OBUF_243),
    .Q(\VSYNC/q_195 )
  );
  FDRE   \HDATO/q  (
    .C(clk_25m_215),
    .CE(\HDATO/q_not0001 ),
    .D(\HDATO/q_mux0000 ),
    .R(iso_gnd_OBUF_243),
    .Q(\HDATO/q_63 )
  );
  FDRE   \HSYNC/q  (
    .C(clk_25m_215),
    .CE(\HSYNC/q_not0001 ),
    .D(\HSYNC/q_mux0000 ),
    .R(iso_gnd_OBUF_243),
    .Q(\HSYNC/q_66 )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  frame_0 (
    .C(VGA_VS_inv),
    .CE(sync_in_2_IBUF_258),
    .CLR(sync_in_1_inv),
    .D(Mcount_frame),
    .Q(frame[0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  frame_1 (
    .C(VGA_VS_inv),
    .CE(sync_in_2_IBUF_258),
    .CLR(sync_in_1_inv),
    .D(Mcount_frame1),
    .Q(frame[1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  frame_2 (
    .C(VGA_VS_inv),
    .CE(sync_in_2_IBUF_258),
    .CLR(sync_in_1_inv),
    .D(Mcount_frame2),
    .Q(frame[2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  frame_3 (
    .C(VGA_VS_inv),
    .CE(sync_in_2_IBUF_258),
    .CLR(sync_in_1_inv),
    .D(Mcount_frame3),
    .Q(frame[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<0>  (
    .I0(cosd[0]),
    .I1(cosd2[0]),
    .O(Madd_cdata_addsub0001_lut[0])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<0>  (
    .CI(iso_gnd_OBUF_243),
    .DI(cosd[0]),
    .S(Madd_cdata_addsub0001_lut[0]),
    .O(Madd_cdata_addsub0001_cy[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<1>  (
    .I0(cosd[1]),
    .I1(cosd2[1]),
    .O(Madd_cdata_addsub0001_lut[1])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<1>  (
    .CI(Madd_cdata_addsub0001_cy[0]),
    .DI(cosd[1]),
    .S(Madd_cdata_addsub0001_lut[1]),
    .O(Madd_cdata_addsub0001_cy[1])
  );
  XORCY   \Madd_cdata_addsub0001_xor<1>  (
    .CI(Madd_cdata_addsub0001_cy[0]),
    .LI(Madd_cdata_addsub0001_lut[1]),
    .O(cdata_addsub0001[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<2>  (
    .I0(cosd[2]),
    .I1(cosd2[2]),
    .O(Madd_cdata_addsub0001_lut[2])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<2>  (
    .CI(Madd_cdata_addsub0001_cy[1]),
    .DI(cosd[2]),
    .S(Madd_cdata_addsub0001_lut[2]),
    .O(Madd_cdata_addsub0001_cy[2])
  );
  XORCY   \Madd_cdata_addsub0001_xor<2>  (
    .CI(Madd_cdata_addsub0001_cy[1]),
    .LI(Madd_cdata_addsub0001_lut[2]),
    .O(cdata_addsub0001[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<3>  (
    .I0(cosd[3]),
    .I1(cosd2[3]),
    .O(Madd_cdata_addsub0001_lut[3])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<3>  (
    .CI(Madd_cdata_addsub0001_cy[2]),
    .DI(cosd[3]),
    .S(Madd_cdata_addsub0001_lut[3]),
    .O(Madd_cdata_addsub0001_cy[3])
  );
  XORCY   \Madd_cdata_addsub0001_xor<3>  (
    .CI(Madd_cdata_addsub0001_cy[2]),
    .LI(Madd_cdata_addsub0001_lut[3]),
    .O(cdata_addsub0001[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<4>  (
    .I0(cosd[4]),
    .I1(cosd2[4]),
    .O(Madd_cdata_addsub0001_lut[4])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<4>  (
    .CI(Madd_cdata_addsub0001_cy[3]),
    .DI(cosd[4]),
    .S(Madd_cdata_addsub0001_lut[4]),
    .O(Madd_cdata_addsub0001_cy[4])
  );
  XORCY   \Madd_cdata_addsub0001_xor<4>  (
    .CI(Madd_cdata_addsub0001_cy[3]),
    .LI(Madd_cdata_addsub0001_lut[4]),
    .O(cdata_addsub0001[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<5>  (
    .I0(cosd[5]),
    .I1(cosd2[5]),
    .O(Madd_cdata_addsub0001_lut[5])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<5>  (
    .CI(Madd_cdata_addsub0001_cy[4]),
    .DI(cosd[5]),
    .S(Madd_cdata_addsub0001_lut[5]),
    .O(Madd_cdata_addsub0001_cy[5])
  );
  XORCY   \Madd_cdata_addsub0001_xor<5>  (
    .CI(Madd_cdata_addsub0001_cy[4]),
    .LI(Madd_cdata_addsub0001_lut[5]),
    .O(cdata_addsub0001[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_cdata_addsub0001_lut<6>  (
    .I0(cosd[6]),
    .I1(cosd2[6]),
    .O(Madd_cdata_addsub0001_lut[6])
  );
  MUXCY   \Madd_cdata_addsub0001_cy<6>  (
    .CI(Madd_cdata_addsub0001_cy[5]),
    .DI(cosd[6]),
    .S(Madd_cdata_addsub0001_lut[6]),
    .O(Madd_cdata_index0000)
  );
  XORCY   \Madd_cdata_addsub0001_xor<6>  (
    .CI(Madd_cdata_addsub0001_cy[5]),
    .LI(Madd_cdata_addsub0001_lut[6]),
    .O(cdata_addsub0001[6])
  );
  DCM_SP #(
    .CLKDV_DIVIDE ( 2.000000 ),
    .CLKFX_DIVIDE ( 4 ),
    .CLKFX_MULTIPLY ( 3 ),
    .CLKIN_DIVIDE_BY_2 ( "FALSE" ),
    .CLKIN_PERIOD ( 15.001000 ),
    .CLKOUT_PHASE_SHIFT ( "NONE" ),
    .CLK_FEEDBACK ( "1X" ),
    .DESKEW_ADJUST ( "SYSTEM_SYNCHRONOUS" ),
    .DFS_FREQUENCY_MODE ( "LOW" ),
    .DLL_FREQUENCY_MODE ( "LOW" ),
    .DSS_MODE ( "NONE" ),
    .DUTY_CYCLE_CORRECTION ( "TRUE" ),
    .PHASE_SHIFT ( 0 ),
    .STARTUP_WAIT ( "FALSE" ),
    .FACTORY_JF ( 16'hC080 ))
  \DCMIP/DCM_SP_INST  (
    .CLKIN(\DCMIP/CLKIN_IBUFG ),
    .CLKFB(\DCMIP/CLKFB_IN ),
    .RST(iso_gnd_OBUF_243),
    .DSSEN(iso_gnd_OBUF_243),
    .PSINCDEC(iso_gnd_OBUF_243),
    .PSEN(iso_gnd_OBUF_243),
    .PSCLK(iso_gnd_OBUF_243),
    .CLK0(\DCMIP/CLK0_BUF ),
    .CLK90(\NLW_DCMIP/DCM_SP_INST_CLK90_UNCONNECTED ),
    .CLK180(\NLW_DCMIP/DCM_SP_INST_CLK180_UNCONNECTED ),
    .CLK270(\NLW_DCMIP/DCM_SP_INST_CLK270_UNCONNECTED ),
    .CLK2X(\DCMIP/CLK2X_BUF ),
    .CLK2X180(\NLW_DCMIP/DCM_SP_INST_CLK2X180_UNCONNECTED ),
    .CLKDV(\DCMIP/CLKDV_BUF ),
    .CLKFX(\DCMIP/CLKFX_BUF ),
    .CLKFX180(\NLW_DCMIP/DCM_SP_INST_CLKFX180_UNCONNECTED ),
    .LOCKED(\NLW_DCMIP/DCM_SP_INST_LOCKED_UNCONNECTED ),
    .PSDONE(\NLW_DCMIP/DCM_SP_INST_PSDONE_UNCONNECTED ),
    .STATUS({\NLW_DCMIP/DCM_SP_INST_STATUS<7>_UNCONNECTED , \NLW_DCMIP/DCM_SP_INST_STATUS<6>_UNCONNECTED , 
\NLW_DCMIP/DCM_SP_INST_STATUS<5>_UNCONNECTED , \NLW_DCMIP/DCM_SP_INST_STATUS<4>_UNCONNECTED , \NLW_DCMIP/DCM_SP_INST_STATUS<3>_UNCONNECTED , 
\NLW_DCMIP/DCM_SP_INST_STATUS<2>_UNCONNECTED , \NLW_DCMIP/DCM_SP_INST_STATUS<1>_UNCONNECTED , \NLW_DCMIP/DCM_SP_INST_STATUS<0>_UNCONNECTED })
  );
  BUFG   \DCMIP/CLK2X_BUFG_INST  (
    .I(\DCMIP/CLK2X_BUF ),
    .O(\NLW_DCMIP/CLK2X_BUFG_INST_O_UNCONNECTED )
  );
  BUFG   \DCMIP/CLK0_BUFG_INST  (
    .I(\DCMIP/CLK0_BUF ),
    .O(\DCMIP/CLKFB_IN )
  );
  IBUFG #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IOSTANDARD ( "DEFAULT" ))
  \DCMIP/CLKIN_IBUFG_INST  (
    .I(CLOCK_66),
    .O(\DCMIP/CLKIN_IBUFG )
  );
  BUFG   \DCMIP/CLKFX_BUFG_INST  (
    .I(\DCMIP/CLKFX_BUF ),
    .O(clk_50)
  );
  BUFG   \DCMIP/CLKDV_BUFG_INST  (
    .I(\DCMIP/CLKDV_BUF ),
    .O(\NLW_DCMIP/CLKDV_BUFG_INST_O_UNCONNECTED )
  );
  XORCY   \HCM1/Mcount_cntrh_xor<9>  (
    .CI(\HCM1/Mcount_cntrh_cy [8]),
    .LI(\HCM1/Mcount_cntrh_xor<9>_rt_25 ),
    .O(\HCM1/Result [9])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<8>  (
    .CI(\HCM1/Mcount_cntrh_cy [7]),
    .LI(\HCM1/Mcount_cntrh_cy<8>_rt_23 ),
    .O(\HCM1/Result [8])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<8>  (
    .CI(\HCM1/Mcount_cntrh_cy [7]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<8>_rt_23 ),
    .O(\HCM1/Mcount_cntrh_cy [8])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<7>  (
    .CI(\HCM1/Mcount_cntrh_cy [6]),
    .LI(\HCM1/Mcount_cntrh_cy<7>_rt_21 ),
    .O(\HCM1/Result [7])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<7>  (
    .CI(\HCM1/Mcount_cntrh_cy [6]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<7>_rt_21 ),
    .O(\HCM1/Mcount_cntrh_cy [7])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<6>  (
    .CI(\HCM1/Mcount_cntrh_cy [5]),
    .LI(\HCM1/Mcount_cntrh_cy<6>_rt_19 ),
    .O(\HCM1/Result [6])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<6>  (
    .CI(\HCM1/Mcount_cntrh_cy [5]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<6>_rt_19 ),
    .O(\HCM1/Mcount_cntrh_cy [6])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<5>  (
    .CI(\HCM1/Mcount_cntrh_cy [4]),
    .LI(\HCM1/Mcount_cntrh_cy<5>_rt_17 ),
    .O(\HCM1/Result [5])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<5>  (
    .CI(\HCM1/Mcount_cntrh_cy [4]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<5>_rt_17 ),
    .O(\HCM1/Mcount_cntrh_cy [5])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<4>  (
    .CI(\HCM1/Mcount_cntrh_cy [3]),
    .LI(\HCM1/Mcount_cntrh_cy<4>_rt_15 ),
    .O(\HCM1/Result [4])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<4>  (
    .CI(\HCM1/Mcount_cntrh_cy [3]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<4>_rt_15 ),
    .O(\HCM1/Mcount_cntrh_cy [4])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<3>  (
    .CI(\HCM1/Mcount_cntrh_cy [2]),
    .LI(\HCM1/Mcount_cntrh_cy<3>_rt_13 ),
    .O(\HCM1/Result [3])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<3>  (
    .CI(\HCM1/Mcount_cntrh_cy [2]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<3>_rt_13 ),
    .O(\HCM1/Mcount_cntrh_cy [3])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<2>  (
    .CI(\HCM1/Mcount_cntrh_cy [1]),
    .LI(\HCM1/Mcount_cntrh_cy<2>_rt_11 ),
    .O(\HCM1/Result [2])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<2>  (
    .CI(\HCM1/Mcount_cntrh_cy [1]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<2>_rt_11 ),
    .O(\HCM1/Mcount_cntrh_cy [2])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<1>  (
    .CI(\HCM1/Mcount_cntrh_cy [0]),
    .LI(\HCM1/Mcount_cntrh_cy<1>_rt_9 ),
    .O(\HCM1/Result [1])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<1>  (
    .CI(\HCM1/Mcount_cntrh_cy [0]),
    .DI(iso_gnd_OBUF_243),
    .S(\HCM1/Mcount_cntrh_cy<1>_rt_9 ),
    .O(\HCM1/Mcount_cntrh_cy [1])
  );
  XORCY   \HCM1/Mcount_cntrh_xor<0>  (
    .CI(iso_gnd_OBUF_243),
    .LI(\HCM1/Mcount_cntrh_lut [0]),
    .O(\HCM1/Result [0])
  );
  MUXCY   \HCM1/Mcount_cntrh_cy<0>  (
    .CI(iso_gnd_OBUF_243),
    .DI(VGA_SYNC_N_OBUF_192),
    .S(\HCM1/Mcount_cntrh_lut [0]),
    .O(\HCM1/Mcount_cntrh_cy [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_9  (
    .C(clk_25m_215),
    .D(\HCM1/Result [9]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_8  (
    .C(clk_25m_215),
    .D(\HCM1/Result [8]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_7  (
    .C(clk_25m_215),
    .D(\HCM1/Result [7]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_6  (
    .C(clk_25m_215),
    .D(\HCM1/Result [6]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_5  (
    .C(clk_25m_215),
    .D(\HCM1/Result [5]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_4  (
    .C(clk_25m_215),
    .D(\HCM1/Result [4]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_3  (
    .C(clk_25m_215),
    .D(\HCM1/Result [3]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_2  (
    .C(clk_25m_215),
    .D(\HCM1/Result [2]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_1  (
    .C(clk_25m_215),
    .D(\HCM1/Result [1]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HCM1/cntrh_0  (
    .C(clk_25m_215),
    .D(\HCM1/Result [0]),
    .R(\HCM1/cntrh_not0001_49 ),
    .Q(\HCM1/cntrh [0])
  );
  LD   \HCM1/hde  (
    .D(\HCM1/hde_mux0000_55 ),
    .G(\HCM1/hde_not0001 ),
    .Q(\HCM1/hde_54 )
  );
  LD   \HCM1/hdeb  (
    .D(\HCM1/hdeb_mux0000 ),
    .G(\HCM1/hdeb_not0001 ),
    .Q(\HCM1/hdeb_57 )
  );
  LD   \HCM1/hd  (
    .D(\HCM1/hd_mux0000 ),
    .G(\HCM1/hd_not0001 ),
    .Q(\HCM1/hd_50 )
  );
  LD   \HCM1/hdebc  (
    .D(\HCM1/hdebc_mux0000 ),
    .G(\HCM1/hd_not0001 ),
    .Q(\HCM1/hdebc_61 )
  );
  XORCY   \VCM1/Mcount_cntrv_xor<9>  (
    .CI(\VCM1/Mcount_cntrv_cy [8]),
    .LI(\VCM1/Mcount_cntrv_xor<9>_rt_114 ),
    .O(\VCM1/Result [9])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<8>  (
    .CI(\VCM1/Mcount_cntrv_cy [7]),
    .LI(\VCM1/Mcount_cntrv_cy<8>_rt_112 ),
    .O(\VCM1/Result [8])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<8>  (
    .CI(\VCM1/Mcount_cntrv_cy [7]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<8>_rt_112 ),
    .O(\VCM1/Mcount_cntrv_cy [8])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<7>  (
    .CI(\VCM1/Mcount_cntrv_cy [6]),
    .LI(\VCM1/Mcount_cntrv_cy<7>_rt_110 ),
    .O(\VCM1/Result [7])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<7>  (
    .CI(\VCM1/Mcount_cntrv_cy [6]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<7>_rt_110 ),
    .O(\VCM1/Mcount_cntrv_cy [7])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<6>  (
    .CI(\VCM1/Mcount_cntrv_cy [5]),
    .LI(\VCM1/Mcount_cntrv_cy<6>_rt_108 ),
    .O(\VCM1/Result [6])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<6>  (
    .CI(\VCM1/Mcount_cntrv_cy [5]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<6>_rt_108 ),
    .O(\VCM1/Mcount_cntrv_cy [6])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<5>  (
    .CI(\VCM1/Mcount_cntrv_cy [4]),
    .LI(\VCM1/Mcount_cntrv_cy<5>_rt_106 ),
    .O(\VCM1/Result [5])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<5>  (
    .CI(\VCM1/Mcount_cntrv_cy [4]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<5>_rt_106 ),
    .O(\VCM1/Mcount_cntrv_cy [5])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<4>  (
    .CI(\VCM1/Mcount_cntrv_cy [3]),
    .LI(\VCM1/Mcount_cntrv_cy<4>_rt_104 ),
    .O(\VCM1/Result [4])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<4>  (
    .CI(\VCM1/Mcount_cntrv_cy [3]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<4>_rt_104 ),
    .O(\VCM1/Mcount_cntrv_cy [4])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<3>  (
    .CI(\VCM1/Mcount_cntrv_cy [2]),
    .LI(\VCM1/Mcount_cntrv_cy<3>_rt_102 ),
    .O(\VCM1/Result [3])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<3>  (
    .CI(\VCM1/Mcount_cntrv_cy [2]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<3>_rt_102 ),
    .O(\VCM1/Mcount_cntrv_cy [3])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<2>  (
    .CI(\VCM1/Mcount_cntrv_cy [1]),
    .LI(\VCM1/Mcount_cntrv_cy<2>_rt_100 ),
    .O(\VCM1/Result [2])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<2>  (
    .CI(\VCM1/Mcount_cntrv_cy [1]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<2>_rt_100 ),
    .O(\VCM1/Mcount_cntrv_cy [2])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<1>  (
    .CI(\VCM1/Mcount_cntrv_cy [0]),
    .LI(\VCM1/Mcount_cntrv_cy<1>_rt_98 ),
    .O(\VCM1/Result [1])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<1>  (
    .CI(\VCM1/Mcount_cntrv_cy [0]),
    .DI(iso_gnd_OBUF_243),
    .S(\VCM1/Mcount_cntrv_cy<1>_rt_98 ),
    .O(\VCM1/Mcount_cntrv_cy [1])
  );
  XORCY   \VCM1/Mcount_cntrv_xor<0>  (
    .CI(iso_gnd_OBUF_243),
    .LI(\VCM1/Mcount_cntrv_lut [0]),
    .O(\VCM1/Result [0])
  );
  MUXCY   \VCM1/Mcount_cntrv_cy<0>  (
    .CI(iso_gnd_OBUF_243),
    .DI(VGA_SYNC_N_OBUF_192),
    .S(\VCM1/Mcount_cntrv_lut [0]),
    .O(\VCM1/Mcount_cntrv_cy [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_9  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [9]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_8  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [8]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_7  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [7]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_6  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [6]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_5  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [5]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_4  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [4]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_3  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [3]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_2  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [2]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_1  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [1]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \VCM1/cntrv_0  (
    .C(\HCM1/hdebc_61 ),
    .D(\VCM1/Result [0]),
    .R(\VCM1/cntrv_not0001 ),
    .Q(\VCM1/cntrv [0])
  );
  LD   \VCM1/vrs  (
    .D(\VCM1/vrs_mux0000 ),
    .G(\VCM1/vrs_not0001 ),
    .Q(\VCM1/vrs_143 )
  );
  LD   \VCM1/vrsp  (
    .D(\VCM1/vrsp_mux0000 ),
    .G(\VCM1/vrsp_not0001 ),
    .Q(\VCM1/vrsp_148 )
  );
  LD   \VCM1/vr  (
    .D(\VCM1/vr_mux0000 ),
    .G(\VCM1/vr_not0001 ),
    .Q(\VCM1/vr_140 )
  );
  LD   \VCM1/vrspq  (
    .D(\VCM1/vrspq_mux0000 ),
    .G(\VCM1/vr_not0001 ),
    .Q(\VCM1/vrspq_151 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \phsr1<31>1  (
    .I0(frame[3]),
    .I1(frame[2]),
    .O(phsr1[31])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \phsr1<30>1  (
    .I0(frame[3]),
    .I1(frame[1]),
    .O(phsr1[30])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \phsr1<29>1  (
    .I0(frame[3]),
    .I1(frame[0]),
    .O(phsr1[29])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \VSYNC/q_not00011  (
    .I0(\VCM1/vrs_143 ),
    .I1(\VCM1/vrsp_148 ),
    .O(\VSYNC/q_not0001 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \VSYNC/q_mux00001  (
    .I0(\VCM1/vrsp_148 ),
    .I1(\VCM1/vrs_143 ),
    .O(\VSYNC/q_mux0000 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \VDATO/q_not00011  (
    .I0(\VCM1/vr_140 ),
    .I1(\VCM1/vrspq_151 ),
    .O(\VDATO/q_not0001 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \VDATO/q_mux00001  (
    .I0(\VCM1/vrspq_151 ),
    .I1(\VCM1/vr_140 ),
    .O(\VDATO/q_mux0000 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \HSYNC/q_not00011  (
    .I0(\HCM1/hde_54 ),
    .I1(\HCM1/hdeb_57 ),
    .O(\HSYNC/q_not0001 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \HSYNC/q_mux00001  (
    .I0(\HCM1/hdeb_57 ),
    .I1(\HCM1/hde_54 ),
    .O(\HSYNC/q_mux0000 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \HDATO/q_not00011  (
    .I0(\HCM1/hd_50 ),
    .I1(\HCM1/hdebc_61 ),
    .O(\HDATO/q_not0001 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \HDATO/q_mux00001  (
    .I0(\HCM1/hdebc_61 ),
    .I1(\HCM1/hd_50 ),
    .O(\HDATO/q_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \VCM1/vrspq_mux00001  (
    .I0(\VCM1/N3 ),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/N6 ),
    .O(\VCM1/vrspq_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \VCM1/vrsp_mux00001  (
    .I0(\VCM1/N5 ),
    .I1(\VCM1/N3 ),
    .I2(\VCM1/cntrv [4]),
    .O(\VCM1/vrsp_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \VCM1/vr_mux00001  (
    .I0(\VCM1/N3 ),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/N5 ),
    .O(\VCM1/vr_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \HCM1/hdebc_mux00001  (
    .I0(\HCM1/cntrh [9]),
    .I1(\HCM1/cntrh [7]),
    .I2(\HCM1/N6 ),
    .O(\HCM1/hdebc_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \HCM1/hd_mux00001  (
    .I0(\HCM1/cntrh [9]),
    .I1(\HCM1/cntrh [7]),
    .I2(\HCM1/N6 ),
    .O(\HCM1/hd_mux0000 )
  );
  LUT3 #(
    .INIT ( 8'h82 ))
  \HCM1/hd_not00011  (
    .I0(\HCM1/N6 ),
    .I1(\HCM1/cntrh [7]),
    .I2(\HCM1/cntrh [9]),
    .O(\HCM1/hd_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \VCM1/vrs_not000131  (
    .I0(\VCM1/cntrv [7]),
    .I1(\VCM1/cntrv [8]),
    .I2(\VCM1/cntrv [5]),
    .I3(\VCM1/cntrv [6]),
    .O(\VCM1/N5 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \VCM1/vrs_not0001111  (
    .I0(\VCM1/cntrv [7]),
    .I1(\VCM1/cntrv [8]),
    .I2(\VCM1/cntrv [5]),
    .I3(\VCM1/cntrv [6]),
    .O(\VCM1/N6 )
  );
  LUT4 #(
    .INIT ( 16'h4440 ))
  \VCM1/vr_not00011  (
    .I0(\VCM1/cntrv [4]),
    .I1(\VCM1/N3 ),
    .I2(\VCM1/N6 ),
    .I3(\VCM1/N5 ),
    .O(\VCM1/vr_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \HCM1/hdeb_mux00001  (
    .I0(\HCM1/N3 ),
    .I1(\HCM1/cntrh [2]),
    .I2(\HCM1/cntrh [3]),
    .I3(\HCM1/cntrh [8]),
    .O(\HCM1/hdeb_mux0000 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \HCM1/hde_not0001121  (
    .I0(\HCM1/cntrh [5]),
    .I1(\HCM1/cntrh [6]),
    .I2(\HCM1/cntrh [0]),
    .I3(\HCM1/cntrh [1]),
    .O(\HCM1/N7 )
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \VCM1/vrsp_not00011  (
    .I0(\VCM1/N3 ),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/N6 ),
    .I3(\VCM1/N5 ),
    .O(\VCM1/vrsp_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \HCM1/hde_mux0000  (
    .I0(\HCM1/cntrh [2]),
    .I1(\HCM1/cntrh [4]),
    .I2(\HCM1/cntrh [7]),
    .I3(N2),
    .O(\HCM1/hde_mux0000_55 )
  );
  LUT4 #(
    .INIT ( 16'hEFFF ))
  \VCM1/vrs_not00014_SW0  (
    .I0(\VCM1/cntrv [9]),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/cntrv [1]),
    .I3(\VCM1/N5 ),
    .O(N7)
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \VCM1/vrs_not00014  (
    .I0(\VCM1/cntrv [0]),
    .I1(N7),
    .I2(\VCM1/cntrv [2]),
    .I3(\VCM1/cntrv [3]),
    .O(\VCM1/vrs_mux0000 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \HCM1/hde_not000111_SW0  (
    .I0(\HCM1/cntrh [6]),
    .I1(\HCM1/cntrh [4]),
    .I2(\HCM1/cntrh [5]),
    .I3(\HCM1/cntrh [9]),
    .O(N9)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \HCM1/hde_not000111  (
    .I0(\HCM1/cntrh [0]),
    .I1(\HCM1/cntrh [1]),
    .I2(\HCM1/cntrh [7]),
    .I3(N9),
    .O(\HCM1/N3 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \HCM1/hdeb_not000133  (
    .I0(\HCM1/cntrh [2]),
    .I1(\HCM1/cntrh [3]),
    .I2(\HCM1/hdeb_not000125_60 ),
    .O(\HCM1/hdeb_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  srst_cmp_eq000012 (
    .I0(\VCM1/cntrv [0]),
    .I1(\VCM1/cntrv [1]),
    .I2(\VCM1/cntrv [2]),
    .I3(\VCM1/cntrv [3]),
    .O(srst_cmp_eq000012_250)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  srst_cmp_eq000038 (
    .I0(srst_cmp_eq000012_250),
    .I1(srst_cmp_eq000030_251),
    .O(srst)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  sync_out_11 (
    .I0(stch_252),
    .I1(\VSYNC/q_195 ),
    .O(sync_out_1_OBUF_260)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_frame_xor<1>11  (
    .I0(frame[1]),
    .I1(frame[0]),
    .O(Mcount_frame1)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  Mmux_stch_mux000011 (
    .I0(sync_in_1_IBUF_255),
    .I1(sync_in_2_IBUF_258),
    .I2(delay_st_FSM_FFd1_234),
    .O(stch_mux0000)
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \Mcount_frame_xor<2>11  (
    .I0(frame[2]),
    .I1(frame[0]),
    .I2(frame[1]),
    .O(Mcount_frame2)
  );
  LUT4 #(
    .INIT ( 16'hAA20 ))
  \delay_st_FSM_FFd1-In1  (
    .I0(sync_in_1_IBUF_255),
    .I1(delay_st_FSM_FFd2_236),
    .I2(sync_in_2_IBUF_258),
    .I3(delay_st_FSM_FFd1_234),
    .O(\delay_st_FSM_FFd1-In )
  );
  LUT4 #(
    .INIT ( 16'h5455 ))
  \Mcount_frame_xor<0>11  (
    .I0(frame[0]),
    .I1(frame[1]),
    .I2(frame[2]),
    .I3(frame[3]),
    .O(Mcount_frame)
  );
  LUT4 #(
    .INIT ( 16'hFD75 ))
  \delay_st_FSM_FFd2-In1  (
    .I0(sync_in_1_IBUF_255),
    .I1(sync_in_2_IBUF_258),
    .I2(delay_st_FSM_FFd2_236),
    .I3(delay_st_FSM_FFd1_234),
    .O(\delay_st_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'h6AA8 ))
  \Mcount_frame_xor<3>11  (
    .I0(frame[3]),
    .I1(frame[0]),
    .I2(frame[1]),
    .I3(frame[2]),
    .O(Mcount_frame3)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  sync_out_2r1 (
    .I0(wdata_cmp_eq0000),
    .I1(sync_in_1_IBUF_255),
    .O(sync_out_2_OBUF_262)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<7>1  (
    .I0(N1),
    .I1(cdata[7]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_7_OBUF_190)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<6>1  (
    .I0(N1),
    .I1(cdata[6]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_6_OBUF_189)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<5>1  (
    .I0(N1),
    .I1(cdata[5]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_5_OBUF_188)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<4>1  (
    .I0(N1),
    .I1(cdata[4]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_4_OBUF_187)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<3>1  (
    .I0(N1),
    .I1(cdata[3]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_3_OBUF_186)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<2>1  (
    .I0(N1),
    .I1(cdata[2]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_2_OBUF_185)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<1>1  (
    .I0(N1),
    .I1(cdata[1]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_1_OBUF_184)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \RED/dout<0>21  (
    .I0(sgnl_248),
    .I1(\HDATO/q_63 ),
    .I2(\VDATO/q_153 ),
    .O(N1)
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \RED/dout<0>1  (
    .I0(N1),
    .I1(cdata[0]),
    .I2(wdata_cmp_eq0000),
    .O(VGA_R_0_OBUF_183)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  wdata_cmp_eq00001 (
    .I0(frame[3]),
    .I1(frame[0]),
    .I2(frame[1]),
    .I3(frame[2]),
    .O(wdata_cmp_eq0000)
  );
  LUT4 #(
    .INIT ( 16'hFE00 ))
  \HCM1/cntrh_not0001  (
    .I0(\HCM1/cntrh [5]),
    .I1(\HCM1/cntrh [6]),
    .I2(\HCM1/cntrh [7]),
    .I3(N11),
    .O(\HCM1/cntrh_not0001_49 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \cdata_mux0000<6>11  (
    .I0(cosd2[7]),
    .I1(cosd[7]),
    .I2(Madd_cdata_index0000),
    .O(cdata_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'h71 ))
  \cdata_mux0000<7>11  (
    .I0(cosd[7]),
    .I1(cosd2[7]),
    .I2(Madd_cdata_index0000),
    .O(cdata_mux0000[7])
  );
  IBUF   sync_in_1_IBUF (
    .I(sync_in_1),
    .O(sync_in_1_IBUF_255)
  );
  IBUF   sync_in_2_IBUF (
    .I(sync_in_2),
    .O(sync_in_2_IBUF_258)
  );
  OBUF   VGA_CLK_OBUF (
    .I(clk_25m1),
    .O(VGA_CLK)
  );
  OBUF   VGA_HS_OBUF (
    .I(\HSYNC/q_66 ),
    .O(VGA_HS)
  );
  OBUF   sync_out_1_OBUF (
    .I(sync_out_1_OBUF_260),
    .O(sync_out_1)
  );
  OBUF   VGA_VS_OBUF (
    .I(\VSYNC/q_1_196 ),
    .O(VGA_VS)
  );
  OBUF   sync_out_2_OBUF (
    .I(sync_out_2_OBUF_262),
    .O(sync_out_2)
  );
  OBUF   VGA_BLANK_N_OBUF (
    .I(VGA_SYNC_N_OBUF_192),
    .O(VGA_BLANK_N)
  );
  OBUF   psave_n_OBUF (
    .I(VGA_SYNC_N_OBUF_192),
    .O(psave_n)
  );
  OBUF   VGA_SYNC_N_OBUF (
    .I(VGA_SYNC_N_OBUF_192),
    .O(VGA_SYNC_N)
  );
  OBUF   iso_gnd_OBUF (
    .I(iso_gnd_OBUF_243),
    .O(iso_gnd)
  );
  OBUF   VGA_B_7_OBUF (
    .I(VGA_R_7_OBUF_190),
    .O(VGA_B[7])
  );
  OBUF   VGA_B_6_OBUF (
    .I(VGA_R_6_OBUF_189),
    .O(VGA_B[6])
  );
  OBUF   VGA_B_5_OBUF (
    .I(VGA_R_5_OBUF_188),
    .O(VGA_B[5])
  );
  OBUF   VGA_B_4_OBUF (
    .I(VGA_R_4_OBUF_187),
    .O(VGA_B[4])
  );
  OBUF   VGA_B_3_OBUF (
    .I(VGA_R_3_OBUF_186),
    .O(VGA_B[3])
  );
  OBUF   VGA_B_2_OBUF (
    .I(VGA_R_2_OBUF_185),
    .O(VGA_B[2])
  );
  OBUF   VGA_B_1_OBUF (
    .I(VGA_R_1_OBUF_184),
    .O(VGA_B[1])
  );
  OBUF   VGA_B_0_OBUF (
    .I(VGA_R_0_OBUF_183),
    .O(VGA_B[0])
  );
  OBUF   VGA_G_7_OBUF (
    .I(VGA_R_7_OBUF_190),
    .O(VGA_G[7])
  );
  OBUF   VGA_G_6_OBUF (
    .I(VGA_R_6_OBUF_189),
    .O(VGA_G[6])
  );
  OBUF   VGA_G_5_OBUF (
    .I(VGA_R_5_OBUF_188),
    .O(VGA_G[5])
  );
  OBUF   VGA_G_4_OBUF (
    .I(VGA_R_4_OBUF_187),
    .O(VGA_G[4])
  );
  OBUF   VGA_G_3_OBUF (
    .I(VGA_R_3_OBUF_186),
    .O(VGA_G[3])
  );
  OBUF   VGA_G_2_OBUF (
    .I(VGA_R_2_OBUF_185),
    .O(VGA_G[2])
  );
  OBUF   VGA_G_1_OBUF (
    .I(VGA_R_1_OBUF_184),
    .O(VGA_G[1])
  );
  OBUF   VGA_G_0_OBUF (
    .I(VGA_R_0_OBUF_183),
    .O(VGA_G[0])
  );
  OBUF   VGA_R_7_OBUF (
    .I(VGA_R_7_OBUF_190),
    .O(VGA_R[7])
  );
  OBUF   VGA_R_6_OBUF (
    .I(VGA_R_6_OBUF_189),
    .O(VGA_R[6])
  );
  OBUF   VGA_R_5_OBUF (
    .I(VGA_R_5_OBUF_188),
    .O(VGA_R[5])
  );
  OBUF   VGA_R_4_OBUF (
    .I(VGA_R_4_OBUF_187),
    .O(VGA_R[4])
  );
  OBUF   VGA_R_3_OBUF (
    .I(VGA_R_3_OBUF_186),
    .O(VGA_R[3])
  );
  OBUF   VGA_R_2_OBUF (
    .I(VGA_R_2_OBUF_185),
    .O(VGA_R[2])
  );
  OBUF   VGA_R_1_OBUF (
    .I(VGA_R_1_OBUF_184),
    .O(VGA_R[1])
  );
  OBUF   VGA_R_0_OBUF (
    .I(VGA_R_0_OBUF_183),
    .O(VGA_R[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  clk_25m (
    .C(clk_50),
    .D(VGA_SYNC_N_OBUF_192),
    .R(clk_25m1),
    .Q(clk_25m1)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<8>_rt  (
    .I0(\HCM1/cntrh [8]),
    .O(\HCM1/Mcount_cntrh_cy<8>_rt_23 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<7>_rt  (
    .I0(\HCM1/cntrh [7]),
    .O(\HCM1/Mcount_cntrh_cy<7>_rt_21 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<6>_rt  (
    .I0(\HCM1/cntrh [6]),
    .O(\HCM1/Mcount_cntrh_cy<6>_rt_19 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<5>_rt  (
    .I0(\HCM1/cntrh [5]),
    .O(\HCM1/Mcount_cntrh_cy<5>_rt_17 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<4>_rt  (
    .I0(\HCM1/cntrh [4]),
    .O(\HCM1/Mcount_cntrh_cy<4>_rt_15 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<3>_rt  (
    .I0(\HCM1/cntrh [3]),
    .O(\HCM1/Mcount_cntrh_cy<3>_rt_13 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<2>_rt  (
    .I0(\HCM1/cntrh [2]),
    .O(\HCM1/Mcount_cntrh_cy<2>_rt_11 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_cy<1>_rt  (
    .I0(\HCM1/cntrh [1]),
    .O(\HCM1/Mcount_cntrh_cy<1>_rt_9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<8>_rt  (
    .I0(\VCM1/cntrv [8]),
    .O(\VCM1/Mcount_cntrv_cy<8>_rt_112 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<7>_rt  (
    .I0(\VCM1/cntrv [7]),
    .O(\VCM1/Mcount_cntrv_cy<7>_rt_110 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<6>_rt  (
    .I0(\VCM1/cntrv [6]),
    .O(\VCM1/Mcount_cntrv_cy<6>_rt_108 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<5>_rt  (
    .I0(\VCM1/cntrv [5]),
    .O(\VCM1/Mcount_cntrv_cy<5>_rt_106 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<4>_rt  (
    .I0(\VCM1/cntrv [4]),
    .O(\VCM1/Mcount_cntrv_cy<4>_rt_104 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<3>_rt  (
    .I0(\VCM1/cntrv [3]),
    .O(\VCM1/Mcount_cntrv_cy<3>_rt_102 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<2>_rt  (
    .I0(\VCM1/cntrv [2]),
    .O(\VCM1/Mcount_cntrv_cy<2>_rt_100 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_cy<1>_rt  (
    .I0(\VCM1/cntrv [1]),
    .O(\VCM1/Mcount_cntrv_cy<1>_rt_98 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HCM1/Mcount_cntrh_xor<9>_rt  (
    .I0(\HCM1/cntrh [9]),
    .O(\HCM1/Mcount_cntrh_xor<9>_rt_25 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \VCM1/Mcount_cntrv_xor<9>_rt  (
    .I0(\VCM1/cntrv [9]),
    .O(\VCM1/Mcount_cntrv_xor<9>_rt_114 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  srst_cmp_eq000030_SW0 (
    .I0(\VCM1/cntrv [7]),
    .I1(\VCM1/cntrv [8]),
    .I2(\VCM1/cntrv [9]),
    .O(N15)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  srst_cmp_eq000030 (
    .I0(\VCM1/cntrv [4]),
    .I1(\VCM1/cntrv [5]),
    .I2(\VCM1/cntrv [6]),
    .I3(N15),
    .O(srst_cmp_eq000030_251)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \VCM1/cntrv_not000124_SW0  (
    .I0(\VCM1/cntrv [6]),
    .I1(\VCM1/cntrv [7]),
    .I2(\VCM1/cntrv [8]),
    .I3(\VCM1/cntrv_not00018_139 ),
    .O(N17)
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \VCM1/cntrv_not000124  (
    .I0(\VCM1/cntrv [9]),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/cntrv [5]),
    .I3(N17),
    .O(\VCM1/cntrv_not0001 )
  );
  LUT4 #(
    .INIT ( 16'hFF10 ))
  \HCM1/hde_not00011  (
    .I0(\HCM1/cntrh [2]),
    .I1(\HCM1/cntrh [3]),
    .I2(\HCM1/hdeb_not000125_60 ),
    .I3(\HCM1/hde_mux0000_55 ),
    .O(\HCM1/hde_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \HCM1/hde_mux0000_SW0  (
    .I0(\HCM1/cntrh [8]),
    .I1(\HCM1/cntrh [3]),
    .I2(\HCM1/cntrh [9]),
    .I3(\HCM1/N7 ),
    .O(N2)
  );
  MUXF5   \HCM1/hdeb_not000125  (
    .I0(N19),
    .I1(N20),
    .S(\HCM1/cntrh [7]),
    .O(\HCM1/hdeb_not000125_60 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \HCM1/hdeb_not000125_F  (
    .I0(\HCM1/N7 ),
    .I1(\HCM1/cntrh [8]),
    .I2(\HCM1/cntrh [4]),
    .I3(\HCM1/cntrh [9]),
    .O(N19)
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \HCM1/hdeb_not000125_G  (
    .I0(\HCM1/cntrh [8]),
    .I1(\HCM1/cntrh [0]),
    .I2(\HCM1/cntrh [1]),
    .I3(N9),
    .O(N20)
  );
  BUFG   clk_25m_BUFG (
    .I(clk_25m1),
    .O(clk_25m_215)
  );
  INV   \HCM1/Mcount_cntrh_lut<0>_INV_0  (
    .I(\HCM1/cntrh [0]),
    .O(\HCM1/Mcount_cntrh_lut [0])
  );
  INV   \VCM1/Mcount_cntrv_lut<0>_INV_0  (
    .I(\VCM1/cntrv [0]),
    .O(\VCM1/Mcount_cntrv_lut [0])
  );
  INV   VGA_VS_inv1_INV_0 (
    .I(\VSYNC/q_195 ),
    .O(VGA_VS_inv)
  );
  INV   sync_in_1_inv1_INV_0 (
    .I(sync_in_1_IBUF_255),
    .O(sync_in_1_inv)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \HCM1/hd_mux0000111  (
    .I0(\HCM1/cntrh [2]),
    .I1(\HCM1/cntrh [4]),
    .I2(\HCM1/cntrh [8]),
    .I3(\HCM1/cntrh [3]),
    .O(\HCM1/hd_mux000011 )
  );
  MUXF5   \HCM1/hd_mux000011_f5  (
    .I0(iso_gnd_OBUF_243),
    .I1(\HCM1/hd_mux000011 ),
    .S(\HCM1/N7 ),
    .O(\HCM1/N6 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \VCM1/vrs_not000121  (
    .I0(\VCM1/cntrv [0]),
    .I1(\VCM1/cntrv [3]),
    .I2(\VCM1/cntrv [2]),
    .I3(\VCM1/cntrv [1]),
    .O(\VCM1/vrs_not00012 )
  );
  MUXF5   \VCM1/vrs_not00012_f5  (
    .I0(\VCM1/vrs_not00012 ),
    .I1(iso_gnd_OBUF_243),
    .S(\VCM1/cntrv [9]),
    .O(\VCM1/N3 )
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \VCM1/vrs_not00011  (
    .I0(\VCM1/N3 ),
    .I1(\VCM1/cntrv [4]),
    .I2(\VCM1/N6 ),
    .I3(\VCM1/N5 ),
    .O(\VCM1/vrs_not00011_146 )
  );
  MUXF5   \VCM1/vrs_not0001_f5  (
    .I0(\VCM1/vrs_not00011_146 ),
    .I1(VGA_SYNC_N_OBUF_192),
    .S(\VCM1/vrs_mux0000 ),
    .O(\VCM1/vrs_not0001 )
  );
  LUT2_L #(
    .INIT ( 4'h8 ))
  \HCM1/cntrh_not0001_SW0  (
    .I0(\HCM1/cntrh [8]),
    .I1(\HCM1/cntrh [9]),
    .LO(N11)
  );
  LUT4_L #(
    .INIT ( 16'h8000 ))
  \VCM1/cntrv_not00018  (
    .I0(\VCM1/cntrv [0]),
    .I1(\VCM1/cntrv [1]),
    .I2(\VCM1/cntrv [2]),
    .I3(\VCM1/cntrv [3]),
    .LO(\VCM1/cntrv_not00018_139 )
  );
  FDRE   \VSYNC/q_1  (
    .C(clk_25m_215),
    .CE(\VSYNC/q_not0001 ),
    .D(\VSYNC/q_mux0000 ),
    .R(iso_gnd_OBUF_243),
    .Q(\VSYNC/q_1_196 )
  );
  ddsc   DDSM1 (
    .sclr(srst),
    .clk(clk_25m_215),
    .pinc_in({iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, VGA_SYNC_N_OBUF_192, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, 
VGA_SYNC_N_OBUF_192, VGA_SYNC_N_OBUF_192}),
    .cosine({cosd[7], cosd[6], cosd[5], cosd[4], cosd[3], cosd[2], cosd[1], cosd[0]}),
    .phase_out({\NLW_DDSM1_phase_out<31>_UNCONNECTED , \NLW_DDSM1_phase_out<30>_UNCONNECTED , \NLW_DDSM1_phase_out<29>_UNCONNECTED , 
\NLW_DDSM1_phase_out<28>_UNCONNECTED , \NLW_DDSM1_phase_out<27>_UNCONNECTED , \NLW_DDSM1_phase_out<26>_UNCONNECTED , 
\NLW_DDSM1_phase_out<25>_UNCONNECTED , \NLW_DDSM1_phase_out<24>_UNCONNECTED , \NLW_DDSM1_phase_out<23>_UNCONNECTED , 
\NLW_DDSM1_phase_out<22>_UNCONNECTED , \NLW_DDSM1_phase_out<21>_UNCONNECTED , \NLW_DDSM1_phase_out<20>_UNCONNECTED , 
\NLW_DDSM1_phase_out<19>_UNCONNECTED , \NLW_DDSM1_phase_out<18>_UNCONNECTED , \NLW_DDSM1_phase_out<17>_UNCONNECTED , 
\NLW_DDSM1_phase_out<16>_UNCONNECTED , \NLW_DDSM1_phase_out<15>_UNCONNECTED , \NLW_DDSM1_phase_out<14>_UNCONNECTED , 
\NLW_DDSM1_phase_out<13>_UNCONNECTED , \NLW_DDSM1_phase_out<12>_UNCONNECTED , \NLW_DDSM1_phase_out<11>_UNCONNECTED , 
\NLW_DDSM1_phase_out<10>_UNCONNECTED , \NLW_DDSM1_phase_out<9>_UNCONNECTED , \NLW_DDSM1_phase_out<8>_UNCONNECTED , 
\NLW_DDSM1_phase_out<7>_UNCONNECTED , \NLW_DDSM1_phase_out<6>_UNCONNECTED , \NLW_DDSM1_phase_out<5>_UNCONNECTED , \NLW_DDSM1_phase_out<4>_UNCONNECTED 
, \NLW_DDSM1_phase_out<3>_UNCONNECTED , \NLW_DDSM1_phase_out<2>_UNCONNECTED , \NLW_DDSM1_phase_out<1>_UNCONNECTED , 
\NLW_DDSM1_phase_out<0>_UNCONNECTED }),
    .poff_in({phsr1[31], phsr1[30], phsr1[29], iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243})
  );
  ddsc   DDSM2 (
    .sclr(srst),
    .clk(clk_25m_215),
    .pinc_in({iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
VGA_SYNC_N_OBUF_192, iso_gnd_OBUF_243}),
    .cosine({cosd2[7], cosd2[6], cosd2[5], cosd2[4], cosd2[3], cosd2[2], cosd2[1], cosd2[0]}),
    .phase_out({\NLW_DDSM2_phase_out<31>_UNCONNECTED , \NLW_DDSM2_phase_out<30>_UNCONNECTED , \NLW_DDSM2_phase_out<29>_UNCONNECTED , 
\NLW_DDSM2_phase_out<28>_UNCONNECTED , \NLW_DDSM2_phase_out<27>_UNCONNECTED , \NLW_DDSM2_phase_out<26>_UNCONNECTED , 
\NLW_DDSM2_phase_out<25>_UNCONNECTED , \NLW_DDSM2_phase_out<24>_UNCONNECTED , \NLW_DDSM2_phase_out<23>_UNCONNECTED , 
\NLW_DDSM2_phase_out<22>_UNCONNECTED , \NLW_DDSM2_phase_out<21>_UNCONNECTED , \NLW_DDSM2_phase_out<20>_UNCONNECTED , 
\NLW_DDSM2_phase_out<19>_UNCONNECTED , \NLW_DDSM2_phase_out<18>_UNCONNECTED , \NLW_DDSM2_phase_out<17>_UNCONNECTED , 
\NLW_DDSM2_phase_out<16>_UNCONNECTED , \NLW_DDSM2_phase_out<15>_UNCONNECTED , \NLW_DDSM2_phase_out<14>_UNCONNECTED , 
\NLW_DDSM2_phase_out<13>_UNCONNECTED , \NLW_DDSM2_phase_out<12>_UNCONNECTED , \NLW_DDSM2_phase_out<11>_UNCONNECTED , 
\NLW_DDSM2_phase_out<10>_UNCONNECTED , \NLW_DDSM2_phase_out<9>_UNCONNECTED , \NLW_DDSM2_phase_out<8>_UNCONNECTED , 
\NLW_DDSM2_phase_out<7>_UNCONNECTED , \NLW_DDSM2_phase_out<6>_UNCONNECTED , \NLW_DDSM2_phase_out<5>_UNCONNECTED , \NLW_DDSM2_phase_out<4>_UNCONNECTED 
, \NLW_DDSM2_phase_out<3>_UNCONNECTED , \NLW_DDSM2_phase_out<2>_UNCONNECTED , \NLW_DDSM2_phase_out<1>_UNCONNECTED , 
\NLW_DDSM2_phase_out<0>_UNCONNECTED }),
    .poff_in({phsr1[30], phsr1[29], iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, 
iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243, iso_gnd_OBUF_243})
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
