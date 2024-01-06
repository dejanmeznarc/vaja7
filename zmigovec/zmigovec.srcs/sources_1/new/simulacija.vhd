----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2023 20:38:39
-- Design Name: 
-- Module Name: zmigovc - Behavioral
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

ENTITY zmigovc IS
    PORT (
        CLK, LEVI, DESNI, VSI : IN STD_LOGIC;
        LEVI_OUT, DESNI_OUT : OUT STD_LOGIC);
END zmigovc;

ARCHITECTURE Behavioral OF zmigovc IS

    SIGNAL STATE : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

BEGIN
    PROCESS (CLK, LEVI, DESNI, VSI, STATE)
    BEGIN

        IF (rising_edge(CLK)) THEN

            IF (STATE /= "00") THEN
                STATE <= "00";
            ELSIF (VSI = '1') THEN
                STATE <= "11"; -- state <= VSI
            ELSIF (LEVI = '1' AND DESNI = '0') THEN
                STATE <= "10"; -- state <- levi
            ELSIF (LEVI = '0' AND DESNI = '1') THEN
                STATE <= "01"; -- state <- desni
            ELSE
                STATE <= "00"; --BMW state, please consult yor drving instructor on how to use signals properly
            END IF;

        END IF;
    END PROCESS;

    LEVI_OUT <= STATE(1);
    DESNI_OUT <= STATE(0);

END Behavioral;