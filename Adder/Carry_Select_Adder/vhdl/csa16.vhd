library ieee;

use ieee.std_logic_1164.all;

entity csa16 is
port ( 	ci : in std_logic;
	a, b : in std_logic_vector(15 downto 0);
	s : out std_logic_vector(15 downto 0);
	co : out std_logic);
end entity csa16;

architecture arch_csa16 of csa16 is
signal c4, c8, c8_tmp0, c8_tmp1, c12, c12_tmp0, c12_tmp1, c16_tmp0, c16_tmp1 : std_logic;
signal s8_tmp0, s8_tmp1, s12_tmp0, s12_tmp1, s16_tmp0, s16_tmp1 : std_logic_vector(3 downto 0);

component mux21_bit is
port ( 	d0, d1 : in std_logic;
	sl : in std_logic;
	ou : out std_logic);
end component mux21_bit;

component mux21 is
port ( 	d0, d1 : in std_logic_vector(3 downto 0);
	sl : in std_logic;
	ou : out std_logic_vector(3 downto 0));
end component mux21;

component fa4 is
port ( 	ci : in std_logic;
	a, b : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0);
	co : out std_logic);
end component fa4;

begin
	a4 : fa4 port map ( ci, a(3 downto 0), b(3 downto 0), s(3 downto 0), c4 );

	a8_0 : fa4 port map ( '0', a(7 downto 4), b(7 downto 4), s8_tmp0, c8_tmp0 );
	a8_1 : fa4 port map ( '1', a(7 downto 4), b(7 downto 4), s8_tmp1, c8_tmp1 );
	m8_s : mux21 port map ( s8_tmp0, s8_tmp1, c4, s(7 downto 4));
	m8_c : mux21_bit port map ( c8_tmp0, c8_tmp1, c4, c8);

	a12_0 : fa4 port map ( '0', a(11 downto 8), b(11 downto 8), s12_tmp0, c12_tmp0 );
	a12_1 : fa4 port map ( '1', a(11 downto 8), b(11 downto 8), s12_tmp1, c12_tmp1 );
	m12_s : mux21 port map ( s12_tmp0, s12_tmp1, c8, s(11 downto 8));
	m12_c : mux21_bit port map ( c12_tmp0, c12_tmp1, c8, c12);

	a16_0 : fa4 port map ( '0', a(15 downto 12), b(15 downto 12), s16_tmp0, c16_tmp0 );
	a16_1 : fa4 port map ( '1', a(15 downto 12), b(15 downto 12), s16_tmp1, c16_tmp1 );
	m16_s : mux21 port map ( s16_tmp0, s16_tmp1, c12, s(15 downto 12));
	m16_c : mux21_bit port map ( c16_tmp0, c16_tmp1, c12, co);

end architecture arch_csa16;
