module stimulus;
  
reg clk,reset;
wire [7:0]count;

Shift shift(count, clk,reset);

initial clk = 1'b0;
always #5 clk = ~clk;


initial
begin

#90

end

// Monitor the outputs 
initial
	$monitor($time, " Output count = %b",  count);


endmodule