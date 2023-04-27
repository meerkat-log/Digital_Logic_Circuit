library ieee;

use ieee.std_logic_1164.all;

entity or4 is
port ( 	a, b, c, d : in std_logic;
	o : out std_logic);
end entity or4;

architecture arch_or4 of or4 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a or b or c or d;
	end process;

	o <= tmp_out;

end architecture arch_or4;
