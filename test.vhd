library ieee;
use ieee.std_logic_1164.all;

entity tb_two_ff_synchronizer is
end entity;

architecture sim of tb_two_ff_synchronizer is
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '1';
    signal in_async : std_logic := '0';
    signal q_out    : std_logic;

    constant CLK_PERIOD : time := 20 ns;
begin
    uut: entity work.two_ff_synchronizer
        port map (
            clk      => clk,
            rst      => rst,
            in_async => in_async,
            q_out    => q_out
        );

    clk <= not clk after CLK_PERIOD / 2;

    process
    begin
        rst <= '1';
        wait for 40 ns;
        rst <= '0';

        wait for 13 ns; in_async <= '1';
        wait for 27 ns; in_async <= '0';
        wait for 19 ns; in_async <= '1';
        wait for 33 ns; in_async <= '0';
        wait for 11 ns; in_async <= '1';
        wait for 41 ns; in_async <= '0';

        wait for 100 ns;
        assert false report "Simulation finished" severity failure;
    end process;
end architecture;
