module Result_Register_ALU( clk, alu_en, wr, address, din, dout );

input	clk, wr, alu_en;
input	[3:0]	address;
input	[7:0]	din;
output reg [7:0] dout;

reg	 [7:0]	ram_data[0:7];
reg [2:0] update_address;

always @( posedge clk ) begin
	if ( !alu_en ) begin
		if( wr ) begin
			dout <= ram_data[address-1];
			ram_data[address-1] <= ram_data[address-1];
		end
		else begin 
			dout <= 8'd0;
			ram_data[address-1] <= din;
		end
	end
	
	ram_data[address-1] <= ram_data[address-1];
end

endmodule
