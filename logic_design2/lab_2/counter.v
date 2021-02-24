module Counter( dout, clk, rst, en, up ) ;

input en ;
input up ;
input clk ;
input rst ;
output reg [7:0] dout ;

always@(posedge clk ) begin
  if ( rst == 0 )
    dout <= 0 ;
  else if ( en == 1'b1 && up == 1'b1 ) begin
    if ( dout != 8'hff )
      dout <= dout + 1 ;
    else if ( dout == 8'hff )
      dout <= dout ;
  end
  else if ( en == 1'b1 && up == 1'b0 ) begin
    if ( dout != 8'h00 )
      dout <= dout - 1 ;
    else if ( dout == 8'h00 )
      dout <= dout ;
  end
  else if ( en == 1'b0 )
    dout <= dout ;

  




end

endmodule