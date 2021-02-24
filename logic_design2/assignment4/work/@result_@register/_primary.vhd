library verilog;
use verilog.vl_types.all;
entity Result_Register is
    port(
        clk             : in     vl_logic;
        wr              : in     vl_logic;
        address         : in     vl_logic_vector(3 downto 0);
        din             : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end Result_Register;
