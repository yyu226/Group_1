`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:59 09/01/2014 
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
module vga_top(clk, led, ledbar
    );

    input clk;
	 output reg led;
	 output ledbar;
	 reg[31:0] counter;
	 
	 always@(posedge clk)
		begin
			counter = counter + 1;
			if(counter == 120000000)
				begin
					counter = 0; led = ~led;
				end
			else
				led = led;
		end
		
	 assign ledbar = ~led;

endmodule
