library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FF is
    port (
        D, clk, reset : in std_logic;
        Q : buffer std_logic
    );
end D_FF;

architecture arch_dff of D_FF is
begin
    process (clk, reset)
    begin
        if reset = '1' then
            Q <= '0';
        elsif rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end arch_dff;