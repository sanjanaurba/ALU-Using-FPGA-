LIBRARY ieee;
USE ieee.std_logic_1164.all; -- Import standard logic library

-- Define the entity sseg_modifiedvhd  with input and output ports
ENTITY sseg_modifiedvhd IS
    PORT(
        bcd: IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4-bit binary-coded decimal input
        leds: OUT STD_LOGIC_VECTOR(0 TO 6) -- 7-bit output for LED display
    );
END sseg_modifiedvhd ;

-- Architecture definition for sseg_modifiedvhd 
ARCHITECTURE Behaviour OF sseg_modifiedvhd  IS
BEGIN
    -- Process block sensitive to changes in bcd
    PROCESS(bcd)
    BEGIN
        -- Determine the LED pattern based on the bcd value
        CASE bcd IS
            WHEN "0000" => leds <= "0010101"; -- LED pattern for 'n'
            WHEN "0001" => leds <= "0111011"; -- LED pattern for 'y'
            WHEN OTHERS => leds <= "-------"; -- Default pattern for undefined bcd values
        END CASE;
    END PROCESS;
END Behaviour;
