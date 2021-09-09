LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity TEST_ALUCONTROL_ALU_tb is
end TEST_ALUCONTROL_ALU_tb;

architecture test_b of TEST_ALUCONTROL_ALU_tb is
component TEST_ALUCONTROL_ALU port(
    OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    ALUin1: in std_logic_vector(3 downto 0);
    ALUin2: in std_logic_vector(3 downto 0);
    ALUout1: out std_logic_vector(3 downto 0);
    zero: out std_logic);
end component;

signal OP_5to0_tb:  STD_LOGIC_VECTOR(5 DOWNTO 0);
signal ALU_op_tb :  STD_LOGIC_VECTOR(1 DOWNTO 0);
signal ALUin1_tb :  std_logic_vector(3 downto 0);
signal ALUin2_tb :  std_logic_vector(3 downto 0);
signal ALUout1_tb:  std_logic_vector(3 downto 0);
signal zero_tb   :  std_logic;

begin
M1: TEST_ALUCONTROL_ALU port map(
OP_5to0=>OP_5to0_tb, ALU_op=>ALU_op_tb, ALUin1=>ALUin1_tb,
ALUin2=>ALUin2_tb, ALUout1=>ALUout1_tb, zero=>zero_tb);
process
begin
    ALUin1_tb<="1100";
    ALUin2_tb<="1100";
    ALU_op_tb<="00"; 
    OP_5to0_tb<="001001";
    wait for 50 ps;
	
    ALU_op_tb<="00"; 
    OP_5to0_tb<="001010";
    wait for 50 ps;
	
    ALU_op_tb<="01"; 
    OP_5to0_tb<="100111";
    wait for 50 ps;
    
    ALU_op_tb<="10"; 
    OP_5to0_tb<="100000";
    wait for 50 ps;
	
    ALU_op_tb<="10"; 
    OP_5to0_tb<="100010";
    wait for 50 ps;
	
    ALU_op_tb<="10"; 
    OP_5to0_tb<="100100";
    wait for 50 ps;
	
    ALU_op_tb<="10"; 
    OP_5to0_tb<="100101";
    wait for 50 ps;
	
    ALU_op_tb<="10"; 
    OP_5to0_tb<="101010";
    wait for 50 ps;
end process;
end test_b;