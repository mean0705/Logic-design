// module DFF with synchronous reset
module DFF(q, d, clk, reset);

output q; 
input d, clk, reset;
reg q;

always @(posedge reset or negedge clk)
if (reset)
		q = 1'b0;
else
		q = d;

endmodule

module Shift(q, clk, reset);

output [7:0] q; 
input clk, reset;

always @(posedge reset or negedge clk)
    DFF d1( q[0], 1, clk, reset );
	DFF d1( q[1], 1, clk, reset );
	DFF d1( q[2], 1, clk, reset );
	DFF d1( q[3], 1, clk, reset );
	DFF d1( q[4], 1, clk, reset );
	DFF d1( q[5], 1, clk, reset );
	DFF d1( q[6], 1, clk, reset );
	DFF d1( q[7], 1, clk, reset );
endmodule


// Design program by yourself.






endmodule





