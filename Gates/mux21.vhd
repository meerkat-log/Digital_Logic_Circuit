library ieee;

use ieee.std_logic_1164.all;

entity mux21 is
port ( 	d0, d1 : in std_logic_vector(3 downto 0);
	sl : in std_logic;
	ou : out std_logic_vector(3 downto 0));
end entity mux21;

architecture arch_mux21 of mux21 is
signal tmp_out : std_logic_vector(3 downto 0);
begin

	delay_proc : process begin
		wait for 5 ns;
		case sl is
			when '0' => tmp_out <= d0;
			when others => tmp_out <= d1;
		end case;
	end process;

	ou <= tmp_out;

end architecture arch_mux21;
