module stimulus;
  
reg clk, rst, declare;
reg [7:0] coin;
reg [3:0] drink_choose;

vending_machine Machine1(clk, rst, coin, drink_choose);

initial clk = 1'b0;
initial drink_choose = 0;

always #10 clk = ~clk;


initial
begin

#10 coin = 10;

end


endmodule