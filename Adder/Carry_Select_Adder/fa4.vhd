library ieee;

use ieee.std_logic_1164.all;

entity fa4 is
port ( 	ci : in std_logic;
	a, b : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0);
	co : out std_logic);
end entity fa4;

architecture arch_fa4 of fa4 is
signal c1, c2, c3 : std_logic;

component fa is
port (  a, b, ci : in std_logic;
	s, co : out std_logic);
end component fa;

begin
	u0 : fa port map ( a(0), b(0), ci, s(0), c1 );
	u1 : fa port map ( a(1), b(1), c1, s(1), c2 );
	u2 : fa port map ( a(2), b(2), c2, s(2), c3 );
	u3 : fa port map ( a(3), b(3), c3, s(3), co );

end architecture arch_fa4;
