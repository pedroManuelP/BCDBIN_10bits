--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity somadorCompleto is
	port(
		a,b: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic
	);

end somadorCompleto;

--arquitetura
architecture comportamento of somadorCompleto is
begin
	s <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);

end comportamento;