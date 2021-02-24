module Total();
reg SPI_en, SPI_clk, SPI_Wdata, aluop_st, rst;

wire capture_en;
wire [2:0] register_address;
wire [7:0] result_ALU, final_out_ALU;
wire [15:0] final_out_MAC;
wire [19:0] register_data_ALU, register_data_MAC, result_MAC;
 
wire [23:0] Whole_data;
reg clk, wr_result;
reg [3:0] address;
reg [4:0] counter;
reg hold;

initial begin
  SPI_clk = 0;
  forever #20 SPI_clk = ~SPI_clk;
end

initial begin
  clk = 0;
  forever #1 clk = ~clk;
end

always @ ( posedge SPI_clk )begin
  address <= address + 1;
end

always @ ( posedge clk )begin
  
  if ( counter == 0 ) begin 
    hold <= 0;
	counter <= counter + 1;
  end
  else if ( counter < 19 ) begin
    hold <= 1;
    counter <= counter + 1;
  end
  else counter <= 0;
end

SPIandOPControl SPIandOPControl( rst, SPI_en, SPI_clk, SPI_Wdata, Whole_data, capture_en );

Command_Register_ALU Command_Register_ALU( SPI_clk, aluop_st, Whole_data[22:0] ,register_data_ALU, capture_en );
Command_Register_MAC Command_Register_MAC( SPI_clk, aluop_st, Whole_data[22:0], register_data_MAC, capture_en );

ALU ALU( clk, register_data_ALU[19], aluop_st, register_data_ALU[18:0], result_ALU );
MAC MAC( clk, register_data_MAC[19], aluop_st, register_data_MAC[18:0], result_MAC, rst, counter, hold );

Result_Register_ALU Result_Register_ALU( clk, register_data_ALU[19], wr_result, address, result_ALU, final_out_ALU );
Result_Register_MAC Result_Register_MAC( clk, register_data_MAC[19], wr_result, address, result_MAC[15:0], final_out_MAC );



initial begin
  aluop_st = 0;
  rst = 0;
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; // useless
  #40 SPI_Wdata = 1; // control 
  
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0;   
  #40 SPI_Wdata = 0; // address
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; // option ( trunc or command )
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1; // a
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1; // b
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  1
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0;   
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  2
  
  #40 rst = 1;
  #40 rst = 0;
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;   
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  3
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;   
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  4
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1;
  #40 SPI_Wdata = 0;   
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  5
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1;
  #40 SPI_Wdata = 0;   
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  6
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1;
  #40 SPI_Wdata = 1;   
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 0;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  
  
  #40 SPI_en = 1;
  #40 SPI_en = 0;
  
  //  7
  
  #40 rst = 1;
  #40 rst = 0;
  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1;
  #40 SPI_Wdata = 1;   
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 1; 
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 1;
  
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0;
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 0; 
  #40 SPI_Wdata = 1;  

  #40 SPI_en = 1;
  #40 SPI_en = 0;  
  #40 rst = 1;
  #40 rst = 0;
  
  #280 aluop_st = 1;
  
  
  #20 counter = 0;
  address = 0;
  wr_result = 0;
  
  #360 aluop_st = 0;
  
  #40 wr_result = 1;
  
  
  
end

endmodule

