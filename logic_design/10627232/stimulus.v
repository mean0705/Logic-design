module stimulus;
  
reg clk, rst, en_machine;
reg [7:0] coin;
reg [3:0] drink_choose;

vending_machine Machine1(clk, rst, coin, drink_choose, en_machine);

initial clk = 1'b0;
initial en_machine = 1'b0;

always #5 clk = ~clk;
always #10 en_machine = ~en_machine;

always @(posedge en_machine) begin
	    drink_choose = 4'd5;
end

always @(negedge en_machine) begin
    if(rst) begin
	    drink_choose = 4'd5;
	    coin = 8'd0;
	end
end



initial
begin

rst = 1;
#20 rst = 0;

#20 coin = 10;
#20 coin = 10;
#20 coin = 1;
#20 coin = 5;

#20 drink_choose = 2;
#20 drink_choose = 0;


#20 rst = 1;
#20 rst = 0;

#20 coin = 5;
#20 coin = 5;
#20 coin = 1;
#20 coin = 1;
#20 coin = 10;
#20 drink_choose = 2;
#20 drink_choose = 0;

#20 rst = 1;
#20 rst = 0;

#20 coin = 10;
#20 drink_choose = 2;

#20 coin = 10;
#20 drink_choose = 2;
#20 drink_choose = 0;


#20 rst = 1;
#20 rst = 0;

#20 coin = 10;
#20 coin = 5;
#20 coin = 1;
#20 coin = 1;

#20 drink_choose = 1;
#20 drink_choose = 0;

#20 rst = 1;

end


endmodule