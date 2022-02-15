library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- To use the testbench for 2to4 decoder:
---- The name of your entity should be: decoder
---- The input/output name should be: EN, A, B, Y3, Y2, Y1, Y0

entity decorder is
    Port(EN,A,B: in std_logic;
        Y3,Y2,Y1,Y0: out std_logic);
        
end decorder;
architecture Behavioral of decorder is
begin
    Y3 <= EN and( A and B );
    Y2 <= EN and (A and not(B) );
    Y1 <= EN and (not(A) and B );
    Y0 <= EN and (not(A) and not(B) );
end Behavioral;             