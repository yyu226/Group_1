`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:07 05/10/2015 
// Design Name: 
// Module Name:    vga_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
			//////////// CLOCK //////////
	CLOCK_50,

	//////////// HDMI //////////
	TMDS_POSITIVE,
	TMDS_NEGTIVE,
	TMDS_CLOCK_P,
	TMDS_CLOCK_N,
	
	//iso_gnd
	DRAM_CLK,
	SA,
	BA,
	CS_N,
	CKE,
	RAS_N,
	CAS_N,
	WE_N,
	UDQM,
	LDQM,
	DQ,
	
	
	SCK,
	MISO,
	MOSI,
	CS,
	//CS_FLASH,
	
	LED
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 	CLOCK_50;

//////////// HDMI //////////
output [2:0] TMDS_POSITIVE;
output [2:0] TMDS_NEGTIVE;
output       TMDS_CLOCK_P;
output	  	 TMDS_CLOCK_N;

/////////// SDRAM /////////
output DRAM_CLK;
output [12:0] SA;				//address output
output [1:0] BA;
output CS_N;
output CKE;
output RAS_N;
output CAS_N;
output WE_N;
output UDQM;
output LDQM;
inout [15:0] DQ;

/////////// SD CARD ////////
output SCK;
input MISO;
output MOSI;
output CS;
//output CS_FLASH;

////////// LEDs ///////////
output [7:0] LED;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [7:0] red, green, blue;
reg clock_25m;
reg [31:0] cntr;

wire clock_45M, clock_50M, clock_250M;
wire clk_100ld, clk_sdram;
wire CLOCK_HDMI;
wire reset;

wire [15:0] vdata;

wire goo, vSYNC;

wire [7:0] SDATA;						//wire [0:15] SDATA;

wire NR;
wire RW_SYNC;
wire wr_clk;
//=======================================================
//  Structural coding
//=======================================================
 
 pll PLL0(
			.CLK_IN1		(CLOCK_50),
			
			.CLK_OUT1	(clk_100ld),				//DRAM itself clk_100
			.CLK_OUT2	(clk_sdram),					//DRAM controller, -150degree leading
			.CLK_OUT3	(clock_250M),				//HDMI high
			.CLK_OUT4	(clock_50M),				//HDMI low
			.CLK_OUT5	(clock_45M)					//microSD
			);
ODDR2 SDR(
			.Q				(DRAM_CLK),
			.C0			(clk_sdram),
			.C1			(~clk_sdram),
			.CE			(1'b1),
			.D0			(1'b1),
			.D1			(1'b0),
			.R				(1'b0),
			.S				(1'b0)
		);
	 
always@(posedge clock_50M)
	clock_25m = ~clock_25m;

assign clock_25M = clock_25m;
	
assign CLOCK_HDMI = ~clock_25m;



/*VGA_Controller VCTR(	//	Host Side
						.iRed					(vdata[7:0]),
						.iGreen				(vdata[7:0]),
						.iBlue				(vdata[7:0]),
						.oRequest			(goo),
						//	VGA Side
						.oVGA_R				(VGA_R),
						.oVGA_G				(VGA_G),
						.oVGA_B				(VGA_B),
						.oVGA_H_SYNC		(VGA_HS),
						.oVGA_V_SYNC		(VGA_VS),
						.oVGA_SYNC			(),
						.oVGA_BLANK			(),

						//	Control Signal
						.iCLK					(clk_25),
						.iRST_N				(1'b1),
						.iZOOM_MODE_SW		()
							);*/
hdmi_top  HDMI_PORT2(
					.clock_pixel			(clock_25M),
					.clock_TMDS				(clock_250M),
					.iRed						(vdata[7:0]),
					.iGreen					(vdata[7:0]),
					.iBlue					(vdata[7:0]),
					
					.oRequest				(goo),
					.SYNC_V					(vSYNC),
					.TMDSp					(TMDS_POSITIVE),
					.TMDSn					(TMDS_NEGTIVE),
					.TMDSp_clock			(TMDS_CLOCK_P),
					.TMDSn_clock			(TMDS_CLOCK_N),
					.LED						()
    );
always@(posedge clock_50M)
		cntr <= cntr + 1;
assign LED[7:6] = {cntr[24], ~cntr[24]};
assign LED[2:0] = {cntr[25], ~cntr[25], cntr[25]};
/**************************Interface with SDR SDRAM**********************
***********A FIFO with 25Mhz clock freq.
***********FIFO depth is 1024, only 640 of them are being used
***********data width is 24-bit
*/
			  

/***************SDR SDRAM controller submodule********
*need appropriate inputs sequence
*
*/
sdram_top  SDRAMIF(
	 .RESET_N				(1'b1),
	 .CLK						(clk_100ld),

	 .WR_ADDR				(0),
	 .WR_MAX_ADDR			(307200*6),
	 .WR_LENGTH				(8'd32),							//8'd32
	 .WR_CLK					(wr_clk),
	 .WR_DATA				({8'h00, SDATA}),
	 .wr						(NR),
	 .RW_SYNC				(RW_SYNC),

	 .RD					(vSYNC),				//from vga, timing control FRAME_SYNC
	 .RDR					(goo),					//ROW_SYNC
		//	FIFO Read Side 1
	 .RD1_ADDR			(0),						//BASE ADDRESS
	 .RD1_MAX_ADDR		(307200*6),
	 .RD1_LENGTH		(8'd64),
	 .RD1_CLK			(CLOCK_HDMI),
		//	FIFO Read Side 2
	 .RD2_ADDR			(0),
	 .RD2_MAX_ADDR		(307200*6),
	 .RD2_LENGTH		(8'd64),
	 .RD2_CLK			(CLOCK_HDMI),
	 
	 .DATA_TO_VGA		(vdata),
	 
    .SA					(SA),				//address output
    .BA					(BA),
    .CS_N				(CS_N),
    .CKE					(CKE),
    .RAS_N				(RAS_N),
    .CAS_N				(CAS_N),
    .WE_N				(WE_N),
    .DQ					(DQ),
	 .DQM					({UDQM, LDQM})
    );

spi_host  IS0(
					.cryst				(clock_45M),
					.sck					(SCK),
					.miso					(MISO),
					.mosi					(MOSI),
					.cs					(CS),
					.cs_flash			(/*CS_FLASH*/),		//ONLY available for XULA-2
					.rLED					(LED[3]),
					.gLED					(LED[4]),
					.yLED					(LED[5]),
					.data					(SDATA),
					.wr_avl				(NR),
					.rw_sync				(RW_SYNC),
					.wr_clk				(wr_clk)
    );
endmodule
