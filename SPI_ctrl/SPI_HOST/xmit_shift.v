`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:20 09/15/2015 
// Design Name: 
// Module Name:    xmit_shift 
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
module xmit_shift(
    output reg done,
    input [7:0] cmd,
    input clk,
	 input start,
    output reg sx								//MSB goes first
    );

reg [3:0] stc;

always@(stc)
begin
		case(stc)
			0: begin								//also the STANDBY state
					done <= 1'b0;
					sx <= cmd[7];
				end
			1: sx <= cmd[6];
			2: sx <= cmd[5];
			3: sx <= cmd[4];
			4: sx <= cmd[3];
			5: sx <= cmd[2];
			6: sx <= cmd[1];
			7: begin
					sx <= cmd[0];
					done <= 1'b1;
				end
			default: sx <= 1'bx;
		endcase
end

always@(negedge clk)
begin
		if(!start)
			stc = 0;
		else
		begin
			case(stc)
				0: stc = 1;
				1: stc = 2;
				2: stc = 3;
				3: stc = 4;
				4: stc = 5;
				5: stc = 6;
				6: stc = 7;
				7: stc = 0;
				default: stc = 4'bxxxx;
			endcase
		end
end
endmodule
