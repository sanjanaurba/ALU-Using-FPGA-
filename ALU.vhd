LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS
    PORT (
        Clk : IN STD_LOGIC;
        A, B : IN UNSIGNED(7 DOWNTO 0);
        OP : IN UNSIGNED(15 DOWNTO 0);
        Neg : OUT STD_LOGIC;
        R1, R2 : OUT UNSIGNED(3 DOWNTO 0)
    );
END ALU;

ARCHITECTURE Calculation OF ALU IS
    SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    Reg1 <= A;
    Reg2 <= B;
    PROCESS(Clk, OP)
    BEGIN
        IF RISING_EDGE(Clk) THEN
            CASE OP IS
                WHEN "0000000000000001" =>
                    Result <= Reg1 + Reg2;
                    Neg <= '0';
                WHEN "0000000000000010" =>
                    IF Reg1 > Reg2 THEN
                        Result <= Reg1 - Reg2;
                        Neg <= '0';
                    ELSIF Reg2 > Reg1 THEN
                        Result <= Reg1 + (NOT Reg2 + 1);
                        Neg <= '1';
                    END IF;
                WHEN "0000000000000100" =>
                    Result <= NOT Reg1;
                    Neg <= '0';
                WHEN "0000000000001000" =>
                    Result <= Reg1 NAND Reg2;
                    Neg <= '0';
                WHEN "0000000000010000" =>
                    Result <= Reg1 NOR Reg2;
                    Neg <= '0';
                WHEN "0000000000100000" =>
                    Result <= Reg1 AND Reg2;
                    Neg <= '0';
                WHEN "0000000001000000" =>
                    Result <= Reg1 XOR Reg2;
                    Neg <= '0';
                WHEN "0000000010000000" =>
                    Result <= Reg1 OR Reg2;
                    Neg <= '0';
                WHEN "0000000100000000" =>
                    Result <= Reg1 XNOR Reg2;
                    Neg <= '0';
                WHEN OTHERS =>
                    -- nothing
            END CASE;
        END IF;
    END PROCESS;
    
    R1 <= Result(3 DOWNTO 0);
    R2 <= Result(7 DOWNTO 4);
END Calculation;
