library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity MIPS is 
port(
    Mreset : in std_logic;
    Mclk : in std_logic;
    MInstruction : out std_logic_vector(31 downto 0);
    MrAddr1 : out std_logic_vector(4 downto 0);
    MrAddr2 : out std_logic_vector(4 downto 0);
    MwAddr : out std_logic_vector(4 downto 0);
    Mreg1 : out std_logic_vector(31 downto 0);
    Mreg2 : out std_logic_vector(31 downto 0);
    Mout : out std_logic_vector(31 downto 0));
end MIPS;

architecture mips_x of MIPS is

component ALU32 port(
    ALUin1: in std_logic_vector(31 downto 0);
    ALUin2: in std_logic_vector(31 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout1: out std_logic_vector(31 downto 0);
    zero: out std_logic);
end component;
	
component regfileEXT
generic (dw : natural := 32; size : natural := 32; adrw : natural := 5);
port(
	Datain : in std_logic_vector(dw-1 downto 0);
	rAddr1 : in std_logic_vector(adrw-1 downto 0);
	rAddr2 : in std_logic_vector(adrw-1 downto 0);
	wAddr  : in std_logic_vector(adrw-1 downto 0);
	we     : in std_logic;
	clk    : in std_logic;
	reset  : in std_logic;
	Dataout1 : out std_logic_vector(dw-1 downto 0);
	Dataout2 : out std_logic_vector(dw-1 downto 0));
end component;

component instruction_memory port(
	Addr : in std_logic_vector(3 downto 0);
	C : out std_logic_vector(31 downto 0));
end component;

component Control port(
	OP_5to0: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	RegDst, RegWrite, ALUSrc, Branch: OUT STD_LOGIC;
	MemRead, MemWrite, MemtoReg:      OUT STD_LOGIC;
	ALU_op: OUT std_logic_vector(1 downto 0));
end component;

component ALU_Control port(
	OP_5to0: IN std_logic_vector(5 downto 0);
	ALU_op: IN std_logic_vector(1 downto 0);
	Operation: OUT std_logic_vector(3 downto 0));
end component;

component program_counter port(
	Clock : in std_logic;
	Reset : in std_logic;
	PCin: in std_logic_vector(3 downto 0);
	PCout : out std_logic_vector(3 downto 0));
end component;

component adder port(
	Addin : in  std_logic_vector(3 downto 0);
	Addout: out std_logic_vector(3 downto 0));
end component;

signal ADDERtoPC  : std_logic_vector(3 downto 0);
signal PCout1   : std_logic_vector(3 downto 0);
signal instr31to0 : std_logic_vector(31 downto 0);
signal RegDst1, RegWrite1, ALUSrc1, Branch1: STD_LOGIC;
signal MemRead1, MemWrite1, MemtoReg1      : STD_LOGIC;
signal ALU_op1 : std_logic_vector(1 downto 0);
signal REGout1 : std_logic_vector(31 downto 0);
signal REGout2 : std_logic_vector(31 downto 0);
signal Operation1 : std_logic_vector(3 downto 0);
signal ALUout11 : std_logic_vector(31 downto 0);
signal ALUzero : std_logic;
begin
ADDER_MAP : adder port map(Addin=>PCout1, Addout=>ADDERtoPC);
	
PC_MAP : program_counter port map(Clock=>Mclk, Reset=>Mreset, PCin=>ADDERtoPC, PCout=>PCout1);
	
INSTR_MAP : instruction_memory port map(Addr=>PCout1, C=>INSTR31to0);
	
CONTROL_MAP : Control port map(
    OP_5to0=>INSTR31to0(31 downto 26),
    RegDst=>RegDst1, 
    RegWrite=>RegWrite1, 
    ALUSrc=>ALUSrc1, 
    Branch=>Branch1, 
    MemRead=>MemRead1, 
    MemWrite=>MemWrite1,
    MemtoReg=>MemtoReg1, 
    ALU_op=>ALU_op1);		

REG_MAP : regfileEXT port map(
    Datain=>ALUout11,
    rAddr1=>INSTR31to0(25 downto 21),
    rAddr2=>INSTR31to0(20 downto 16),
    wAddr =>INSTR31to0(15 downto 11),
    we=>RegWrite1, 
    clk=>Mclk, 
    reset=>Mreset,
    Dataout1=>REGout1, 
    Dataout2=>REGout2);	

ALUControl_MAP : ALU_Control port map(
    OP_5to0=>INSTR31to0(5 downto 0), 
    ALU_op=>ALU_op1, 
    Operation=>Operation1);

ALU32_MAP : ALU32 port map(
    ALUin1=>REGout1, 
    ALUin2=>REGout2, 
    ALUctrl=>Operation1,
    ALUout1=>ALUout11, 
    zero=>ALUzero);
	
MInstruction <= INSTR31to0;
MrAddr1 <= INSTR31to0(25 downto 21);
MrAddr2 <= INSTR31to0(20 downto 16);
MwAddr <= INSTR31to0(15 downto 11);
Mreg1 <= REGout1; 
Mreg2 <= REGout2; 
Mout <= ALUout11;
end mips_x;