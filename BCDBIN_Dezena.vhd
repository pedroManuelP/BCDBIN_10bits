--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity BCDBIN_Dezena is
	port(
		BCD: in std_logic_vector(3 downto 0);
		SW: out std_logic_vector(9 downto 0)
	);
end BCDBIN_Dezena;

--arquitetura
architecture Hardware of BCDBIN_Dezena is
	signal A,B,C,D: std_logic;
	
begin
	A <= BCD(3);
	B <= BCD(2);
	C <= BCD(1);
	D <= BCD(0);
	
	SW(0) <= '0';
	SW(1) <= D;
	SW(2) <= C;
	SW(3) <= B XOR D;
	SW(4) <= A OR (C AND (NOT D)) OR ((NOT B) AND C) OR (B AND (NOT C) AND D);
	SW(5) <= B AND ((NOT C) OR (NOT D));
	SW(6) <= A OR (B AND C AND D);
	SW(7) <= '0';
	SW(8) <= '0';
	SW(9) <= '0';

end Hardware;