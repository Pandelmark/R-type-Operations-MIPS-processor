LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg4 IS PORT ( 	
 D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 Resetn, Clock : IN STD_LOGIC;
 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END reg4;

ARCHITECTURE behavioral OF reg4 IS	
BEGIN
 PROCESS (Resetn, Clock)
  BEGIN
  IF Resetn = '0' THEN
   Q <= "0000" ;
  ELSIF rising_edge(Clock) THEN
   Q <= D;
  END IF;
 END PROCESS;
END behavioral;
