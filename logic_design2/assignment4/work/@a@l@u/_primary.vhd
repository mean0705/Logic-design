library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        clk             : in     vl_logic;
        aluop_st        : in     vl_logic;
        alu_en          : in     vl_logic;
        register_data   : in     vl_logic_vector(18 downto 0);
        result          : out    vl_logic_vector(7 downto 0)
    );
end ALU;
