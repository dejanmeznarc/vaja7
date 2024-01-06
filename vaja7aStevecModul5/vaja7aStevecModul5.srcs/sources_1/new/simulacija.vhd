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
    Port ( CLK : in  STD_LOGIC;
             Q : out  STD_LOGIC_VECTOR (2 downto 0));
end simulacija;

architecture Behavioral of simulacija is
    signal COUNT : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin
    process (CLK)
    begin
        if(rising_edge(CLK)) then
            if(COUNT >= 4) then
                COUNT <= (others => '0');
            else
                COUNT <= COUNT + 1;
            end if;
    
        end if;
    end process;
        
    Q <= COUNT;
    
end Behavioral;