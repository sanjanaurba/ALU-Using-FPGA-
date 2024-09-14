LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU_2 IS
    PORT (
        Clk : IN STD_LOGIC;
        A, B : IN UNSIGNED(7 DOWNTO 0);
        OP : IN UNSIGNED(15 DOWNTO 0);
        Neg : OUT STD_LOGIC;
        R1 : OUT UNSIGNED(3 DOWNTO 0);
        R2 : OUT UNSIGNED(3 DOWNTO 0)
    );
END ALU_2;

ARCHITECTURE calculation OF ALU_2 IS
    SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    Reg1 <= A;
    Reg2 <= B;
    
    PROCESS(Clk, OP)
    BEGIN
        IF RISING_EDGE(Clk) THEN
            CASE OP IS
                WHEN "0000000000000001" => 
                    Result <= Reg1 ROR 4;     --1: Rotate A to right by 4 bits (ROR)
                WHEN "0000000000000010" => 
                    Result <= Reg1 XOR Reg2;    --2: XOR A with B
                WHEN "0000000000000100" => 
                    FOR i IN 0 TO 7 LOOP            --3: Invert the bit-significance order of B
                        Result(i) <= Reg2(7 - i);
                    END LOOP;
                WHEN "0000000000001000" => 
                    Result <= Reg1 + Reg2 - "00000010"; --4: Calculate the summation of A and B and decrease it by 2
                WHEN "0000000000010000" => 
                    Result <= Reg2 ROL 2;                --5: Rotate B to left by 2 bits (ROL)
                WHEN "0000000000100000" =>              --6: Invert the even bits of B
                    Result <= Reg2 XOR "01010101";
                WHEN "0000000001000000" => 
                    Result(3 DOWNTO 0) <= Reg1(3 DOWNTO 0); --7: Swap the lower 4 bits of B with lower 4 bits of A
                    Result(7 DOWNTO 4) <= Reg2(7 DOWNTO 4);
                WHEN "0000000010000000" => 
                    Result <= Reg2 SRL 2;               --8: Shift B to right by 2 bits, input bit = 0 (SHR)
                WHEN "0000000100000000" => 
                    Result(3 DOWNTO 0) <= NOT Reg1(3 DOWNTO 0); --9: Invert lower four bits of A
                    Result(7 DOWNTO 4) <= Reg1(7 DOWNTO 4);
                WHEN OTHERS => 
                    Result <= (OTHERS => '0');
            END CASE;
        END IF;
    END PROCESS;
    
    R1 <= Result(3 DOWNTO 0);
    R2 <= Result(7 DOWNTO 4);
END calculation;