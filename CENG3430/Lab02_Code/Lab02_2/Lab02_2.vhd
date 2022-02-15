library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab02_2 is
Port(EN,A,B: in std_logic;
        Y3,Y2,Y1,Y0: out std_logic);
end Lab02_2;

architecture Behavioral of Lab02_2 is

begin
Y3 <= EN and( A and B );
    Y2 <= EN and (A and not(B) );
    Y1 <= EN and (not(A) and B );
    Y0 <= EN and (not(A) and not(B) );

end Behavioral;
