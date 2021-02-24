module MAC ( clk, mac_st, mac_en, register_data, result, rst, counter, hold );

input clk, rst, mac_st, mac_en;
input [18:0] register_data;
output reg [19:0] result;

reg signed [15:0] mul_result;
input [4:0] counter;
input hold;

wire signed [7:0] RAM, ROM;
assign mode = register_data[18];
assign trunc = register_data[17:16];
assign RAM = register_data[15:8];
assign ROM = register_data[7:0];

always @ ( posedge rst ) begin
	if ( rst ) begin
		result <= 20'd0;
		mul_result <= 16'd0;
	end
end

always @ ( posedge clk ) begin

	if ( mac_en && !hold ) begin
		mul_result <= RAM * ROM ;
		result <= result + mul_result;	
	end
	else result <= result;
	

end

endmodule