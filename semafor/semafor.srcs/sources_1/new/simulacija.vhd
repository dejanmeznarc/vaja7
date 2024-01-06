----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2023 20:38:39
-- Design Name: 
-- Module Name: semafor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY semafor IS
    PORT (
        CLK, D : IN STD_LOGIC;
        RDECA, RUMENA, ZELENA : OUT STD_LOGIC);
END semafor;

ARCHITECTURE Behavioral OF semafor IS

    SIGNAL STATE : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
BEGIN
    PROCESS (CLK, D)
    BEGIN

        IF (rising_edge(CLK)) THEN
            IF (D = '1') THEN
                STATE <= STATE + 1;

                IF (STATE >= "0111") THEN
                    STATE <= "0000";
                END IF;

            ELSE
                -- STATE(2 TO 0) <= "111";
                STATE(0) <= '1';
                STATE(1) <= '1';
                STATE(2) <= '1';
                STATE(3) <= NOT STATE(3);
            END IF;

        END IF;

    END PROCESS;

    ZELENA <= '1' WHEN (STATE <= "0010")
        ELSE
        '0';
    RUMENA <= '1' WHEN (STATE = "0011" OR STATE = "0111")
        ELSE
        '0';
    RDECA <=
        '1' WHEN (STATE >= "0100" AND STATE <= "0110")
        ELSE
        '0';
END Behavioral;