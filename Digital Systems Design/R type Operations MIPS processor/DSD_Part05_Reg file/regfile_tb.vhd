library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity regfile_tb is
end regfile_tb;

architecture test_b of regfile_tb is
component regfile port(
	Datain  : in  std_logic_vector(3 downto 0);
    Addr    : in  std_logic_vector(2 downto 0);
    we      : in  std_logic;
    clk     : in  std_logic;
    Dataout : out std_logic_vector(3 downto 0));
end component;

signal Datain1 : std_logic_vector(3 downto 0);
signal Addr1    : std_logic_vector(2 downto 0);
signal we1      : std_logic;
signal clk1     : std_logic;
signal Dataout1 : std_logic_vector(3 downto 0);
constant ClockPeriod: time:= 10 ps;
type regArray is array(0 to 7) of std_logic_vector(3 downto 0);
signal regfile_tb : regArray;

BEGIN
M1 : regfile port map(Datain => Datain1, Addr => Addr1, we => we1, clk => clk1, Dataout => Dataout1);
CLK1<= not CLK1 after ClockPeriod/2;
process
begin
	we1 <= '1'; wait for 10 ps;
	Datain1 <= "0101"; wait for 10 ps;
	Addr1 <= "000"; wait for 10 ps;
	regfile_tb(to_integer(unsigned(Addr1))) <= Datain1;
	wait for 70 ps;
	
	Datain1 <= "1101"; wait for 10 ps;
	Addr1 <= "001"; wait for 10 ps;
	regfile_tb(to_integer(unsigned(Addr1))) <= Datain1;
	wait for 80 ps;
	
	Datain1 <= "0010"; wait for 10 ps;
	Addr1 <= "010"; wait for 10 ps;
	regfile_tb(to_integer(unsigned(Addr1))) <= Datain1;
	wait for 80 ps;
	
	Datain1 <= "1001"; wait for 10 ps;
	Addr1 <= "011"; wait for 10 ps;
	regfile_tb(to_integer(unsigned(Addr1))) <= Datain1;
	wait for 80 ps;
end process;
end test_b;