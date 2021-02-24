library verilog;
use verilog.vl_types.all;
entity MAC is
    port(
        clk             : in     vl_logic;
        mac_st          : in     vl_logic;
        mac_en          : in     vl_logic;
        register_data   : in     vl_logic_vector(18 downto 0);
        result          : out    vl_logic_vector(19 downto 0);
        rst             : in     vl_logic;
        counter         : in     vl_logic_vector(4 downto 0);
        hold            : in     vl_logic
    );
end MAC;
