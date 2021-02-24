library verilog;
use verilog.vl_types.all;
entity Command_Register is
    port(
        clk             : in     vl_logic;
        aluop_st        : in     vl_logic;
        address_in      : in     vl_logic_vector(2 downto 0);
        din             : in     vl_logic_vector(18 downto 0);
        address_out     : in     vl_logic_vector(3 downto 0);
        dout            : out    vl_logic_vector(18 downto 0);
        capture_en      : in     vl_logic
    );
end Command_Register;
