module vending_machine(clk, rst, coin, drink_choose);

input clk, rst;
input [7:0] coin;
input [3:0] drink_choose;
wire  [7:0] total;

always @(posedge clk or posedge rst) 
begin
    if(rst)
        FSM <= S0
    else begin
        case(FSM)
            S0:
			begin
			    total <= total + coin;
			    if (drink_choose <= 0)
				    $display( "back you %b", total );
					FSM <= S3;
				else if (drink_choose > 0 && drink_choose < 5)
				    FSM <= S2;
				else if (total >= 10)
				    FSM <= S1;
				else
				    FSM <= S0;
			end
		
			S1:
			begin

			end
			S2:
			begin
			
			end
			
			S3:
			begin
			
			end

			default: 
			begin
				Out_0;          //输出
				if(condition0) FSM<= S0;//状态转移
			end
		
        endcase
        end
end


endmodule





