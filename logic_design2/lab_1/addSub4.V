module addSub4(sel, a, b, sum, c_out, clk);
			   
input sel, clk;
input [3:0] a;
input [3:0] b;
output [3:0] sum;
output c_out;
wire [3:0] bop;

  xor x1(bop[0], sel, b[0]);
  xor x2(bop[1], sel, b[1]);
  xor x3(bop[2], sel, b[2]);
  xor x4(bop[3], sel, b[3]);

  adder4 a1(a, bop, sel, sum, c_out);
endmodule