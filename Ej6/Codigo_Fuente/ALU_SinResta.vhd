-- Villarreal Luciano

-- ALU sin operación de resta

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_SinResta is
	generic (
		DATA_WIDTH: integer:= 7
	);
	port (
		dat_A, dat_B: in std_logic_vector(DATA_WIDTH - 1 downto 0); --Datos A y B de entrada
		op: in std_logic_vector(2 downto 0); -- dato de seleccion de operacion
		dat_O: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);
end ALU_SinResta;



architecture Behavioral of ALU_SinResta is

	component AND_GATE 	port (
		A_i: in std_logic_vector(DATA_WIDTh - 1 downto 0);
		B_i: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_o: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
	end component;
	
	component OR_GATE 	port (
		A_i: in std_logic_vector(DATA_WIDTh - 1 downto 0);
		B_i: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_o: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
	end component;
	
	component NOT_GATE 	port (
		A_i: in std_logic_vector(DATA_WIDTh - 1 downto 0);
		B_i: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_A: out std_logic_vector(DATA_WIDTH - 1 downto 0);
		Sal_B: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
	end component;
	
	component RippleCarryAdder 	port(	
		A_in, B_in: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		C_in: in std_logic;
		S_out: out std_logic_vector(DATA_WIDTH -1 downto 0);
		C_out: out std_logic
	);
	end component;

	-- Definicion de señales
	signal And_AB, Or_AB, NotA, NotB, Sum, SalMux: std_logic_vector(DATA_WIDTH -1 downto 0);
	
	begin
		
		uu1: AND_GATE port map(
			A_i => dat_A,
			B_i => dat_B,
			Sal_o => And_AB		
		);
		
		uu2: OR_GATE port map(
			A_i => dat_A,
			B_i => dat_B,
			Sal_o => Or_AB		
		);
		uu3: NOT_GATE port map(
			A_i => dat_A,
			B_i => dat_B,
			Sal_A => NotA,
			Sal_B => NotB
		);
		
		uu4: RippleCarryAdder port map(
			A_in => dat_A, 
			B_in => dat_B,
			S_out => Sum,
			C_in => '0'
			);
		
	with op select
		dat_O	<=  Sum when "000",
					 And_AB when "001",
					 Or_AB when "010",
					 NotA when "011",
					 NotB when others;
						
	
--	proceso1: process(op)
--	begin
--		
--		case op is
--			when "000" => dat_O <= Sum;
--			when "001" => dat_O <= And_AB;
--			when "010" => dat_O <= Or_AB;
--			when "011" => dat_O <= NotA;
--			when others => dat_O <= NotB;
--		end case;
--		
--	end process;

end Behavioral;