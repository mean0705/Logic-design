library verilog;
use verilog.vl_types.all;
entity Command_Register_MAC is
    port(
        clk             : in     vl_logic;
        aluop_st        : in     vl_logic;
        din             : in     vl_logic_vector(22 downto 0);
        dout            : out    vl_logic_vector(19 downto 0);
        capture_en      : in     vl_logic
    );
end Command_Register_MAC;
