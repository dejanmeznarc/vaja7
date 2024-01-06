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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sync_upcounter_tb is
end entity;

architecture tb of sync_upcounter_tb is

component simulacija is
Port ( CLKIN: in STD_LOGIC;
CLKOUT : out STD_LOGIC);
end component;

signal CLKIN : STD_LOGIC := '1';
signal CLKOUT : STD_LOGIC;

begin
    uut: simulacija port map(
        CLKIN => CLKIN,
        CLKOUT => CLKOUT);
        
    clock: process
    begin
        CLKIN <= '0';
        wait for 20 ns;
        CLKIN <= '1';
        wait for 20 ns;
        
    end process;
end tb;