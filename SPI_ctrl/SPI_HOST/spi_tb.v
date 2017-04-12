`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:12 09/15/2015
// Design Name:   spi_host
// Module Name:   C:/Users/yingyu/Desktop/ISEproj/SPI_ctrl/SPI_HOST/spi_tb.v
// Project Name:  SPI_HOST
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: spi_host
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spi_tb;

	// Inputs
	reg cryst;
	reg miso;

	// Outputs
	wire sck;
	wire mosi;
	wire cs;

	// Instantiate the Unit Under Test (UUT)
	spi_host uut (
		.cryst(cryst), 
		.sck(sck), 
		.miso(miso), 
		.mosi(mosi), 
		.cs(cs)
	);

	initial begin
		// Initialize Inputs
		cryst = 0;
		miso = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
		#5 cryst = ~cryst;
      
endmodule

