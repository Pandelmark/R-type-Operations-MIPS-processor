library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity dataMemory_tb is
end dataMemory_tb;

architecture test_b of dataMemory_tb is
signal Addr1 : std_logic_vector(5 downto 0);
signal writeD1 : std_logic_vector(31 downto 0);
signal we1 : std_logic;
signal re1 : std_logic;
signal clk1 : std_logic;
signal readD1 : std_logic_vector(31 downto 0);

component dataMemory PORT(
	Addr   : in  std_logic_vector(5 downto 0);
	writeD : in  std_logic_vector(31 downto 0);
	we     : in  std_logic;
	re     : in  std_logic;
	clk    : in std_logic;
	readD  : out std_logic_vector(31 downto 0));
end component;

BEGIN
M1 : dataMemory port map (Addr => Addr1, writeD => writeD1, we => we1, re => re1, clk => clk1, readD => readD1);
process
begin
	clk1 <= '1'; wait for 50 ps;
	we1 <= '1'; 
	re1 <= '0';
	Addr1 <= "000000";
	writeD1 <= "01010101010101010101010101010101";
	clk1 <= '0'; wait for 50 ps;
	
	clk1 <= '1'; wait for 50 ps;
	Addr1 <= "000001";
	writeD1 <= "11011101110111011101110111011101";
	clk1 <= '0'; wait for 50 ps;
	
	clk1 <= '1'; wait for 50 ps;
	Addr1 <= "000010";
	writeD1 <= "00100010001000100010001000100010";
	clk1 <= '0'; wait for 50 ps;
	
	clk1 <= '1'; wait for 50 ps;
	Addr1 <= "000011";
	writeD1 <= "10011001100110011001100110011001";
	clk1 <= '0'; wait for 50 ps;
	
	clk1 <= '1'; wait for 50 ps;
	we1 <= '0'; 
	re1 <= '1';
	Addr1 <= "000000";
	clk1 <= '0'; wait for 50 ps;
	
	clk1 <= '1'; wait for 50 ps;
	Addr1 <= "000001";
	clk1 <= '0'; wait for 50 ps;
end process;
end test_b;