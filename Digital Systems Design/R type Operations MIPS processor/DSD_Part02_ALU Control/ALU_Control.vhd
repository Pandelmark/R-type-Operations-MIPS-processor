LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU_Control IS PORT (
    OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    ALU_op: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU_Control;

architecture behavioural of ALU_Control is
    signal OP_5to0_sig: STD_LOGIC_VECTOR(3 downto 0);
    signal ALU_op_sig: STD_LOGIC_VECTOR(3 downto 0);
begin
with OP_5to0(3 downto 0) select
OP_5to0_sig <=
    "0010" when "0000",
    "0110" when "0010",
    "0000" when "0100",
    "0001" when "0101",
    "0111" when "1010",
    "1111" when others;
with ALU_op select
ALU_op_sig <=
    "0010" when "00",
    "0110" when "01",
    "1111" when others;
with ALU_op select
Operation <=
    OP_5to0_sig when "10",
    ALU_op_sig  when others;
end behavioural;