library ieee;

use ieee.std_logic_1164.all;

entity and2 is
port ( 	a : in std_logic;
	b : in std_logic;
	an : out std_logic);
end entity and2;

architecture arch_and2 of and2 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a and b;
	end process;

	an <= tmp_out;

end architecture arch_and2;
