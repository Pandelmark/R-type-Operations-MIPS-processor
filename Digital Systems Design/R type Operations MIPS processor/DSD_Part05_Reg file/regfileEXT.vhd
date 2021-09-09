-- ?????? 5.4 Register File Extended
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity regfileEXT is
generic (dw : natural:= 4; size : natural:= 4; adrw : natural:= 2);
port( 
	Datain : in  std_logic_vector(dw-1 downto 0); 
	rAddr1 : in  std_logic_vector(adrw-1 downto 0);
	rAddr2 : in  std_logic_vector(adrw-1 downto 0);
	wAddr  : in  std_logic_vector(adrw-1 downto 0);
	we     : in  std_logic;
	clk    : in  std_logic;
	reset  : in  std_logic;
	Dataout1 : out std_logic_vector(dw-1 downto 0);
	Dataout2 : out std_logic_vector(dw-1 downto 0));
end regfileEXT;

ARCHITECTURE behavioural OF regfileEXT IS
type regArray is array(0 to size-1) of std_logic_vector(dw-1 downto 0);
signal regfile : regArray;

BEGIN
process(clk)
begin
if (clk'event and clk='1') then
	if reset ='1' then 
		for i IN 0 TO dw-1 loop
			Dataout1(i)<='0';
			Dataout2(i)<='0';
		end loop; 
	else
		if we='1' then
			regfile(to_integer(unsigned(wAddr))) <= Datain;
		else
			Dataout1 <= regfile(to_integer(unsigned(rAddr1)));
			Dataout2 <= regfile(to_integer(unsigned(rAddr2)));
		end if;
	end if;
end if;
end process;
end behavioural;