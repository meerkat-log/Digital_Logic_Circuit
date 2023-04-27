library ieee;

use ieee.std_logic_1164.all;

entity and4 is
port ( 	a, b, c, d : in std_logic;
	an : out std_logic);
end entity and4;

architecture arch_and4 of and4 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a and b and c and d;
	end process;

	an <= tmp_out;

end architecture arch_and4;
