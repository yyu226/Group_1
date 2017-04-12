module Hcounter(clkh, clrh, hd, hde, hdeb, hdebc,
                roll, cntrh);

		input clkh, clrh;
		output reg hd, hde, hdeb, hdebc;
		output roll;
		output reg [9:0] cntrh;
		
		initial cntrh = 0;
		
		always@(posedge clkh)
			begin
				if(clrh == 1'b1)
					cntrh <= 0;
				else
					begin
						if(cntrh < 800)
							cntrh <= cntrh + 1;
					else
						cntrh <= 0;
					end
			end
			
		always@(cntrh)
			begin
				if(cntrh == 0)
					begin
						hde <= 1'b0;		hdeb <= 1'b0;
						hd <= 1'b0; 		hdebc <= 1'b1;
					end
				else if(cntrh == 640)
					begin
						hd <= 1'b1;			hdebc <= 1'b0;
					end
				else if(cntrh == 660)
					hde <= 1'b1;
				else if(cntrh == 755)
					begin
						hde <= 1'b0;		hdeb <= 1'b1;
					end
				else
					begin
						hde <= hde;			hdeb <= hdeb;
						hd <= hd;			hdebc <= hdebc;
					end
			end
			
		assign roll = hdebc;
		
endmodule
