library ieee;

use ieee.std_logic_1164.all;

entity or5 is
port ( 	a, b, c, d, e : in std_logic;
	o : out std_logic);
end entity or5;

architecture arch_or5 of or5 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 10 ns;
		tmp_out <= a or b or c or d or e;
	end process;

	o <= tmp_out;

end architecture arch_or5;
