library ieee;

use ieee.std_logic_1164.all;

entity or3 is
port ( 	a, b, c: in std_logic;
	o : out std_logic);
end entity or3;

architecture arch_or3 of or3 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a or b or c;
	end process;

	o <= tmp_out;

end architecture arch_or3;
