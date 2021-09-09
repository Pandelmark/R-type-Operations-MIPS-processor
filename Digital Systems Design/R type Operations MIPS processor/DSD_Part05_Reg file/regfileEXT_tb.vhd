-- ?????? 5.5 Register File Extended Testbench
library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity regfileEXT_tb IS
generic ( dw : natural := 4; size : natural := 4; adrw : natural := 2);
end regfileEXT_tb;

ARCHITECTURE test_b OF regfileEXT_tb IS

component regfileEXT PORT(
	Datain : in std_logic_vector(dw-1 downto 0);
	rAddr1: in std_logic_vector(adrw-1 downto 0);
	rAddr2: in std_logic_vector(adrw-1 downto 0);
	wAddr : in std_logic_vector(adrw-1 downto 0);
	we : in std_logic;
	clk : in std_logic;
	reset : in std_logic; 
	Dataout1 : out std_logic_vector(dw-1 downto 0);
	Dataout2 : out std_logic_vector(dw-1 downto 0));
end component;

signal Datain1: std_logic_vector(dw-1 downto 0);
signal rAddr11: std_logic_vector(adrw-1 downto 0);
signal rAddr21: std_logic_vector(adrw-1 downto 0);
signal wAddr1: std_logic_vector(adrw-1 downto 0);
signal WE1: std_logic;
signal CLK1: std_logic;
signal RESET1: std_logic;
signal Dataout11: std_logic_vector(dw-1 downto 0);
signal Dataout21: std_logic_vector(dw-1 downto 0);
constant ClockPeriod: time:= 50 ps;
type regArray is array(0 to size-1) of std_logic_vector(dw-1 downto 0);
signal regfileEXT_tb : regArray;

BEGIN
M: regfileEXT PORT MAP(Dataout2=>Dataout21, Dataout1=>Dataout11, Datain=>Datain1, rAddr1=>rAddr11, rAddr2 => rAddr21,
wAddr=>wAddr1, we=>WE1, clk=>CLK1, reset => RESET1);
CLK1<= not CLK1 after ClockPeriod/2;
process
begin
	WE1<='1'; wait for 10 ps;
	Datain1<="0101"; wait for 10 ps;
	wAddr1<="00"; wait for 10 ps;
	regfileEXT_tb(to_integer(unsigned(wAddr1))) <= Datain1;
	wait for 70 ps;

	Datain1<="1101"; wait for 10 ps;
	wAddr1<="01"; wait for 10 ps;
	regfileEXT_tb(to_integer(unsigned(wAddr1))) <= Datain1;
	wait for 80 ps;
	
	Datain1<="0010"; wait for 10 ps;
	wAddr1<="10"; wait for 10 ps;
	regfileEXT_tb(to_integer(unsigned(wAddr1))) <= Datain1;
	wait for 80 ps;

	Datain1<="1001"; wait for 10 ps;
	wAddr1<="11"; wait for 10 ps;
	regfileEXT_tb(to_integer(unsigned(wAddr1))) <= Datain1;
	wait for 80 ps;

	WE1<='0'; wait for 10 ps;
	rAddr11<="00"; wait for 10 ps;
	rAddr21<="10"; wait for 10 ps;
	wait for 70 ps;

	rAddr11<="01"; wait for 10 ps;
	rAddr21<="10"; wait for 10 ps;
	wait for 80 ps;

	RESET1<='1'; 
	wait for 50 ps;
end process;
end test_b;