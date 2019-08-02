library verilog;
use verilog.vl_types.all;
entity BCD_adder is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        Result          : out    vl_logic_vector(3 downto 0);
        Cout            : out    vl_logic
    );
end BCD_adder;
