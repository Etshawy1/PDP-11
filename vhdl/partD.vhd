Library ieee;
use ieee.std_logic_1164.all;

entity partD is 

        GENERIC (n : integer := 16);
	port(
	S1, S0 : in std_logic;
	A, B : in std_logic_vector (n-1 downto 0);
	F : out std_logic_vector (n-1 downto 0);
	COUT : out std_logic);

end entity;

Architecture archD of partD is
begin

	Cout <= '0' when (s1='1')
	else B(n-1);

	F <= (B(n-2 downto 0) & '0')   when (s1='0' and s0='0')
	else (B(n-2 downto 0) & B(n-1)) when (s1='0' and s0='1')
	else A   when (s1='1' and s0='0')
	else (not B);

end Architecture;