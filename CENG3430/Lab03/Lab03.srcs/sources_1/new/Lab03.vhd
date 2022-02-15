library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab03 is
port (clk, reset,sel : in std_logic;
Din : in std_logic_vector(3 downto 0);
Q : buffer std_logic_vector(3 downto 0));
end Lab03;

architecture Behavioral of Lab03 is

component mux is
    port(Din,Q,sel: in std_logic;
        D:out std_logic);
   end component;
   
component D_FF is
    port(D,clk,reset: in std_logic;
        Q:buffer std_logic);
end component;
signal A,B,C,D:std_logic;
begin

mux0:mux port map(Din(0),'0',sel,A);
DFF0:D_FF port map(A,clk,reset,Q(0));

mux1:mux port map(Din(1),Q(0),sel,B);
DFF1 : D_FF port map(B, clk, reset, Q(1));

mux2:mux port map(Din(2),Q(1),sel,C);
DFF2 : D_FF port map(C, clk, reset, Q(2));

mux3:mux port map(Din(3),Q(2),sel,D);
DFF3 : D_FF port map(D, clk, reset, Q(3));
end Behavioral;