library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_SinResta_reg is
	generic (
		DATA_WIDTH: integer := 7
	);
	port(
		a_reg, b_reg: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		op_reg: in std_logic_vector(2 downto 0);
		clk: in std_logic;
		dat_O_reg: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
end ALU_SinResta_reg;






architecture Behavioral of ALU_SinResta_reg is

	component ALU_SinResta 	port(
		dat_A, dat_B: in std_logic_vector(DATA_WIDTH - 1 downto 0); --Datos A y B de entrada
		op: in std_logic_vector(2 downto 0); -- dato de seleccion de operacion
		dat_O: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);
	end component;
	
	signal dat_A,dat_B,dat_O:std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal op:std_logic_vector(2 downto 0);
	
	begin

	uut: ALU_SinResta port map(
		dat_A => dat_A,
		dat_B => dat_B,
		op => op,
		dat_O => dat_O);

	Reloj: process(clk)
	
	begin
	
		if (clk'event and clk = '1') then
			
			dat_A <= a_reg;
			dat_B <= b_reg;
			op <= op_reg;
			dat_O_reg <= dat_O;
		
		end if;
	
	end process;

end Behavioral;