library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab1_2 is
    Port ( A, B, C, D : in STD_LOGIC;
           O : out STD_LOGIC);
end lab1_2;

architecture Behavioral of lab1_2 is
    signal S1, S2: STD_LOGIC;
begin
    S1 <= A AND B;
    S2 <= C XOR D;
    O <= S1 OR S2 or B;
    
end Behavioral;