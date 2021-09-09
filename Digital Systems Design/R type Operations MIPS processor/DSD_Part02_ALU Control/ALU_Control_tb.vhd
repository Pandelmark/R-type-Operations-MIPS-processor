LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ALU_Control_tb is
end ALU_Control_tb;

architecture test_b of ALU_Control_tb is
signal OP_5to0_1: STD_LOGIC_VECTOR(5 DOWNTO 0);
signal ALU_op1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal Operation1   : STD_LOGIC_VECTOR(3 DOWNTO 0);

component ALU_Control PORT (
    OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

BEGIN
M1: ALU_Control port map (OP_5to0 => OP_5to0_1, ALU_op => ALU_op1, Operation => Operation1);
process 
begin
    ALU_op1 <= "00"; 
    OP_5to0_1 <= "001001";
    wait for 50 ps;

    ALU_op1 <= "00"; 
    OP_5to0_1 <= "001010";
    wait for 50 ps;

    ALU_op1 <= "01"; 
    OP_5to0_1 <= "100111";
    wait for 50 ps;

    ALU_op1 <= "10"; 
    OP_5to0_1 <= "100000";
    wait for 50 ps;

    ALU_op1 <= "10"; 
    OP_5to0_1 <= "100010";
    wait for 50 ps;

    ALU_op1 <= "10"; 
    OP_5to0_1 <= "100100";
    wait for 50 ps;

    ALU_op1 <= "10"; 
    OP_5to0_1 <= "100101";
    wait for 50 ps;

    ALU_op1 <= "10"; 
    OP_5to0_1 <= "101010";
    wait for 50 ps;
end process;
end test_b;