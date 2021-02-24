module ALU( clk, aluop_st, alu_en, register_data, result );

input clk, aluop_st, alu_en;
input [18:0] register_data;
output reg [7:0] result;

reg [2:0] sel;
reg [7:0] a, b;

always @ ( posedge clk ) begin
  if ( !aluop_st ) begin
    if ( alu_en ) begin
	
    sel <= register_data[18:16];
	a <= register_data[15:8];
	b <= register_data[7:0];
	
	if ( sel == 3'd0 ) result <= a + b ;
	else if ( sel == 3'd1 ) result <= a - b ;
	else if ( sel == 3'd2 ) result <= a & b ;
	else if ( sel == 3'd3 ) result <= a | b ;
	else if ( sel == 3'd4 ) result <= a ^ b ;
	else if ( sel == 3'd5 ) result <= a / 2 + 4 * b ;
	else if ( sel == 3'd6 ) result <= 3 * ( a + b ) ;
	else if ( sel == 3'd7 ) result <= 6 * a + b / 4 ;
	else result <= result;
	
	end 
  end
  else result <= result;


end

endmodule