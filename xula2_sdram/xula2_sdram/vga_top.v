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
module vga_top(
			//////////// CLOCK //////////
	CLOCK_12,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,
	
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
	DQ
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_12;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;
//output led;
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

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [7:0] red, green, blue;
reg we1, we2, re1, re2;

wire hon, von;
wire d, de, deb, debc;
wire r, rs, rsp, rspq;
wire rover;
wire [9:0] coln, rown;

wire clk_50, clk_50i;
wire clk_25;
wire clk_100ld;
wire reset;

wire VGA_CLK;
wire [15:0] vdata;

reg  go;
wire goo;
wire DLY_RST_0, DLY_RST_2;
wire VGA_BLANK;

wire [12:0] wH_Cont;
reg [7:0] Red, Green, Blue;
//=======================================================
//  Structural coding
//=======================================================
dcm DCM0(
  .CLK_IN1			(CLOCK_12),

  .CLK_OUT1			(clk_50i),
  .CLK_OUT2			(clk_50)
 );
 
 pll PLL0(
			.CLK_IN1		(clk_50),
			
			.CLK_OUT1	(clk_100ld),				//for DRAM Controller,
			.CLK_OUT2	(DRAM_CLK),					//for DRAM
			.CLK_OUT3   (clk_25)
			);

	
assign VGA_CLK = ~clk_25;

assign	VGA_BLANK_N = 1'b1;
assign	VGA_SYNC_N = 1'b1;
//assign 	reset = 1'b0;
//assign iso_gnd = 1'b0;

/*always@(posedge clk_25)				//cosd, cosd2
begin
	case ({cosd[7], cosd2[7]})
		2'b00:
					cdata = 128 + (cosd[6:0] + cosd2[6:0])/2;
		2'b01:
					cdata = 64 + (cosd[6:0] + cosd2[6:0])/2;
		2'b10:
					cdata = 64 + (cosd[6:0] + cosd2[6:0])/2;
		2'b11:
					cdata = (cosd[6:0] + cosd2[6:0])/2;
	endcase
end
*/
/*always@(posedge clk_25)
begin
		red <= vdata[15:8];
		green <= 0;
		blue <= vdata[7:0];
end

//Starting point syncronization
always@(posedge clk_25)
begin
		if(rown < 480)
				go = 1;
		else
				go = 0;
end
always@(posedge clk_25)
begin
		if((coln < 638) || (coln > 797))
				goo = 1;
		else
				goo = 0;
end

Hcounter HCM1(clk_25, reset, d, de, deb, debc, rover, coln);
Vcounter VCM1(rover, reset, r, rs, rsp, rspq, rown);

rsff HSYNC(clk_25, reset, de, deb, VGA_HS);					//D
rsff HDATO(clk_25, reset, d, debc, hon);						//O
rsff VSYNC(clk_25, reset, rs, rsp, VGA_VS);					//N
rsff VDATO(clk_25, reset, r, rspq, von);						//E
	
rgboen RED(VGA_R, hon, von, red);
rgboen GREEN(VGA_G, hon, von, green);
rgboen BLUE(VGA_B, hon, von, blue);*/

//IMPORTED VGA module
//@@@@@@@@@@@@@@@@@@@@
VGA_Controller(
						.iRed						(vdata[15:8]),				//Red   -> vdata[15:11]
						.iGreen					(8'h00),						//Green -> vdata[10:5]
						.iBlue					(vdata[7:0]),				//Blue  -> vdata[4:0]
						.oRequest				(goo),

						.oVGA_R					(VGA_R),
						.oVGA_G					(VGA_G),
						.oVGA_B					(VGA_B),
						.oVGA_H_SYNC			(VGA_HS),
						.oVGA_V_SYNC			(VGA_VS),
						.oVGA_SYNC				(),		//unused
						.oVGA_BLANK				(),		//unused
						
						.oH_Cont					(wH_Cont),

						.iCLK						(clk_25),
						.iRST_N					(DLY_RST_2),
						.iZOOM_MODE_SW			()
							);
always@(wH_Cont)
begin
		if(wH_Cont==35)
			go = 1;
		else
			go = 0;
end

/*always@(wH_Cont)
begin
		if(goo)
		begin
				if((wH_Cont<80))
				begin
						Red <= 8'h00;
						Green <= 8'h00;
						Blue <= 8'hff;
				end
				else if(wH_Cont<200)
				begin
						Red <= 8'h00;
						Green <= 8'h00;
						Blue <= 8'h00;
				end
				else if(wH_Cont<320)
				begin
						Red <= 8'hff;
						Green <= 8'h00;
						Blue <= 8'hff;
				end
				else if(wH_Cont<420)
				begin
						Red <= 8'hff;
						Green <= 8'h00;
						Blue <= 8'h00;
				end
				else if(wH_Cont<530)
				begin
						Red <= 8'h00;
						Green <= 8'h00;
						Blue <= 8'hff;
				end
				else
				begin
						Red <= 8'hff;
						Green <= 8'h00;
						Blue <= 8'h00;
				end
		end
		else begin
					Red <= 8'hff;
						Green <= 8'hff;
						Blue <= 8'hff;	
		end
end*/
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

	 .WR_ADDR				(0),				//24'h100000
	 .WR_MAX_ADDR			(307200),		//24'h100000 + 307200
	 .WR_LENGTH				(8'd64),
	 .WR_CLK					(clk_50i),

	 .RD					(VGA_VS),
	 .RDR					(goo),			//ROW_SYNC
		//	FIFO Read Side 1
	 .RD1_ADDR			(0),				//BASE ADDRESS
	 .RD1_MAX_ADDR		(307200),
	 .RD1_LENGTH		(8'd64),
	 .RD1_CLK			(VGA_CLK),
		//	FIFO Read Side 2
	 .RD2_ADDR			(0),
	 .RD2_MAX_ADDR		(307200),
	 .RD2_LENGTH		(8'd64),
	 .RD2_CLK			(VGA_CLK),
	 
	 .DATA_TO_VGA		(vdata),
	 .LOAD_DELAY		(!DLY_RST_0),
	 
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
	 
Reset_Delay	u2	(	.iCLK(clk_50),
						.iRST(1'b1),
						.oRST_0(DLY_RST_0),
						.oRST_1(),
						.oRST_2(DLY_RST_2),
						.oRST_3(),
						.oRST_4()
					);

endmodule
