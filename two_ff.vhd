-- two_ff_synchronizer.vhd
library ieee;
use ieee.std_logic_1164.all;

entity two_ff_synchronizer is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        in_async : in  std_logic;
        q_out    : out std_logic
    );
end entity;

architecture rtl of two_ff_synchronizer is
    signal sync1    : std_logic := '0';
    signal sync2    : std_logic := '0';
    signal comb_out : std_logic := '0';
    signal q_reg    : std_logic := '0';
begin
    -- 2-FF synchronizer
    process(clk, rst)
    begin
        if rst = '1' then
            sync1 <= '0';
            sync2 <= '0';
        elsif rising_edge(clk) then
            sync1 <= in_async;
            sync2 <= sync1;
        end if;
    end process;

    -- Example combinational logic block from synchronized signal + feedback
    comb_out <= sync2 xor q_reg;

    -- Output flip-flop
    process(clk, rst)
    begin
        if rst = '1' then
            q_reg <= '0';
        elsif rising_edge(clk) then
            q_reg <= comb_out;
        end if;
    end process;

    q_out <= q_reg;
end architecture;
