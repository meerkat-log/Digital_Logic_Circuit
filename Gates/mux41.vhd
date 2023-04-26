library ieee;

use ieee.std_logic_1164.all;

entity mux41 is
port ( 	d0 : in std_logic;
	d1 : in std_logic;
	d2 : in std_logic;
	d3 : in std_logic;

	sl : in std_logic_vector(0 to 1);

	ou : out std_logic);
end entity mux41;

architecture arch_mux41 of mux41 is
signal tmp_out : std_logic;
begin

	delay_proc : process begin
		wait for 5 ns;
		case sl is
			when "00" => tmp_out <= d0;
			when "01" => tmp_out <= d1;
			when "10" => tmp_out <= d2;
			when others => tmp_out <= d3;
		end case;
	end process;

	ou <= tmp_out;

end architecture arch_mux41;