library ieee;

use ieee.std_logic_1164.all;

entity pfa is
port ( 	a, b, c: in std_logic;
	s, g, p : out std_logic);
end entity pfa;

architecture arch_pfa of pfa is
signal tmp : STD_LOGIC;

component xor2 is
port ( a, b : in std_logic;
xo : out std_logic);
end component xor2;

component and2 is
port ( a, b : in std_logic;
an : out std_logic);
end component and2;

begin
	u0 : and2 port map ( a, b, g );
	u1 : xor2 port map ( a, b, tmp );	
	u2 : xor2 port map ( tmp, c, s );
	p <= tmp;

end architecture arch_pfa;