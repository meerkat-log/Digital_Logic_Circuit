library ieee;

use ieee.std_logic_1164.all;

entity tb_pfa is
end entity tb_pfa;

architecture arch_tb_pfa of tb_pfa is
signal a_s, b_s, c_s, s_s, g_s, p_s : std_logic;

component pfa is
port (  a, b, c : in std_logic;
	s, g, p : out std_logic);
end component pfa;

begin
	c_s <= '1';

	u0 : pfa port map ( a_s, b_s, c_s, s_s, g_s, p_s );

	proc_a : process begin
		a_s <= '0';
		wait for 10 ns;
		a_s <= '1';
		wait for 10 ns;
	end process;

	proc_b : process begin
		b_s <= '0';
		wait for 20 ns;
		b_s <= '1';
		wait for 20 ns;
	end process;


end architecture arch_tb_pfa;

