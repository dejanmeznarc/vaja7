----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2023 20:39:10
-- Design Name: 
-- Module Name: testbench - Behavioral
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

ENTITY sync_upcounter_tb IS
END ENTITY;

ARCHITECTURE tb OF sync_upcounter_tb IS

    COMPONENT zmigovc IS
        PORT (
            CLK, LEVI, DESNI, VSI : IN STD_LOGIC;
            LEVI_OUT, DESNI_OUT : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL CLK : STD_LOGIC := '1';
    SIGNAL LEVI, DESNI, VSI : STD_LOGIC := '0';

    SIGNAL LEVI_OUT, DESNI_OUT : STD_LOGIC;

BEGIN

    uut : zmigovc PORT MAP(
        CLK => CLK,
        LEVI => LEVI,
        DESNI => DESNI,
        VSI => VSI,
        LEVI_OUT => LEVI_OUT,
        DESNI_OUT => DESNI_OUT);

    clock : PROCESS
    BEGIN

        LEVI<= '1';
        DESNI<= '0';
        VSI<= '0';

        FOR i IN 0 TO 6 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;

        LEVI<= '0';
        DESNI<= '1';
        VSI<= '0';

        FOR i IN 0 TO 5 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;

        
        LEVI<= '0';
        DESNI<= '0';
        VSI<= '1';

        FOR i IN 0 TO 5 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;


            
        LEVI<= '0';
        DESNI<= '1';
        VSI<= '1';

        FOR i IN 0 TO 5 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;


    END PROCESS;
END tb;