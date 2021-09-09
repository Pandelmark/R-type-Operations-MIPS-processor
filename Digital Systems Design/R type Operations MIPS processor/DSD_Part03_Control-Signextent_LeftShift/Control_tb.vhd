LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Control_tb is
end Control_tb;

architecture test_b of Control_tb is
component Control port(
    OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    RegDst, RegWrite, ALUSrc, Branch : OUT STD_LOGIC;
    MemRead, MemWrite, MemtoReg : OUT STD_LOGIC;
    ALU_op: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end component;

signal OP_5to0_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal RegDst1, RegWrite1, ALUSrc1, Branch1 : STD_LOGIC;
signal MemRead1, MemWrite1, MemtoReg1 : STD_LOGIC;
signal ALU_op1 : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
M1 : Control port map(OP_5to0 => OP_5to0_1, RegDst => RegDst1, RegWrite => RegWrite1,
ALUSrc => ALUSrc1, Branch => Branch1, MemRead => MemRead1,
MemWrite => MemWrite1, MemtoReg => MemtoReg1, ALU_op => ALU_op1);
process
begin
    OP_5to0_1 <= "000000"; wait for 50 ps;
    OP_5to0_1 <= "100011"; wait for 50 ps;
    OP_5to0_1 <= "101011"; wait for 50 ps;
    OP_5to0_1 <= "000100"; wait for 50 ps;
end process;
end test_b;