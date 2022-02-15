library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux is
    port(Din,Q,sel: in std_logic;
        D:out std_logic);
end mux;

architecture arch_mux of mux is
begin
    process (sel)
    begin
        if sel = '1' then
            D <= Q;
        else
            D <= Din;
        end if;
    end process;
end arch_mux;