`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:46:09 11/30/2015 
// Design Name: 
// Module Name:    hdmi_top 
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
module hdmi_top(
					clock_50,
					TMDSp,
					TMDSn,
					TMDSp_clock,
					TMDSn_clock,
					LED
    );

/**** I\O List ****/
input clock_50;

output [2:0] TMDSp, TMDSn;
output TMDSp_clock, TMDSn_clock;
output [0:7] LED;
/**** Reg List ****/
reg clock_25r;
reg [9:0] contX;		//0~800
reg [9:0] contY;		//0~525
reg syncH, syncV;
reg actvA;

reg [3:0] TMDS_modulo;
reg shift_LOAD;
reg [9:0] TMDS_shift_red, TMDS_shift_green, TMDS_shift_blue;

reg [31:0] cntr;
/**** Wire List ****/
reg [7:0] red, green, blue;
wire [7:0] W, A;
wire clock_25, clock_250, clock_50a;
wire [9:0] TMDS_red, TMDS_green, TMDS_blue;

/****
##### RTL code
****/
initial
begin
		clock_25r <= 0;
		contX <= 0; contY <= 0;
		syncH <= 0; syncV <= 0;
		actvA <= 0;
		
		TMDS_modulo <= 0;
		shift_LOAD <= 0;
		TMDS_shift_red <= 0; TMDS_shift_green <= 0; TMDS_shift_blue <= 0;
		
		cntr <= 0;
end

always@(posedge clock_50a)
		cntr <= cntr + 1;
assign LED = cntr[29:23];

pll	MIST0(// Clock in ports
				.CLK_IN1				(clock_50),
				// Clock out ports
				.CLK_OUT1			(clock_50a),
				.CLK_OUT2			(clock_250)
 );
always@(posedge clock_50a)
		clock_25r <= ~clock_25r;
assign clock_25 = clock_25r;


always@(posedge clock_25)
begin
		if(contX == 799)
				contX = 0;
		else
				contX = contX + 1;
end

always@(posedge clock_25)
begin
		if(contX == 799)
		begin
				if(contY == 524)
						contY = 0;
				else
						contY = contY + 1;
		end
		else
				contY = contY;
end

always@(posedge clock_25)
		syncH <= (contX >= 656) && (contX < 752);
always@(posedge clock_25)
		syncV <= (contY >= 490) && (contY < 492);
always@(posedge clock_25)
		actvA <= (contX < 640) && (contY < 480);
//*********** Pattern to Display ****************
/*assign red = {contX[5:0] & {6{contY[4:3] == ~contX[4:3]}}, 2'b00};
assign green = contX[7:0] & {8{contY[6]}};
assign blue = contY[7:0];*/
assign W = {8{contX[7:0]==contY[7:0]}};
assign A = {8{contX[7:5]==3'h2 && contY[7:5]==3'h2}};

always @(posedge clock_25) red <= ({contX[5:0] & {6{contY[4:3]==~contX[4:3]}}, 2'b00} | W) & ~A;
always @(posedge clock_25) green <= (contX[7:0] & {8{contY[6]}} | W) & ~A;
always @(posedge clock_25) blue <= contY[7:0] | W | A;
//***********************************************
TMDS_encoder  iRED  (.clk(clock_25), .VD(red),   .CD(2'b00), 			 .VDE(actvA), .TMDS(TMDS_red));
TMDS_encoder  iGREEN(.clk(clock_25), .VD(green), .CD(2'b00), 			 .VDE(actvA), .TMDS(TMDS_green));
TMDS_encoder  iBLUE (.clk(clock_25), .VD(blue),  .CD({syncV, syncH}), .VDE(actvA), .TMDS(TMDS_blue));

always@(posedge clock_250)
begin
		TMDS_shift_red   <= shift_LOAD ? TMDS_red   : TMDS_shift_red[9:1];
		TMDS_shift_green <= shift_LOAD ? TMDS_green : TMDS_shift_green[9:1];
		TMDS_shift_blue  <= shift_LOAD ? TMDS_blue  : TMDS_shift_blue[9:1];
		
		TMDS_modulo <= (TMDS_modulo == 9) ? 4'd0 : TMDS_modulo + 1;
end
always@(posedge clock_250)
		shift_LOAD <= (TMDS_modulo == 9);
//*********** Differential Output ***************
OBUFDS mRED  (.I(TMDS_shift_red[0]),   .O(TMDSp[2]), .OB(TMDSn[2]));
OBUFDS mGREEN(.I(TMDS_shift_green[0]), .O(TMDSp[1]), .OB(TMDSn[1]));
OBUFDS mBLUE (.I(TMDS_shift_blue[0]),  .O(TMDSp[0]), .OB(TMDSn[0]));
OBUFDS mCLOCK(.I(clock_25), .O(TMDSp_clock), .OB(TMDSn_clock));
endmodule
