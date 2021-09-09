LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU4_tb is
end ALU4_tb;

architecture test_b of ALU4_tb is

signal ALUin11 : std_logic_vector (3 downto 0);
signal ALUin21 : std_logic_vector (3 downto 0);
signal ALUctrl1: std_logic_vector (3 downto 0);
signal ALUout1: std_logic_vector(3 downto 0);
signal zero1   : std_logic;

component ALU4 port(
    ALUin1 : in std_logic_vector (3 downto 0);
    ALUin2 : in std_logic_vector (3 downto 0);
    ALUctrl: in std_logic_vector (3 downto 0);
    ALUout1: out std_logic_vector(3 downto 0);
    zero   : out std_logic);
end component;

BEGIN
M1: ALU4 PORT MAP(ALUin1=>ALUin11, ALUin2=>ALUin21, ALUctrl=>ALUctrl1, 
    ALUout1=>ALUout1, zero=>zero1);
process 
begin
    ALUin11 <= "0010";
    ALUin21 <= "0100";
    ALUctrl1<= "0010";
    wait for 50 ps;
    ALUin11 <= "0100";
    ALUin21 <= "1111";
    ALUctrl1<= "0000";
    wait for 50 ps;
    ALUin11 <= "0100";
    ALUin21 <= "1111";
    ALUctrl1<= "0001";
    wait for 50 ps;
    ALUin11 <= "0100";
    ALUin21 <= "0010";
    ALUctrl1<= "0110";
    wait for 50 ps;
    ALUin11 <= "0100";
    ALUin21 <= "0110";
    ALUctrl1<= "0110";
    wait for 50 ps;
    end process;
end test_b;