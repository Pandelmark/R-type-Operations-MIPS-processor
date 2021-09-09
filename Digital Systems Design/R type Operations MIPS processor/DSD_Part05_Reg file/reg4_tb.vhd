LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity reg4_tb is
end reg4_tb;

architecture test_b of reg4_tb is
signal D1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Resetn1, Clock1 : STD_LOGIC;
signal Q1 : STD_LOGIC_VECTOR(3 DOWNTO 0);

component reg4 PORT(
	D: 		    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Resetn, Clock: IN STD_LOGIC;
	Q: 		    OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

BEGIN
M1 : reg4 PORT MAP(D => D1, Resetn => Resetn1, Clock => Clock1, Q => Q1);
process
begin
	Resetn1 <= '1';
	Clock1 <= '0';
	wait for 50 ps;
	
	D1 <= "0010";
	Clock1 <= '1';
	wait for 50 ps;
	Clock1 <= '0';
	wait for 50 ps;
	
	D1 <= "1110";
	Clock1 <= '1';
	wait for 50 ps;
	Clock1 <= '0';
	wait for 50 ps;
	
	D1 <= "1010";
	Clock1 <= '1';
	wait for 50 ps;
	Clock1 <= '0';
	wait for 50 ps;
end process;
end test_b;