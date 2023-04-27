library ieee;

use ieee.std_logic_1164.all;

entity tb_csa16 is
end entity tb_csa16;

architecture arch_tb_csa16 of tb_csa16 is
signal a_s, b_s, s_s : std_logic_vector(15 downto 0);
signal ci_s, co_s : std_logic;

component csa16 is
port ( 	ci : in std_logic;
	a, b : in std_logic_vector(15 downto 0);
	s : out std_logic_vector(15 downto 0);
	co : out std_logic);
end component csa16;

begin
	fa0 : csa16 port map ( ci_s, a_s, b_s, s_s, co_s );

	a_s <= "1100101010101100";
	b_s <= "0100010101001101";
	ci_s <= '1';

end architecture arch_tb_csa16;
