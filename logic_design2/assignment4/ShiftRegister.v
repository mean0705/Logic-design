module ShiftRegister( SPI_clk, wr, capture_en, SPI_Wdata, aluop_st, whole_data, address );

input SPI_clk, SPI_Wdata, capture_en, aluop_st, wr;
input [4:0] address;
output reg [0:23] whole_data;

always @ ( posedge SPI_clk ) begin
  if ( address < 25 )
	whole_data[address-1] <= SPI_Wdata;
end

endmodule