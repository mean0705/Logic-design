module Result_Register_MAC( clk, mac_en, wr, address, din, dout );

input	clk, wr, mac_en;
input	[3:0]	address;
input	[15:0]	din;
output reg [15:0] dout;

reg	 [15:0]	ram_data[0:7];
reg [2:0] update_address;

always @( posedge clk ) begin
	if ( mac_en ) begin
		if( wr ) begin
			dout <= ram_data[address-2];
			ram_data[address-2] <= ram_data[address-2];
		end
		else begin 
			dout <= 8'd0;
			ram_data[address-2] <= din;
		end
	end
	else ram_data[address-2] <= ram_data[address-2];
end

endmodule
