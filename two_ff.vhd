----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2026 04:31:51 PM
-- Design Name: 
-- Module Name: hed - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;

entity two_ff_synchronizer is
    port (
        clk      : in  std_logic;
        in_async : in  std_logic;
        q_out    : out std_logic
    );
end entity;

architecture rtl of two_ff_synchronizer is
    signal ff_1   : std_logic := '0';
    signal ff_2 : std_logic := '0';
begin
    -- 2-FF synchronizer
    process(clk)
    begin
        if rising_edge(clk) then
            ff_1 <= in_async;
            ff_2 <= ff_1;
        end if;
    end process;
    q_out <= ff_2; 
end architecture;
