LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shiftleft2 is port ( 
  In1: in  std_logic_vector(31 downto 0);  
  d:   out std_logic_vector(31 downto 0)); 
end shiftleft2;

architecture behavioural of shiftleft2 is

BEGIN
	d <= In1(29 downto 0) & "00";
end behavioural;