library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity MIPS_tb is
end MIPS_tb;

architecture test_b of MIPS_tb is
component MIPS is port(
    Mreset : in std_logic;
    Mclk : in std_logic;
    MInstruction : out std_logic_vector(31 downto 0);
    MrAddr1 : out std_logic_vector(4 downto 0);
    MrAddr2 : out std_logic_vector(4 downto 0);
    MwAddr : out std_logic_vector(4 downto 0);
    Mreg1 : out std_logic_vector(31 downto 0);
    Mreg2 : out std_logic_vector(31 downto 0);
    Mout : out std_logic_vector(31 downto 0));
end component;

signal clk, reset : std_logic;
signal MInstruction1, Mreg11, Mreg21, Mout1 : std_logic_vector(31 downto 0);
signal MrAddr11, MrAddr21, MwAddr1 : std_logic_vector(4 downto 0);

BEGIN
MIPS_MAP : MIPS port map(
	Mclk=>clk, Mreset=>reset, MInstruction=>MInstruction1,
    MrAddr1=>MrAddr11, MrAddr2=>MrAddr21, MwAddr=>MwAddr1,
    Mreg1=>Mreg11, Mreg2=>Mreg21, Mout=>Mout1);
process
begin
    reset<='1';
    clk<='0'; 
    wait for 50 ps; 
    clk<='1'; wait for 50 ps;
    reset<='0';
    clk<='0'; wait for 50 ps; 
    clk<='1'; wait for 50 ps;
    clk<='0'; wait for 50 ps; 
    clk<='1'; wait for 50 ps;
    clk<='0'; wait for 50 ps; 
    clk<='1'; wait for 50 ps;
end process;
end test_b;