library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Instruction_memory_tb is
end Instruction_memory_tb;

architecture test_b of Instruction_memory_tb is
signal Addr1 : std_logic_vector(3 downto 0);
signal C1 : std_logic_vector(31 downto 0);

component Instruction_memory PORT(
	Addr : in std_logic_vector(3 downto 0);
	C : out std_logic_vector(31 downto 0));
end component;

BEGIN
M1 : Instruction_memory port map (Addr => Addr1, C => C1);
process
begin
	Addr1 <= "0000"; wait for 50 ps;
	Addr1 <= "0001"; wait for 50 ps;
	Addr1 <= "0110"; wait for 50 ps;
end process;
end test_b;