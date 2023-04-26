library ieee;

use ieee.std_logic_1164.all;

entity and3 is
port ( 	a, b, c : in std_logic;
	an : out std_logic);
end entity and3;

architecture arch_and3 of and3 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a and b and c;
	end process;

	an <= tmp_out;

end architecture arch_and3;