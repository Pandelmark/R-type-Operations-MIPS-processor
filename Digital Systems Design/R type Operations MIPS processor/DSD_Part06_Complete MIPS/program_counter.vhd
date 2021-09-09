LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.alL;

ENTITY program_counter IS PORT (
	Reset, Clock : IN STD_LOGIC;
	PCin : IN STD_LOGIC_VECTOR(3 downto 0):="0000";
	PCout : OUT STD_LOGIC_VECTOR(3 downto 0):="0000");
END program_counter;

ARCHITECTURE Behavioral OF program_counter IS

BEGIN
process(Clock, Reset)
begin
	if(Reset='1') then
		PCout <= (others=>'0');
	elsif(rising_edge(Clock))then 
		PCout <= PCin;           
	end if;				
end process;
end Behavioral;