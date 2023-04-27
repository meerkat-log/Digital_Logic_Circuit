library ieee;

use ieee.std_logic_1164.all;

entity mux21_bit is
port ( 	d0, d1 : in std_logic;
	sl : in std_logic;
	ou : out std_logic);
end entity mux21_bit;

architecture arch_mux21_bit of mux21_bit is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 5 ns;
		case sl is
			when '0' => tmp_out <= d0;
			when others => tmp_out <= d1;
		end case;
	end process;

	ou <= tmp_out;

end architecture arch_mux21_bit;
