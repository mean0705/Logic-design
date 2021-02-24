module stimulus;
  
reg [3:0] a;
reg [3:0] b;
wire [3:0] sum;
reg sel, clk;
wire c_out;

addSub4 DUT (sel, a, b, sum, c_out, clk);

initial clk = 1'b0;
always #5 clk = ~clk;


initial
begin

#10;
a = 4'b0101;
b = 4'b0001;
sel = 1'b0;

#10;
a = 4'b0101;
b = 4'b0001;
sel = 1'b1;

#10;
a = 4'b0000;
b = 4'b0000;
sel = 1'b0;

#10;
a = 4'b0000;
b = 4'b0000;
sel = 1'b1;

#10;
a = 4'b0010;
b = 4'b0010;
sel = 1'b0;

#10;
a = 4'b0010;
b = 4'b0010;
sel = 1'b1;

#10;
a = 4'b0001;
b = 4'b0101;
sel = 1'b0;

#10;
a = 4'b0001;
b = 4'b0101;
sel = 1'b1;

#10;
end

endmodule