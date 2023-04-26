library ieee;

use ieee.std_logic_1164.all;

entity cla16 is
port ( 	c0 : in std_logic;
	a, b : in std_logic_vector(15 downto 0);
	c4, gg, pg : out std_logic;
	s : out std_logic_vector(15 downto 0));
end entity cla16;

architecture arch_cla16 of cla16 is
signal c1, c2, c3, p0, p1, p2, p3, g0, g1, g2, g3: std_logic;
signal carry1_tmp0 : std_logic;
signal carry2_tmp0, carry2_tmp1: std_logic;
signal carry3_tmp0, carry3_tmp1, carry3_tmp2 : std_logic;
signal carry4_tmp0, carry4_tmp1, carry4_tmp2, carry4_tmp3 : std_logic;
signal gg_tmp0, gg_tmp1, gg_tmp2 : std_logic;

component and2 is
port (  a, b : in std_logic;
	an : out std_logic);
end component and2;
component and3 is
port (  a, b, c : in std_logic;
	an : out std_logic);
end component and3;
component and4 is
port (  a, b, c, d : in std_logic;
	an : out std_logic);
end component and4;
component and5 is
port (  a, b, c, d, e : in std_logic;
	an : out std_logic);
end component and5;

component or2 is
port (  a, b : in std_logic;
	o : out std_logic);
end component or2;
component or3 is
port (  a, b, c : in std_logic;
	o : out std_logic);
end component or3;
component or4 is
port (  a, b, c, d: in std_logic;
	o : out std_logic);
end component or4;
component or5 is
port (  a, b, c, d, e : in std_logic;
	o : out std_logic);
end component or5;

component cla4 is
port (  c0 : in std_logic;
	a, b : in std_logic_vector(3 downto 0);
	c4, gg, pg : out std_logic;
	s : out std_logic_vector(3 downto 0));
end component cla4;

begin
	cla0 : cla4 port map ( c0, a(3 downto 0), b(3 downto 0), c1, g0, p0, s(3 downto 0));
	cla1 : cla4 port map ( c1, a(7 downto 4), b(7 downto 4), c2, g1, p1, s(7 downto 4));
	cla2 : cla4 port map ( c2, a(11 downto 8), b(11 downto 8), c3, g2, p2, s(11 downto 8));
	cla3 : cla4 port map ( c3, a(15 downto 12), b(15 downto 12), c4, g3, p3, s(15 downto 12));

	carry1_0 : and2 port map ( p0, c0, carry1_tmp0);
	carry1_1 : or2 port map ( g0, carry1_tmp0, c1);

	carry2_0 : and2 port map ( p1, g0, carry2_tmp0);
	carry2_1 : and3 port map ( p1, p0, c0, carry2_tmp1);
	carry2_2 : or3 port map ( g1, carry2_tmp0, carry2_tmp1, c2);

	carry3_0 : and2 port map ( p2, g1, carry3_tmp0);
	carry3_1 : and3 port map ( p2, p1, g0, carry3_tmp1 );
	carry3_2 : and4 port map ( p2, p1, p0, c0, carry3_tmp2);
	carry3_4 : or4 port map ( g2, carry3_tmp0, carry3_tmp1, carry3_tmp2, c3);

	carry4_0 : and2 port map ( p3, g2, carry4_tmp0 );
	carry4_1 : and3 port map ( p3, p2, g1, carry4_tmp1 );
	carry4_2 : and4 port map ( p3, p2, p1, g0,carry4_tmp2 );
	carry4_3 : and5 port map ( p3, p2, p1, p0, c0,carry4_tmp3 );
	carry4_4 : or5 port map ( g3,carry4_tmp0, carry4_tmp1, carry4_tmp2, carry4_tmp3, c4);

	pg0 : and4 port map ( p0, p1, p2, p3, pg );
	
	gg_0 : and2 port map ( p3, g2, gg_tmp0 );
	gg_1 : and3 port map ( p3, p2, g1, gg_tmp1 );
	gg_2 : and4 port map ( p3, p2, p1, g0, gg_tmp2 );
	gg_3 : or4 port map ( g3, gg_tmp0, gg_tmp1, gg_tmp2, gg);

end architecture arch_cla16;
