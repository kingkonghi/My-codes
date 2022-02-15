library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sipo is
    port (
        D, clk, reset : in std_logic;
        Q : buffer std_logic_vector(3 downto 0)
    );
end sipo;

architecture arch_sipo of sipo is
    component D_FF is
        port (
            D, clk, reset : in std_logic;
            Q : buffer std_logic
        );
    end component;
begin
    DFF0 : D_FF port map(D, clk, reset, Q(0));
    DFF1 : D_FF port map(Q(0), clk, reset, Q(1));
    DFF2 : D_FF port map(Q(1), clk, reset, Q(2));
    DFF3 : D_FF port map(Q(2), clk, reset, Q(3));
end arch_sipo;