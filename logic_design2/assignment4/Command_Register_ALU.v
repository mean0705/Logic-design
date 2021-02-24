module Command_Register_ALU( clk, aluop_st, din, dout, capture_en );

input	clk, aluop_st, capture_en;
input	[22:0]	din;
output reg [19:0] dout;

reg	 [19:0]	ram_data[0:7];
reg [2:0] update_address_out;

always @( posedge clk ) begin
	if ( capture_en ) begin
	    update_address_out <= 3'd0;
		dout <= 20'd0;
		ram_data[din[21:19]] <= {din[22], din[18:0]};
    end
	else if ( aluop_st ) begin 
		dout <= ram_data[update_address_out];
		ram_data[update_address_out] <= ram_data[update_address_out];
		update_address_out <= update_address_out + 1;
	end
end

endmodule
