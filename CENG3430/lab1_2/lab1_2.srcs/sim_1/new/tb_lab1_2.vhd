library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_lab1_2 is
--  Port ( );
end tb_lab1_2;

architecture Behavioral of tb_lab1_2 is
    signal A, B, C, D : STD_LOGIC;
    signal S1, S2: STD_LOGIC;
    signal O : STD_LOGIC;
begin
    S1 <= A AND B;
    S2 <= C XOR D;
    O <= S1 OR S2 or B;

    stimuli : process
    begin
    
        for i in 0 to 1 loop
            if (i = 0) then A <= '0';  else A <= '1';  end if;
            for j in 0 to 1 loop
                if (j = 0) then B <= '0';  else B <= '1';  end if;
                for k in 0 to 1 loop
                    if (k = 0) then C <= '0';  else C <= '1';  end if;
                    for l in 0 to 1 loop
                        if (l = 0) then D <= '0';  else D <= '1';  end if;
                        wait for 40ns;
                    end loop;
                end loop;
            end loop;
        end loop;
        
        wait;
    end process;

end Behavioral;