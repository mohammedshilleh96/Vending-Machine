module VendingMachine(clk , shekel , ret , jelly , bubbly , sour , cr , itm , chng);
input clk , shekel , ret , jelly , bubbly , sour;
output cr , itm , chng;

// THESE ARE THE OUTPUTS AND THEY ARE 4 BIT IN SINCE THEY ARE INPUT TO 7-SEGMENT DECODER
reg [3:0] cr;
reg [3:0] itm;
reg [3:0] chng;

// THE Ret BUTTON IS EQUIVILANT TO RESET
reg Ret;
reg flag;

// COUNTER IS  USED TO COUNT 10 SECONDS AFTER PURCHASING AN ITEM BEFORE RESETING THE MACHINE
reg [3:0] counter;

initial
	begin
		cr = 0;
		chng = 0;
		itm = 0;
		counter = 0;
		flag = 0;
	end

always@(posedge clk)
	begin
		if(ret || Ret)
			begin
				cr = 0;
				itm = 0;
				Ret = 0;
				counter = 10;
				flag = 0;
			end
			
		else if(counter > 0)
			begin
				counter = counter - 1;
				chng = counter;
			end
			
		else if ((shekel && flag) && (~jelly && ~bubbly && ~sour))
			begin
			// max credit is 8 
				cr = cr + 1;
					if(cr == 9)
						begin
							chng = 9;
							Ret = 1;
						end
						
				flag = 0;

			end
			
		else if(jelly && (~bubbly && ~sour))
			begin
				if(cr>=2)
					begin
						cr = cr - 2;
						chng = cr;
						itm = 10;
						Ret = 1;
					end
			end
			
		else if(bubbly && ~jelly && ~sour)
			begin
				if(cr>=5)
					begin
						cr = cr - 5;
						chng = cr;
						itm = 11;
						Ret = 1;
					end
			end
			
		else if(sour && ~bubbly && ~jelly)
			begin
				if(cr>=3)
					begin
						cr = cr - 3;
						chng = cr;
						itm = 12;
						Ret = 1;
					end
			end
			
		if (~shekel)
			flag = 1;
end
endmodule
