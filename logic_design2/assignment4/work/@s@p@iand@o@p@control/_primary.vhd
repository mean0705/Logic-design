library verilog;
use verilog.vl_types.all;
entity SPIandOPControl is
    port(
        rst             : in     vl_logic;
        SPI_en          : in     vl_logic;
        SPI_clk         : in     vl_logic;
        SPI_Wdata       : in     vl_logic;
        whole_data      : out    vl_logic_vector(23 downto 0);
        capture_en      : out    vl_logic
    );
end SPIandOPControl;
