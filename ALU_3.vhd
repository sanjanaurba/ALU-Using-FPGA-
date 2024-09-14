LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_3 IS
    PORT(
        Clk : IN std_logic;
        A, B : IN unsigned(7 DOWNTO 0);
        Student_id : IN unsigned (3 DOWNTO 0);
        Op : IN unsigned (15 DOWNTO 0);
        R1 : OUT unsigned (3 DOWNTO 0)
    );
END ALU_3;

ARCHITECTURE calculation OF ALU_3 IS
    SIGNAL Reg1, Reg2, Result : unsigned(7 DOWNTO 0) := (others => '0');
    SIGNAL Digit1, Digit2 : unsigned(7 DOWNTO 0);
BEGIN
    Reg2 <= B; -- my B value is 08 since last 2 digits are 08
    Digit1 <= "00000000"; --0
    Digit2 <= "00001000"; --8

    PROCESS(Clk, Op)
    BEGIN
        IF rising_edge(Clk) THEN
            CASE Op IS
                WHEN "0000000000000001" =>
                    IF Digit1 > Student_id THEN        -- checking if greater 
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000000000010" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000000000100" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000000001000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000000010000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000000100000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000001000000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000010000000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN "0000000100000000" =>
                    IF Digit1 > Student_id THEN
                        Result <= "00000001";
                    ELSIF Digit2 > Student_id THEN
                        Result <= "00000001";
                    ELSE
                        Result <= "00000000";
                    END IF;
                WHEN OTHERS =>
                    Result <= "00000000";
            END CASE;
        END IF;
    END PROCESS;

    R1 <= Result(3 DOWNTO 0);
END calculation;
