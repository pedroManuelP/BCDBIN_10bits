--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity BCDBIN_10bits is
	port(
		BCD: in std_logic_vector(11 downto 0);
		SW: out std_logic_vector(9 downto 0)
	);

end BCDBIN_10bits;

--arquitetura
architecture Hardware of BCDBIN_10bits is
	component BCDBIN_Centena is
		port(
			BCD: in std_logic_vector(3 downto 0);
			SW: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component BCDBIN_Dezena is
		port(
			BCD: in std_logic_vector(3 downto 0);
			SW: out std_logic_vector(9 downto 0)
		);
	end component;

	component Somador10bits is
		port(
			A,B: in std_logic_vector (9 downto 0);
			cin: in std_logic;
			S: out std_logic_vector (9 downto 0)
		);
	end component;
	
	signal centena, dezena, unidade: std_logic_vector(9 downto 0);
	
	signal soma1: std_logic_vector(9 downto 0);
	signal soma2: std_logic_vector(9 downto 0);
	
begin
	bcd_centena: BCDBIN_Centena port map(BCD(11 downto 8), centena);
	bcd_dezena: BCDBIN_Dezena port map(BCD(7 downto 4), dezena);
	unidade <= "000000"  & BCD(3 downto 0);
	
	somador1: Somador10bits port map(centena, dezena, '0', soma1);
	somador2: Somador10bits port map(soma1, unidade, '0', soma2);
	
	SW <= soma2;
end Hardware;
