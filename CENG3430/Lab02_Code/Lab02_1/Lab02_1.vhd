library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- To use the testbench for nor_en:
---- The name of your entity should be: nor_en
---- The input/output name should be: EN, A, B, Y

entity nor_en is
Port(A, B, C: in STD_LOGIC;
F: out STD_LOGIC);
end nor_en;
architecture Behavioral of nor_en is
begin
F <= (A nor B) and C;
end Behavioral;
