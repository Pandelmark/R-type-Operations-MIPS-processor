LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SIGN_Extension_tb is
end SIGN_Extension_tb;

architecture test_b of SIGN_Extension_tb is
component SIGN_Extension is port(
    Instr_15to0 : in std_logic_vector (15 downto 0);
    Sign_extended: out std_logic_vector (31 downto 0));
end component;

signal Instr_15to0_1 : std_logic_vector (15 downto 0);
signal Sign_extended1 : std_logic_vector (31 downto 0);
BEGIN
M1 : SIGN_Extension port map(Instr_15to0 => Instr_15to0_1, Sign_extended => Sign_extended1);
process
begin
    Instr_15to0_1 <= x"0010"; wait for 50 ps;
    Instr_15to0_1 <= x"1001"; wait for 50 ps;
    Instr_15to0_1 <= x"80A0"; wait for 50 ps;
end process;
end test_b;