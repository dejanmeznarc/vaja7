----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2023 20:38:39
-- Design Name: 
-- Module Name: simulacija - Behavioral
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

entity simulacija is
    Port ( CLKIN : in  STD_LOGIC;
             CLKOUT : out STD_LOGIC);
end simulacija;

architecture Behavioral of simulacija is
    signal COUNT : STD_LOGIC_VECTOR (27 downto 0) := (others => '0');

begin
    process (CLKIN)
    begin
        if(rising_edge(CLKIN)) then
            if(COUNT > 10) then
                COUNT <= (others => '0');
            else
                COUNT <= COUNT + 1;
            end if;
        end if;
    end process;
        
    CLKOUT <= '1' when (COUNT < 5) else '0';
    
    
end Behavioral;