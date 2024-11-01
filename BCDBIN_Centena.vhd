--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity BCDBIN_Centena is
	port(
		BCD: in std_logic_vector(3 downto 0);
		SW: out std_logic_vector(9 downto 0)
	);
end BCDBIN_Centena;

--arquitetura
architecture Hardware of BCDBIN_Centena is
	signal A,B,C,D: std_logic;
	
begin
	A <= BCD(3);
	B <= BCD(2);
	C <= BCD(1);
	D <= BCD(0);
	
	SW(0) <= '0';
	SW(1) <= '0';
	SW(2) <= D;
	SW(3) <= C;
	SW(4) <= B;
	SW(5) <= A XOR D;
	SW(6) <= (C AND (NOT D)) OR ((NOT A) AND (NOT C) AND D);
	SW(7) <= (B AND (NOT C)) OR (B AND D) OR (A AND D) OR ((NOT B) AND C AND (NOT D));
	SW(8) <= A OR (B AND (NOT C)) OR ((NOT B) AND C AND D);
	SW(9) <= A OR (B AND C);

end Hardware;