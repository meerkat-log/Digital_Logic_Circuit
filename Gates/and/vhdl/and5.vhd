library ieee;

use ieee.std_logic_1164.all;

entity and5 is
port ( 	a, b, c, d, e : in std_logic;
	an : out std_logic);
end entity and5;

architecture arch_and5 of and5 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a and b and c and d and e;
	end process;

	an <= tmp_out;

end architecture arch_and5;
