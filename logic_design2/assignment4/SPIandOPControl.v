module SPIandOPControl( rst, SPI_en, SPI_clk, SPI_Wdata, whole_data, capture_en );
input rst, SPI_en, SPI_clk, SPI_Wdata;
output [23:0] whole_data;
output reg capture_en;

reg hold;
reg [4:0] counter;

ShiftRegister Shiftregister( SPI_clk, wr, capture_en, SPI_Wdata, aluop_st, whole_data, counter );

always @ ( posedge SPI_clk ) begin
    if ( rst ) begin
	  counter <= 0;
	  hold <= 1;
	  capture_en <= 0;
	end
	else begin
      if ( SPI_en ) hold <= 0;
      else if ( !hold ) counter <= counter + 1;
	  else counter <= counter;
	
	  if ( counter == 25 ) begin
	    hold <= 1;
	    capture_en <= 1;
	  end
	  else begin
	    capture_en <= 0;
	    hold <= 0;
	  end
	end
end

endmodule