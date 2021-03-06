Library ieee;
use ieee.std_logic_1164.all;

entity partA is 
   GENERIC (n : integer := 16);
   port(
	CIN, S1, S0 : in std_logic;
	A, B : in std_logic_vector (n-1 downto 0);
	F : out std_logic_vector (n-1 downto 0);
	COUT : out std_logic);

end entity;

Architecture archA of partA is
	
    COMPONENT adder_nbits IS
         GENERIC (n : integer := 16);
 	     PORT(a, b : IN std_logic_vector(n-1 DOWNTO 0);
         	  cin : IN std_logic;
                  s : OUT std_logic_vector(n-1 DOWNTO 0);
	          cout : OUT std_logic);
    END COMPONENT;
    SIGNAL tempB, tempSum : std_logic_vector(n-1 DOWNTO 0);
    SIGNAL tempCin, tempCout: std_logic;
begin

   tempB <= (others => '0') when (s1='0' and s0='0')
       else (others => '1') when (s1='0' and s0='1') 
       else B; 	
   
   tempCin <= '1' when (s1='0' and s0='0')
       else CIN when (s1='1' and s0='1') 
       else '0'; 			
    
   f0: adder_nbits generic map(n) port map (A, tempB, tempCin, tempSum, tempCout);     
    
   COUT <= tempCout;
   F <= tempSum;	
end Architecture;
