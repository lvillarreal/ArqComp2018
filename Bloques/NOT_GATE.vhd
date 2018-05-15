library ieee;
use ieee.std_logic_1164.all;

entity NOT_GATE is
	generic (
		DATA_WIDTH: integer := 7
	);
	port (
		A_i: in std_logic_vector(DATA_WIDTh - 1 downto 0);
		B_i: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_A: out std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_B: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
	
end NOT_GATE;

architecture Behavioral of NOT_GATE is

begin

	Sal_A <= not A_i;
	Sal_B <= not B_i;

end Behavioral;