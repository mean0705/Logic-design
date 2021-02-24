module vending_machine(clk, rst, coin, drink_choose, en_machine);

input clk, rst, en_machine;
input [7:0] coin;
input [3:0] drink_choose;

reg   [7:0] total;
reg   [2:0] FSM;
reg   [2:0] S0 = 3'b001, S1 = 3'b010, S2 = 3'b011, S3 = 3'b100;

always @(negedge clk)
begin
    if (rst) begin @ (negedge clk)
        FSM <= S0;
		total = 8'd0;
	end
	
    else begin
        case(FSM)
            S0:
			begin
			    if (drink_choose <= 0)                         FSM <= S3;
				else if (drink_choose > 0 && drink_choose < 5) FSM <= S2;    
				else begin
					total = total + coin;
					if (coin != 0) $display( "\ncoin %d, ", coin );
					if (coin != 0) $display( "total %d dollars, ", total );
					
					FSM <= S1;
				end
			end
		
			S1:
			begin
                if  (total >= 25)     $display( "tea | coke | coffee | milk");    
				else if (total >= 20) $display( "tea | coke | coffee");  
				else if (total >= 15) $display( "tea | coke");
				else if (total >= 10) $display( "tea");
				else;
				
				FSM <= S0;
			end
			
			S2:
			begin
			    if (drink_choose <= 1) begin
				    $display( "You choose tea!");
				    if (total < 10) $display( "But you don't have enough money!");
					else begin
				        $display( "tea out");
					    total = total - 10;
					end
				end
				else if (drink_choose <= 2) begin
				    $display( "You choose coke!");
				    if (total < 15) $display( "You don't have enough money!");
					else begin
				        $display( "coke out");
						total = total - 15;
					end
				end
				else if (drink_choose <= 3) begin
			     	$display( "You choose coffee!");
				    if (total < 20) $display( "You don't have enough money!");
					else begin
				        $display( "coffee out");
						total = total - 20;
					end
				end
				else if (drink_choose <= 4) begin
				    $display( "You choose milk!");
				    if (total < 25) $display( "You don't have enough money!");
					else begin
				        $display( "milk out");
						total = total - 25;
					end  
				end
				else;
				
				FSM <= S0;
			end
			
			S3:
			begin
			    $display( "exchange %d dollars", total );
				FSM <= S0;
			end

			default: 
			begin
			    $display( "Maybe have something error!!");
			end
		
        endcase
        end
end


endmodule





