
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module vga_test(

	//////////// CLOCK //////////
	CLOCK_66,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,
	//led,
	psave_n,
	
	sync_in_1,				//Trigger signal
	sync_in_2,				//FrameReady signal
	sync_out_1,
	sync_out_2,
	iso_gnd
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_66;

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
output psave_n;

input sync_in_1;				//isolated PIN4
input sync_in_2;				//PIN12
output sync_out_1;
output sync_out_2;
output iso_gnd;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg clk_25m;
reg [7:0] red, green, blue;
reg [7:0] cdata;

reg [2:0] frame;
reg [31:0] phsr1, phsr2;
reg sync_out_2r;
reg srst;
reg stch;					//switch of the frame trigger to the camera
reg sgnl;					//singal to indicate the status of RGB data -- active high
reg [1:0] delay_st;		//11: never happens
								//10: inactive -- no VGA data camera off
								//01: transition -- VGA data on camera off
								//00: camera on
wire [31:0] phasor1, phasor2;

wire reset;
wire hon, von;
wire d, de, deb, debc;
wire r, rs, rsp, rspq;
wire rover;
wire [9:0] coln, rown;

wire clk_25, clk_50;
wire [7:0] cosd;
wire [7:0] cosu;
wire [7:0] cosd2;
wire wrst;								//sclr
wire sync_in_1n;
wire [7:0] wdata;

initial
begin
	frame = 0;
	clk_25m = 0;
	srst = 0;
	delay_st = 2'b11;
end
//=======================================================
//  Structural coding
//=======================================================
dcmip DCMIP (
    .CLKIN_IN(CLOCK_66), 
    .RST_IN(1'b0), 
    .CLKDV_OUT(),								//open 
    .CLKFX_OUT(clk_50),
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .CLK2X_OUT(), 
    .LOCKED_OUT()
    );
	 
always@(posedge clk_50)
	clk_25m = ~clk_25m;

assign clk_25 = clk_25m;
	 

ddsc DDSM1(
		.sclr				(wrst),						//active high if not use 1'b0
		.clk				(clk_25), 
		.pinc_in			(32'd11339), 				//60Hz: 90194  120Hz:  180389
		.cosine			(cosd), 
		.phase_out		(),
		.poff_in			(phasor1)					//0
);

ddsc DDSM2(
		.sclr				(wrst),						//active high if not use 1'b0
		.clk				(clk_25),
		.pinc_in			(32'd90194),				//60Hz: 11339  120Hz:  22506
		.cosine			(cosd2),
		.phase_out		(),
		.poff_in			(phasor2)					//0
);
//To reset the sinusoidal signal at every Row1
always@(rown)
begin
	if(rown == 0)
		srst = 1;
	else
		srst = 0;
end
assign wrst = srst;
//End of synchronization
	
assign VGA_CLK = clk_25;
	
assign reset = 1'b0;

assign	VGA_BLANK_N = 1'b1;
assign	VGA_SYNC_N = 1'b1;

//assign led = 1'b0;
assign psave_n = 1'b1;
assign iso_gnd = 1'b0;

/*always@(rown)
begin
	if(rown < 120)
		begin
			red <= 8'hab;
			green <= 8'hcd;
			blue <= 8'hef;
		end
	else if(rown >= 120 && rown < 240)
		begin
			red <= 8'hef;
			green <= 8'hcd;
			blue <= 8'hab;
		end
	else if(rown >= 240 && rown <360)
		begin
			red <= 8'h00;
			green <= 8'h00;
			blue <= 8'hff;
		end
	else
		begin
			red <= 8'hff;
			green <= 8'h00;
			blue <= 8'h00;
		end
end*/
//assign cosu = (cosd[7] == 1) ? cosd[6:0] : cosd + 128;

always@(rown)
begin
		red <= cosu;
		green <= cosu;
		blue <= cosu;
end

always@(posedge clk_25)				//cosd, cosd2
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

always@(posedge VGA_VS)
begin
	if(sync_in_1 == 1'b1)
		sgnl = 1'b1;
	else
		sgnl = 1'b0;
end	
assign cosu = (sgnl == 1'b0) ? 8'b00000000 : cdata;				//cdata -> wdata

assign sync_in_1n = ~sync_in_1;
always@(negedge VGA_VS or negedge sync_in_1)				//negedge VGA_VS or negedge sync_in_1
begin
		if(sync_in_1 == 0)
			frame = 0;
		else if(sync_in_2 == 1)
			frame = frame + 1;
		else
			frame = frame;
end
always@(negedge VGA_VS or negedge sync_in_1)
begin
	if(sync_in_1 == 0)
		begin
			stch = 0;
			delay_st = 2'b11;
		end
	else if(sync_in_2 == 0)
		begin
			stch = 0;
			delay_st = delay_st;				//2'b11
		end
	else begin
		case ({sync_in_1, sync_in_2})
			2'b00: begin delay_st = 2'b11;  stch = 0;  end
			2'b01: begin delay_st = 2'b11;  stch = 0;  end
			2'b10: begin delay_st = delay_st;  stch = 0;  end				//delay_st = 2'b11
			2'b11: begin
					if(delay_st == 2'b11)
						begin
							delay_st = 2'b10;
							stch = 0;
						end
					else if(delay_st == 2'b10)
						begin
							delay_st = 2'b01;
							stch = 0;
						end
					else if(delay_st == 2'b01)
						begin
							delay_st = 2'b00;
							stch = 1;
						end
					else
						begin delay_st = 2'b00; stch = 1;  end
				    end
		endcase
	end
end

always@(posedge wrst)
begin
	begin
		case(frame)
			0:  begin
					phsr1 = 0;
					phsr2 = 0;
				 end
			1:  begin
					phsr1 = 32'd536870912;
					phsr2 = 32'd1073741824;
				 end
			2:  begin
					phsr1 = 32'd1073741824;
					phsr2 = 32'd2147483648;
				end
			3:  begin
					phsr1 = 32'd1610612736;
					phsr2 = 32'd3221225472;
				end
			4:  begin
					phsr1 = 32'd2147483648;
					phsr2 = 0;
				end
			5:  begin
					phsr1 = 32'd2684354560;
					phsr2 = 32'd1073741824;
				end
			6:  begin
					phsr1 = 32'd3221225472;
					phsr2 = 32'd2147483648;
				end
			7:  begin
					phsr1 = 32'd3758096384;
					phsr2 = 32'd3221225472;
				 end
		endcase
	end
end

assign phasor1 = phsr1;
assign phasor2 = phsr2;

Hcounter HCM1(clk_25, reset, d, de, deb, debc, rover, coln);
Vcounter VCM1(rover, reset, r, rs, rsp, rspq, rown);

rsff HSYNC(clk_25, reset, de, deb, VGA_HS);					//D
rsff HDATO(clk_25, reset, d, debc, hon);						//O
rsff VSYNC(clk_25, reset, rs, rsp, VGA_VS);					//N
rsff VDATO(clk_25, reset, r, rspq, von);						//E
	
rgboen RED(VGA_R, hon, von, red);
rgboen GREEN(VGA_G, hon, von, green);
rgboen BLUE(VGA_B, hon, von, blue);
/***Control Logic Between Camara and FPGA
****SYNC_IN & SYNC_OUT
****Communicate with the camara and the host machine
****One posedge @ each Vertical Sync***/
always@(frame)
begin
	case(frame)
		0:  begin
				if(sync_in_1 == 1)
					sync_out_2r = 1'b1;
				else
					sync_out_2r = 1'b0;
			 end
		1:  sync_out_2r = 1'b1;
		2:  sync_out_2r = 1'b1;
		3:  sync_out_2r = 1'b1;
		4:  sync_out_2r = 1'b1;
		5:  sync_out_2r = 1'b1;
		6:  sync_out_2r = 1'b1;
		7:  sync_out_2r = 1'b1;
	endcase
end
assign sync_out_2 = sync_out_2r;

assign sync_out_1 = (stch == 1'b1) ? VGA_VS : 0;

//**********************SET SCREEN WHITE IF frame==0***********************************
assign wdata = (frame==1) ? 8'b11111111 : cdata;
endmodule