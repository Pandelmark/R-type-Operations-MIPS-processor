library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instruction_memory is port (
	Addr : in std_logic_vector(3 downto 0);
	C : out std_logic_vector(31 downto 0)
    );
end instruction_memory;

architecture arch1 of instruction_memory is
type instr_array is array (0 to 15) of std_logic_vector (31 downto 0);
constant instr_mem: instr_array := (
	"00000000010001100010000000100000", --0 add $4, $2, $6
	"00000000010001100010100000100010", --1 sub $5, $2, $6
	"11111111111111111111111111111111", --2
	"00000000000000000000000000000000", --3
	"11111111111111111111111111111111", --4
	"00000000000000000000000000000000", --5
	"00000000101001100010000000100000", --6 add $4, $5, $6
	"11111111111111111111111111111111", --7
	"11111111111111111111111111111111", --8
	"11111111111111111111111111111111", --9
	"11111111111111111111111111111111", --10
	"11111111111111111111111111111111", --11
	"11111111111111111111111111111111", --12
	"11111111111111111111111111111111", --13
	"11111111111111111111111111111111", --14
	"11111111111111111111111111111111"  --15
);
begin
    C <= instr_mem(to_integer(unsigned(Addr)));
end arch1;