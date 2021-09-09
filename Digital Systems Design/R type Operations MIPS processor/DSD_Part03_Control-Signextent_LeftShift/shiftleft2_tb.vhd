LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity shiftleft2_tb is
end shiftleft2_tb;

architecture test_b of shiftleft2_tb is
component shiftleft2 is port(
	In1 : in  std_logic_vector(31 downto 0);
	d : out std_logic_vector(31 downto 0));
end component;

signal In11 : std_logic_vector(31 downto 0);
signal d1 : std_logic_vector(31 downto 0);
BEGIN
M1 : shiftleft2 port map(In1 => In11, d => d1);
process
begin
	In11 <= x"0000AAAF"; wait for 50 ns;
	In11 <= x"FFFFAAFF"; wait for 50 ns;
end process;
end test_b;
	