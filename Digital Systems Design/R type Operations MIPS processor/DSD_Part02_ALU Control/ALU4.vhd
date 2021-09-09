LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
USE ieee.std_logic_unsigned.all;

entity ALU4 is port (
    ALUin1: in std_logic_vector(3 downto 0);
    ALUin2: in std_logic_vector(3 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout1: out std_logic_vector(3 downto 0);
    zero: out std_logic);
end ALU4;

architecture behavioural of ALU4 is
    signal sig: std_logic_vector(3 downto 0);
begin
process(ALUin1, ALUin2, ALUctrl)
	begin
	case ALUctrl IS
        when "0000" => sig <= ALUin1 AND ALUin2;
	when "0001" => sig <= ALUin1 OR  ALUin2;
	when "0010" => sig <= ALUin1 + ALUin2;
	when "0110" => sig <= ALUin1 - ALUin2 ;
	when "0111" => 
		if ALUin1 < ALUin2 then
			sig <= "0001";
		else
			sig <= "0000";
		end if;
	when others => sig <= sig; 
	end case;
end process;
zero <='1' when sig="0000" else '0';
ALUout1 <= sig; 
end behavioural;