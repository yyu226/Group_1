`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:39 09/15/2015 
// Design Name: 
// Module Name:    Rcv_shift 
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
module rcv_shift(
    input clk,
    input start,
	 input rx,
    output reg [7:0] rsps,
    output reg done
    );

reg[3:0] scr, next;

always@(*)
begin
		case(scr)
			0: begin
					done = 0;
					rsps[7] = rx;
				end
			1: rsps[6] = rx;
			2: rsps[5] = rx;
			3: rsps[4] = rx;
			4: rsps[3] = rx;
			5: rsps[2] = rx;
			6: rsps[1] = rx;
			7: begin
					rsps[0] = rx;
					done = 1;
				end
			default: rsps = 8'hxx;
		endcase
end

always@(negedge clk)
begin
		if(!start)
			scr = 0;
		else
			scr = next;
end

always@(*)
begin
		if(!start)
			next = 0;
		else
		begin
				case(scr)
					0: next = 1;
					1: next = 2;
					2: next = 3;
					3: next = 4;
					4: next = 5;
					5: next = 6;
					6: next = 7;
					7: next = 0;
					default: next = 4'bxxxx;
				endcase
		end
end
endmodule
