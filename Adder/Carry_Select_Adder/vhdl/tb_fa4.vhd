library ieee;

use ieee.std_logic_1164.all;

entity tb_fa4 is
end entity tb_fa4;

architecture arch_tb_fa4 of tb_fa4 is
signal a_s, b_s, s_s : std_logic_vector(3 downto 0);
signal ci_s, co_s : std_logic;

component fa4 is
port ( 	ci : in std_logic;
	a, b : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0);
	co : out std_logic);
end component fa4;

begin
	fa0 : fa4 port map ( ci_s, a_s, b_s, s_s, co_s );

	a_s <= "0110";
	b_s <= "1001";
	ci_s <= '0';

end architecture arch_tb_fa4;
