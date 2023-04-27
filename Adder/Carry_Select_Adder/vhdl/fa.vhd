library ieee;

use ieee.std_logic_1164.all;

entity fa is
port ( 	a, b, ci : in std_logic;
	s, co : out std_logic);
end entity fa;

architecture arch_fa of fa is
signal xor_tmp, and_tmp0, and_tmp1 : std_logic;

component and2 is
port (  a, b : in std_logic;
	an : out std_logic);
end component and2;

component or2 is
port (  a, b : in std_logic;
	o : out std_logic);
end component or2;

component xor2 is
port (  a, b : in std_logic;
	xo : out std_logic);
end component xor2;

begin
	s1 : xor2 port map ( a, b, xor_tmp );
	c1 : and2 port map ( a, b, and_tmp0 );

	s2 : xor2 port map ( xor_tmp, ci, s);
	c2 : and2 port map ( xor_tmp, ci, and_tmp1 );

	c3 : or2 port map ( and_tmp0, and_tmp1, co );

end architecture arch_fa;
