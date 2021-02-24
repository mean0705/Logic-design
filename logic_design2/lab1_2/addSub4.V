module addSub4(sel, a, b, sum, c_out, clk);
			   
input sel, clk;
input [3:0] a;
input [3:0] b;
output [3:0] sum;
output c_out;
wire [3:0] tmp_add;
wire [3:0] tmp_sub;

  assign tmp_add = a + b;
  assign tmp_sub = a - b;
  
  assign sum = (sel ? (tmp_sub) : (tmp_add));

endmodule