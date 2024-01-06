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

    COMPONENT semafor IS
        PORT (
            CLK, D : IN STD_LOGIC;
            RDECA, RUMENA, ZELENA : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL CLK : STD_LOGIC := '1';
    SIGNAL D : STD_LOGIC := '1';

    SIGNAL RDECA, RUMENA, ZELENA : STD_LOGIC;

BEGIN

    uut : semafor PORT MAP(
        CLK => CLK,
        D => D,
        RDECA => RDECA,
        RUMENA => RUMENA,
        ZELENA => ZELENA);

    clock : PROCESS
    BEGIN

        D <= '1'; -- normalno delovanje

        FOR i IN 0 TO 20 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;

        D <= '0'; -- nočni način delovanje

        FOR i IN 0 TO 10 LOOP
            CLK <= '0';
            WAIT FOR 20 ns;
            CLK <= '1';
            WAIT FOR 20 ns;
        END LOOP;


    END PROCESS;
END tb;