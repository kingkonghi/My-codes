library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab02_1 is
Port(A, B, EN: in std_logic;
        Y: out std_logic);
end Lab02_1;

architecture Behavioral of Lab02_1 is

begin
 Y <= (A nor B) and EN;

end Behavioral;
