library ieee;

use ieee.std_logic_1164.all;

entity or2 is
port ( 	a : in std_logic;
	b : in std_logic;
	o : out std_logic);
end entity or2;

architecture arch_or2 of or2 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a or b;
	end process;

	o <= tmp_out;

end architecture arch_or2;
