module Top(a, b, sel, out);
			   
input [2:0] sel;
input signed [7:0] a;
input signed [7:0] b;
output signed [7:0] out;

wire [7:0] and_out;
wire [7:0] or_out;
wire signed [8:0] add_out;
wire signed [8:0] sub_out;
wire [7:0] xor_out;

wire [6:0] tempa;
wire [9:0] tempb;
wire signed [10:0] math1_out;

wire [9:0] tempsum1;

wire [9:0] temp3;
wire signed [10:0] math2_out;

wire signed [15:0] Multiplicand_a;
wire signed [15:0] product;
wire signed [15:0] mul_out;

  //assign add_out = {1'b0,a} + {b[7], b};
  //assign sub_out = {1'b0,a} + {~{b} + 1'b1 };
  assign add_out = a + b;
  assign sub_out = a - b;

  and ( and_out[0], a[0], b[0] );
  and ( and_out[1], a[1], b[1] );
  and ( and_out[2], a[2], b[2] );
  and ( and_out[3], a[3], b[3] );
  and ( and_out[4], a[4], b[4] );
  and ( and_out[5], a[5], b[5] );
  and ( and_out[6], a[6], b[6] );
  and ( and_out[7], a[7], b[7] );
  

  or ( or_out[0], a[0], b[0] );
  or ( or_out[1], a[1], b[1] );
  or ( or_out[2], a[2], b[2] );
  or ( or_out[3], a[3], b[3] );
  or ( or_out[4], a[4], b[4] );
  or ( or_out[5], a[5], b[5] );
  or ( or_out[6], a[6], b[6] );
  or ( or_out[7], a[7], b[7] );
  
  xor ( xor_out[0], a[0], b[0] );
  xor ( xor_out[1], a[1], b[1] );
  xor ( xor_out[2], a[2], b[2] );
  xor ( xor_out[3], a[3], b[3] );
  xor ( xor_out[4], a[4], b[4] );
  xor ( xor_out[5], a[5], b[5] );
  xor ( xor_out[6], a[6], b[6] );
  xor ( xor_out[7], a[7], b[7] );
  
  assign tempa = a[7:1];
  assign tempb = {b, 2'b00};
  assign math1_out = $signed(tempa) + $signed(tempb);

  
  assign temp3 = {add_out, 1'b0};
  assign math2_out = $signed(temp3) + add_out;

  
  assign mul_out = a * b;
  
  assign out = sel[2] ? (sel[1] ? ( sel[0] ? mul_out[15:8] : math2_out[10:3] ) : ( sel[0] ? math1_out[10:3] : xor_out )) : (sel[1] ? ( sel[0] ? or_out : and_out ) : ( sel[0] ? {sub_out[8:1]} : add_out[8:1] ));



endmodule