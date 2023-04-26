library ieee;

use ieee.std_logic_1164.all;

entity tb_fa is
end entity tb_fa;

architecture arch_tb_fa of tb_fa is
signal a_s, b_s, ci_s, s_s, co_s : std_logic;

component fa is
port ( 	a, b, ci : in std_logic;
	s, co : out std_logic);
end component fa;

begin
	a_s <= '1';
	b_s <= '1';
	ci_s <= '1';

	fa0 : fa port map ( a_s, b_s, ci_s, s_s, co_s );

end architecture arch_tb_fa;
