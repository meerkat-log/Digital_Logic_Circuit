library ieee;

use ieee.std_logic_1164.all;

entity tb_cla4 is
end entity tb_cla4;

architecture arch_tb_cla4 of tb_cla4 is
signal c0_s, c4_s, gg_s, pg_s : std_logic;
signal a_s, b_s, s_s: std_logic_vector(3 downto 0);

component cla4 is
port (  c0 : in std_logic;
	a, b : in std_logic_vector(3 downto 0);
	c4, gg, pg : out std_logic;
	s : out std_logic_vector(3 downto 0));
end component cla4;

begin
	c0_s <= '0';
	a_s <= "1001";
	b_s <= "0110";
	u0 : cla4 port map ( c0_s, a_s, b_s, c4_s, gg_s, pg_s, s_s );

end architecture arch_tb_cla4;

