`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:04 09/15/2015 
// Design Name: 
// Module Name:    spi_host 
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
module spi_host(
	 input cryst,
    output sck,
    input miso,
    output mosi,
    output reg cs,
	 output cs_flash,
	 output rLED,
	 output gLED,
	 output yLED
    );
	 
//Register List
	 reg mo;
	 reg [7:0] dctr;
	 reg [7:0] state, nxt;
	 reg [2:0] led_control;			//{red, green, yellow}
	 
	 
	 reg [6:0] cntr;
	 reg [7:0] rcmd1, rcmd2, rcmd3, rcmd4, rcmd5, rcmd6;
	 reg [7:0] rcvb;
	 reg reset;
	 reg [3:0] ncr;
	 
	 reg [31:0] block;			//need to read roughly 7816 bolcks
	 reg [9:0] bc;					//byte counter 0~512
	 
	 reg clk_sel;
	 
	 
	 reg [7:0] ram_buffer [511:0];		//RAM cell to store ONE block data
	 

//Wire List	
	 wire clk_45M, clk_400K;
	 wire wlck_sel;
	 wire wcntr0, wcntr6;
	 wire op1, op2;
	 
initial
begin
		mo <= 1'b0;
		dctr <= 0;
		state <= 0;
		nxt <= 0;
		cs <= 0;
		led_control <= 3'b000;
		cntr <= 0;
		rcvb <= 8'h00;
		reset <= 1'b0;
		ncr <= 0;
		block <= 32'h00001000;
		bc <= 0;
		clk_sel <= 1'b0;
end

dcm CMANAGE(
			.CLK_IN1								(cryst),
			// Clock out ports
			.CLK_OUT1								(clk_45M)				// 45/2 = 22.5M,   45/128 = 350K
			);

	
always@(posedge clk_45M)
          cntr <= cntr + 1;

/*assign wclk_sel = clk_sel;
assign wcntr6 = cntr[6];
assign wcntr0 = cntr[0];

and AML1(op1, wcntr0, wclk_sel);
and AML2(op2, wcntr6, ~wclk_sel);
or  OML(clk_400K, op1, op2);*/
assign clk_400K = cntr[6];		 
assign sck = cntr[6];

assign rLED = led_control[2];
assign gLED = led_control[1];
assign yLED = led_control[0];


assign cs_flash = 1'b1;
assign mosi = mo;
/**************************************************************************************
**Initialization Process
*/			
always@(negedge clk_400K)
begin
		case(state)
			//74 clock delay
			8'h00: begin
							cs <= 1'b1;
							mo <= 1'b1;
					 end
			8'h01: begin
							rcmd1 <= 8'h40;
							rcmd2 <= 8'h00;
							rcmd3 <= 8'h00;
							rcmd4 <= 8'h00;
							rcmd5 <= 8'h00;
							rcmd6 <= 8'h95;
					 end
		
			//Xmit CMD0
			            //
			8'h02: begin
							mo <= 1;
							cs <= 1;
					 end
			8'h03: mo <= 1;
			8'h04: mo <= 1;
			8'h05: mo <= 1;
			8'h06: mo <= 1;
			8'h07: mo <= 1;
			8'h08: mo <= 1;
			8'h09: mo <= 1;			
		  8'h0a: cs <= 0;
		  8'h0b: mo <= 1;
		  8'h0c: mo <= 1;
		  8'h0d: mo <= 1;
		  8'h0e: mo <= 1;
		  8'h0f: mo <= 1;
		  8'h10: mo <= 1;
		  8'h11: mo <= 1;
		  8'h12: mo <= 1;
			/*0x40*/
		  8'h13: mo <= rcmd1[7];
		  8'h14: mo <= rcmd1[6];
		  8'h15: mo <= rcmd1[5];
		  8'h16: mo <= rcmd1[4];
		  8'h17: mo <= rcmd1[3];
		  8'h18: mo <= rcmd1[2];
		  8'h19: mo <= rcmd1[1];
		  8'h1a: mo <= rcmd1[0];
		  /*0x00*/
		  8'h1b: mo <= rcmd2[7];
		  8'h1c: mo <= rcmd2[6];
		  8'h1d: mo <= rcmd2[5];
		  8'h1e: mo <= rcmd2[4];
		  8'h1f: mo <= rcmd2[3];
		  8'h20: mo <= rcmd2[2];
		  8'h21: mo <= rcmd2[1];
		  8'h22: mo <= rcmd2[0];
		  /*0x00*/
		  8'h23: mo <= rcmd3[7];
		  8'h24: mo <= rcmd3[6];
		  8'h25: mo <= rcmd3[5];
		  8'h26: mo <= rcmd3[4];
		  8'h27: mo <= rcmd3[3];
		  8'h28: mo <= rcmd3[2];
		  8'h29: mo <= rcmd3[1];
		  8'h2a: mo <= rcmd3[0];
		  /*0x00*/
		  8'h2b: mo <= rcmd4[7];
		  8'h2c: mo <= rcmd4[6];
		  8'h2d: mo <= rcmd4[5];
		  8'h2e: mo <= rcmd4[4];
		  8'h2f: mo <= rcmd4[3];
		  8'h30: mo <= rcmd4[2];
		  8'h31: mo <= rcmd4[1];
		  8'h32: mo <= rcmd4[0];
		  /*0x00*/
		  8'h33: mo <= rcmd5[7];
		  8'h34: mo <= rcmd5[6];
		  8'h35: mo <= rcmd5[5];
		  8'h36: mo <= rcmd5[4];
		  8'h37: mo <= rcmd5[3];
		  8'h38: mo <= rcmd5[2];
		  8'h39: mo <= rcmd5[1];
		  8'h3a: mo <= rcmd5[0];
		  /*0x95*/
		  8'h3b: mo <= rcmd6[7];
		  8'h3c: mo <= rcmd6[6];
		  8'h3d: mo <= rcmd6[5];
		  8'h3e: mo <= rcmd6[4];
		  8'h3f: mo <= rcmd6[3];
		  8'h40: mo <= rcmd6[2];
		  8'h41: mo <= rcmd6[1];
		  8'h42: begin
						mo <= rcmd6[0];
						ncr <= 0;
					end
		  
		  //Response of CMD0
		   8'h43: mo <= 1;
		   8'h44: begin
							mo <= 1'b1;
							ncr <= ncr + 1;
					 end
			8'h45: mo <= 1'b1;
			8'h46: mo <= 1'b1;
			8'h47: mo <= 1'b1;
			8'h48: mo <= 1'b1;
		   8'h49: mo <= 1'b1;
			8'h4a: mo <= 1'b1;	
		  //above is the 8 byte NCR
		  
		  8'h4b: mo <= 1'b1;						//rcvb[6]
		  8'h4c: mo <= 1'b1;						//rcvb[5]
		  8'h4d: mo <= 1'b1;						//rcvb[4]
		  8'h4e:	mo <= 1'b1;						//rcvb[3]
		  8'h4f:	mo <= 1'b1;						//rcvb[2]
		  8'h50: mo <= 1'b1;						//rcvb[1]
		  8'h51:	mo <= 1'b1;						//rcvb[0]
		  
		  8'h52: mo <= 1'b1;									//Transition wait to check the received response
		  8'h53: begin
						rcmd1 <= 8'h48;
						rcmd2 <= 8'h00;
						rcmd3 <= 8'h00;
						rcmd4 <= 8'h01;
						rcmd5 <= 8'haa;
						rcmd6 <= 8'h87;
					end
		  8'h54: ncr <= 0;								//immediately get started to receive R7 BIT[30]
						
		  8'h55: mo <= 1'b1;
		  8'h56: ncr <= ncr + 1;
		  8'h57: mo <= 1'b1;
		  8'h58: mo <= 1'b1;
		  8'h59: mo <= 1'b1;
			//repeat 6 times --- R7 BIT[29]~BIT[0] loop{8'h55 ~ 8'h59}

			
			/****The END of COMMAND8
				****/
				//BEGINNING OF ACMD41
			8'h5a: begin
							rcmd1 <= 8'h77;
							rcmd2 <= 8'h00;
							rcmd3 <= 8'h00;
							rcmd4 <= 8'h00;
							rcmd5 <= 8'h00;
							rcmd6 <= 8'h65;
							
							mo <= 1'b1;
							cs <= 1'b1;
					 end
			8'h5b: mo <= 1;
			8'h5c: mo <= 1;
			8'h5d: mo <= 1;
			8'h5e: mo <= 1;
			8'h5f: mo <= 1;
			8'h60: mo <= 1;
			8'h61: mo <= 1;			
		   8'h62: cs <= 0;
		   8'h63: mo <= 1;
		   8'h64: mo <= 1;
		   8'h65: mo <= 1;
		   8'h66: mo <= 1;
		   8'h67: mo <= 1;
		   8'h68: mo <= 1;
		   8'h69: mo <= 1;
		   8'h6a: mo <= 1;
			/*0x40*/
		  8'h6b: mo <= rcmd1[7];
		  8'h6c: mo <= rcmd1[6];
		  8'h6d: mo <= rcmd1[5];
		  8'h6e: mo <= rcmd1[4];
		  8'h6f: mo <= rcmd1[3];
		  8'h70: mo <= rcmd1[2];
		  8'h71: mo <= rcmd1[1];
		  8'h72: mo <= rcmd1[0];
		  /*0x00*/
		  8'h73: mo <= rcmd2[7];
		  8'h74: mo <= rcmd2[6];
		  8'h75: mo <= rcmd2[5];
		  8'h76: mo <= rcmd2[4];
		  8'h77: mo <= rcmd2[3];
		  8'h78: mo <= rcmd2[2];
		  8'h79: mo <= rcmd2[1];
		  8'h7a: mo <= rcmd2[0];
		  /*0x00*/
		  8'h7b: mo <= rcmd3[7];
		  8'h7c: mo <= rcmd3[6];
		  8'h7d: mo <= rcmd3[5];
		  8'h7e: mo <= rcmd3[4];
		  8'h7f: mo <= rcmd3[3];
		  8'h80: mo <= rcmd3[2];
		  8'h81: mo <= rcmd3[1];
		  8'h82: mo <= rcmd3[0];
		  /*0x00*/
		  8'h83: mo <= rcmd4[7];
		  8'h84: mo <= rcmd4[6];
		  8'h85: mo <= rcmd4[5];
		  8'h86: mo <= rcmd4[4];
		  8'h87: mo <= rcmd4[3];
		  8'h88: mo <= rcmd4[2];
		  8'h89: mo <= rcmd4[1];
		  8'h8a: mo <= rcmd4[0];
		  /*0x00*/
		  8'h8b: mo <= rcmd5[7];
		  8'h8c: mo <= rcmd5[6];
		  8'h8d: mo <= rcmd5[5];
		  8'h8e: mo <= rcmd5[4];
		  8'h8f: mo <= rcmd5[3];
		  8'h90: mo <= rcmd5[2];
		  8'h91: mo <= rcmd5[1];
		  8'h92: mo <= rcmd5[0];
		  /*0x95*/
		  8'h93: mo <= rcmd6[7];
		  8'h94: mo <= rcmd6[6];
		  8'h95: mo <= rcmd6[5];
		  8'h96: mo <= rcmd6[4];
		  8'h97: mo <= rcmd6[3];
		  8'h98: mo <= rcmd6[2];
		  8'h99: mo <= rcmd6[1];
		  8'h9a: mo <= rcmd6[0];
		  8'h9b: ncr <= 0;
		  
		  8'h9c: begin									//ACMD41
							rcmd1 <= 8'h69;
							rcmd2 <= 8'h40;
							rcmd3 <= 8'h00;
							rcmd4 <= 8'h00;
							rcmd5 <= 8'h00;
							rcmd6 <= 8'hff;
							
							mo <= 1'b1;
							cs <= 1'b1;
					end
		  8'h9d: clk_sel <= 1'b1;										//END OF SUCCESSFUL INITIALIZATION
		  8'h9e: ;										//Switch to a faster sclk, maximize the performance of data reading
		 
		 
		  8'h9f: begin									//CMD17  start reading single block data
						   rcmd1 <= 8'h51;
							rcmd2 <= block[31:24];
							rcmd3 <= block[23:16];
							rcmd4 <= block[15:8];
							rcmd5 <= block[7:0];
							rcmd6 <= 8'h05;
							
							mo <= 1'b1;
							cs <= 1'b1;
					end
					
		  //poll for the DATA TOKEN of the packet
		  8'ha0: begin
						ncr <= 0;
						mo <= 1'b1;
					end
		  8'ha1: bc <= 0;
		  8'ha2: begin
						bc <= 0;
						ncr <= ncr + 1;
					end
			8'ha3: bc <= 0;
			8'ha4: bc <= 0;
			8'ha5: bc <= 0;
			8'ha6: bc <= 0;
		   8'ha7: bc <= 0;
			8'ha8: bc <= 0;
			//
			//data token been found
			8'ha9: begin
						mo <= 1'b1;
						if(bc > 0)
							ram_buffer[bc-1] <= rcvb;
						else;
					 end	
		   8'haa: bc <= bc + 1;
			8'hab: mo <= 1'b1;
			8'hac: mo <= 1'b1;
			8'had: mo <= 1'b1;
			8'hae: mo <= 1'b1;
			8'haf: mo <= 1'b1;
			8'hb0: mo <= 1'b1;
		  
		 
		endcase			
end

always@(posedge clk_400K)
begin
	case(state)
		8'h00: nxt <= 8'h00;
		8'h01: nxt <= 8'h02;
		/*8'h02: nxt <= 8'h03; 3: nxt <= 4; 4: nxt <= 5; 5: nxt <= 6; 6: nxt <= 7;
		7: nxt <= 8; 8: nxt <= 9; 9: nxt <= 10; 10: nxt <= 11; 11: nxt <= 12;
		
		12: nxt <= 13; 13: nxt <= 14; 14: nxt <= 15; 15: nxt <= 16; 16: nxt <= 17;
		17: nxt <= 18; 18: nxt <= 19; 19: nxt <= 20; 20: nxt <= 21; 21: nxt <= 22;
		
		22: nxt <= 23; 23: nxt <= 24; 24: nxt <= 25; 25: nxt <= 26; 26: nxt <= 27;
		27: nxt <= 28; 28: nxt <= 29; 29: nxt <= 30; 30: nxt <= 31; 31: nxt <= 32;
		
		32: nxt <= 33; 33: nxt <= 34; 34: nxt <= 35; 35: nxt <= 36; 36: nxt <= 37;
		37: nxt <= 38; 38: nxt <= 39; 39: nxt <= 40; 40: nxt <= 41; 41: nxt <= 42;
		
		42: nxt <= 43; 43: nxt <= 44; 44: nxt <= 45; 45: nxt <= 46; 46: nxt <= 47;
		47: nxt <= 48; 48: nxt <= 49; 49: nxt <= 50; 50: nxt <= 51; 51: nxt <= 52;
		
		52: nxt <= 53; 53: nxt <= 54; 54: nxt <= 55; 55: nxt <= 56; 56: nxt <= 57;
		57: nxt <= 58; 58: nxt <= 59; 59: nxt <= 60; 60: nxt <= 61; 61: nxt <= 62;
		
		62: nxt <= 63; 63: nxt <= 64; 64: nxt <= 65; 65: nxt <= 66; 66: nxt <= 67;*/
		
	  
	  8'h43: begin								//67		
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h44;
					end
				end
	  8'h44: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h45;
					end
				end
	  8'h45: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h46;
					end
				end
	  8'h46: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h47;
					end
				end
		8'h47: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h48;
					end
				 end
	  8'h48: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h49;
					end
				end
	  8'h49: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						rcvb <= rcvb | 8'b10000000;
						nxt <= 8'h4a;
					end
				end
	  8'h4a: begin
					if(miso==1'b0)
					begin
						rcvb <= rcvb & 8'b01111111;
						nxt <= 8'h4b;
					end
					else
					begin
						if(ncr < 4'b1110)
							nxt <= 8'h43;
						else
							nxt <= 8'h02;
					end
				end	
	  /*****************************************
				**************************************/
	  8'h4b: begin												//75  rcvb[6]
					nxt <= 8'h4c;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b10111111;
					else
						rcvb <= rcvb | 8'b01000000;
				end
	  8'h4c: begin												//rcvb[5]
					//led_control <= 3'b001;
					nxt <= 8'h4d;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11011111;
					else
						rcvb <= rcvb | 8'b00100000;
				end  
	  8'h4d: begin												//rcvb[4]
					nxt <= 8'h4e;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11101111;
					else
						rcvb <= rcvb | 8'b00010000;
				end  
	  8'h4e: begin												//rcvb[3]
					nxt <= 8'h4f;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11110111;
					else
						rcvb <= rcvb | 8'b00001000;
				end 
	  8'h4f: begin												//rcvb[2]
					nxt <= 8'h50;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11111011;
					else
						rcvb <= rcvb | 8'b00000100;
				end 
	  8'h50: begin												//rcvb[1]
					nxt <= 8'h51;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11111101;
					else
						rcvb <= rcvb | 8'b00000010;
				end  
	  8'h51: begin												//rcvb[0]
					nxt <= 8'h52;
					if(miso==1'b0)
						rcvb <= rcvb & 8'b11111110;
					else
						rcvb <= rcvb | 8'b00000001;
				end 
			
	  8'h52: begin
						if(rcmd1 == 8'h40)
						begin
								if(rcvb == 8'h01)
									nxt <= 8'h53;
								else
									nxt <= 8'h02;
						end
						else if(rcmd1 == 8'h48)
						begin
								if(rcvb == 8'h01)
								begin
									nxt <= 8'h54;	
									//led_control <= 3'b001;
								end
								else
									nxt <= 8'h02;
						end
						else if(rcmd1 == 8'h69)
						begin
								if(rcvb == 8'h00)
								begin
									nxt <= 8'h9d;
									led_control <= 3'b100;
								end
								else
									nxt <= 8'h5a;			//restart CMD55-ACMD41
						end
						else if(rcmd1 == 8'h51)			//response of CMD17
						begin
								if(rcvb == 8'h00)
								begin
									nxt <= 8'ha0;			//looking for 0xfe
									//led_control <= 3'b001;
								end
								else
									nxt <= 8'h9f;
						end
				end
	  8'h53: nxt <= 8'h02;
	  
	  8'h54: begin												//continue to read R7
						nxt <= 8'h55;
						if(miso==1'b1)
							rcvb <= rcvb | 8'b01000000;
						else
							rcvb <= rcvb & 8'b10111111;
				end
/*loop (5 x 6)*/		
		8'h55: begin
						nxt <= 8'h56;
						if(miso==1'b1)
							rcvb <= rcvb | 8'b10000000;
						else
							rcvb <= rcvb & 8'b01111111;
				 end
		8'h56: begin
						nxt <= 8'h57;
						if(miso==1'b1)
							rcvb <= rcvb | 8'b10000000;
						else
							rcvb <= rcvb & 8'b01111111;
				 end
		8'h57: begin
						nxt <= 8'h58;
						if(miso==1'b1)
							rcvb <= rcvb | 8'b10000000;
						else
							rcvb <= rcvb & 8'b01111111;
				 end
		8'h58: begin
						nxt <= 8'h59;
						if(miso==1'b1)
							rcvb <= rcvb | 8'b10000000;
						else
							rcvb <= rcvb & 8'b01111111;
				 end
	  8'h59: begin
						if(ncr < 6)
							nxt <= 8'h55;
						else
							nxt <= 8'h5a;
				end
		 /***************************/
		  /***************************/
		8'h5b: nxt <= 8'h5c;
		
		8'h9b: begin
						if(rcmd1 == 8'h77)				//CMD55
							nxt <= 8'h9c;
						else if(rcmd1 == 8'h69)			//ACMD41
							nxt <= 8'h43;
						else if(rcmd1 == 8'h51)			//CMD17
							nxt <= 8'h43;
				 end
		8'h9c: nxt <= 8'h5b;
		
		/*after initialization*/
		8'h9f: begin
						nxt <= 8'h5b;
						if(block > 32'h00002b58)															//END OF FILE 7816
								led_control <= 3'b001;
						else ;
				 end
		
		//WAIT FOR 0xFE
		  8'ha0: nxt <= 8'ha1;
		  8'ha1: begin
						if(miso==1'b1)
							nxt <= 8'ha2;
						else
							nxt <= 8'ha9;
					end
		  8'ha2: begin
						if(miso==1'b1)
							nxt <= 8'ha3;
						else
							nxt <= 8'ha9;
					end
			8'ha3: begin
						if(miso==1'b1)
							nxt <= 8'ha4;
						else
							nxt <= 8'ha9;
					 end
			8'ha4: begin
						if(miso==1'b1)
							nxt <= 8'ha5;
						else
							nxt <= 8'ha9;
					 end
			8'ha5: begin
						if(miso==1'b1)
							nxt <= 8'ha6;
						else
							nxt <= 8'ha9;
					 end
			8'ha6: begin
						if(miso==1'b1)
							nxt <= 8'ha7;
						else
							nxt <= 8'ha9;
					 end
		   8'ha7: begin
						if(miso==1'b1)
							nxt <= 8'ha8;
						else
							nxt <= 8'ha9;
					 end
			8'ha8: begin
						if(miso==1'b1)
						begin
								if(ncr < 8)
									nxt <= 8'ha1;
								else
									nxt <= 8'h9f;				//send CMD17 again
						end
						else
							nxt <= 8'ha9;
							
					 end
			
			
			/*****START TO RECEIVE VALID DATA (1 BLOCK)*************
																	*/
			8'ha9: begin
							nxt <= 8'haa;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b10000000;
							else
								rcvb <= rcvb & 8'b01111111;
					 end
			8'haa: begin
							nxt <= 8'hab;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b01000000;
							else
								rcvb <= rcvb & 8'b10111111;
					 end
			8'hab: begin
							nxt <= 8'hac;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00100000;
							else
								rcvb <= rcvb & 8'b11011111;
					 end
			8'hac: begin
							nxt <= 8'had;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00010000;
							else
								rcvb <= rcvb & 8'b11101111;
					 end
			8'had: begin
							nxt <= 8'hae;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00001000;
							else
								rcvb <= rcvb & 8'b11110111;
					 end
			8'hae: begin
							nxt <= 8'haf;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00000100;
							else
								rcvb <= rcvb & 8'b11111011;
					 end
			8'haf: begin
							nxt <= 8'hb0;
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00000010;
							else
								rcvb <= rcvb & 8'b11111101;
					 end
			8'hb0: begin
							if(miso==1'b1)
								rcvb <= rcvb | 8'b00000001;
							else
								rcvb <= rcvb & 8'b11111110;
								
							if(bc < 512)
								nxt <= 8'ha9;
							else
							begin
								nxt <= 8'h9f;				//read next block
								block <= block + 1;
							end
					 end
			
		default: nxt <= state + 1;
	endcase
end

always@(negedge clk_400K or posedge reset)				//MOSI is always changing at the falling edge of sclk
begin
		if(reset==1'b1)
			state <= 8'h01;
		else
			state <= nxt;
end
/******************************************************
**Delay 74 clock
*/
always@(negedge clk_400K)
begin
		if(dctr < 8'h64)
		begin
			dctr <= dctr + 1;
			reset <= 0;
		end
		else if((dctr >= 100) && (dctr < 102))
		begin
			dctr <= 8'h70;
			reset <= 1;
		end
		else
			reset <= 0;
end
endmodule
