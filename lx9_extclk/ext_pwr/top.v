`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:36 12/16/2015 
// Design Name: 
// Module Name:    top 
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
    input clk_12m,
    output LEDr,
    output LEDg,
    output LEDo
    );

	reg [31:0] counter;
	
	initial
			counter <= 0;
	
	always@(posedge clk_12m)
			counter <= counter + 1;
	
	
assign LEDr = counter[5];
assign LEDg = ~counter[6];
assign LEDo = counter[23];

endmodule
