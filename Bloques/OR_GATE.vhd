library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE is
	generic (
		DATA_WIDTH: integer := 7
	);
	port (
		A_i: in std_logic_vector(DATA_WIDTh - 1 downto 0);
		B_i: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_o: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
	
end OR_GATE;

architecture Behavioral of OR_GATE is

begin

	Sal_o <= A_i or B_i;

end Behavioral;