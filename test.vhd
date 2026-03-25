library ieee;
use ieee.std_logic_1164.all;

entity tb_two_ff_synchronizer is
end entity;

architecture sim of tb_two_ff_synchronizer is
    signal clk      : std_logic := '0';
    signal in_async : std_logic := '0';
    signal q_out    : std_logic;

    constant CLK_PERIOD : time := 10 ns;
begin
    uut: entity work.two_ff_synchronizer
        port map (
            clk      => clk,
            in_async => in_async,
            q_out    => q_out
        );
    -- clock generation
    clk <= not clk after CLK_PERIOD / 2;

    process
    begin
        -- hold
        wait for 20 ns;

        -- make an async pulse that is not aligned to clock
        in_async <= '1';
        wait for 7 ns; -- mid clock cycle
        in_async <= '0';
        wait for 50 ns;

        -- high pulse for longer time
        in_async <= '1';
        wait for 35 ns;
        in_async <= '0';
        wait for 50 ns;

        wait for 20 ns;
    end process;
end architecture;
