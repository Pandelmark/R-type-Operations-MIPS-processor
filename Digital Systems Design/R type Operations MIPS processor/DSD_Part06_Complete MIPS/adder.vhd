library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity adder is port(
	Addin : in std_logic_vector(3 downto 0) := "0000";
	Addout: out std_logic_vector(3 downto 0):= "0000");
end adder;

architecture behavioural of adder is
signal sig : std_logic_vector(3 downto 0) := "0001";

begin
    Addout <= std_logic_vector(unsigned(Addin) + unsigned(sig));
end behavioural;