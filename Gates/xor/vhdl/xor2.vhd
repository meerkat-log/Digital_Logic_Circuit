library ieee;

use ieee.std_logic_1164.all;

entity xor2 is
port ( a : in std_logic;
b : in std_logic;
xo : out std_logic);
end entity xor2;

architecture arch_xor2 of xor2 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 5 ns;
		tmp_out <= a xor b;
	end process;

	xo <= tmp_out;

end architecture arch_xor2;