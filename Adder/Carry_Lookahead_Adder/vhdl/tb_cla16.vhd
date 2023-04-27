library ieee;

use ieee.std_logic_1164.all;

entity tb_cla16 is
end entity tb_cla16;

architecture arch_tb_cla16 of tb_cla16 is
signal c0_s, c4_s, gg_s, pg_s : std_logic;
signal a_s, b_s, s_s: std_logic_vector(15 downto 0);

component cla16 is
port (  c0 : in std_logic;
	a, b : in std_logic_vector(15 downto 0);
	c4, gg, pg : out std_logic;
	s : out std_logic_vector(15 downto 0));
end component cla16;

begin
	c0_s <= '1';
	a_s <= "0011001100110011";
	b_s <= "1100110011001100";
	u0 : cla16 port map ( c0_s, a_s, b_s, c4_s, gg_s, pg_s, s_s );

end architecture arch_tb_cla16;

