library ieee;

use ieee.std_logic_1164.all;

entity not1 is
port ( 	a : in std_logic;
	no : out std_logic);
end entity not1;

architecture arch_not1 of not1 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 5 ns;
		tmp_out <= not a;
	end process;

	no <= tmp_out;

end architecture arch_not1;
