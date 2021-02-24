library verilog;
use verilog.vl_types.all;
entity ShiftRegister is
    port(
        SPI_clk         : in     vl_logic;
        wr              : in     vl_logic;
        capture_en      : in     vl_logic;
        SPI_Wdata       : in     vl_logic;
        aluop_st        : in     vl_logic;
        whole_data      : out    vl_logic_vector(0 to 23);
        address         : in     vl_logic_vector(4 downto 0)
    );
end ShiftRegister;
