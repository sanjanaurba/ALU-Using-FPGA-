LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decode IS
    PORT ( w : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
           En : IN STD_LOGIC;
           y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
         );
END decode;

ARCHITECTURE Behavior OF decode IS
    SIGNAL Enw : STD_LOGIC_VECTOR(3 DOWNTO 0); 
BEGIN
    Enw <= En & w;

    WITH Enw SELECT
        y <= "10000000" WHEN "1000", -- Corresponding to input 000
             "01000000" WHEN "1001", -- Corresponding to input 001
             "00100000" WHEN "1010", -- Corresponding to input 010
             "00010000" WHEN "1011", -- Corresponding to input 011
             "00001000" WHEN "1100", -- Corresponding to input 100
             "00000100" WHEN "1101", -- Corresponding to input 101
             "00000010" WHEN "1110", -- Corresponding to input 110
             "00000001" WHEN "1111", -- Corresponding to input 111
             "00000000" WHEN OTHERS; -- Default case
END Behavior;
