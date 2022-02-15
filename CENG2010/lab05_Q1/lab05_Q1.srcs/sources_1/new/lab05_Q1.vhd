----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/03/17 14:33:11
-- Design Name: 
-- Module Name: lab05_Q1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab05_Q1 is
    Port ( sw: in std_logic_vector(0 downto 0);
         btnC: in STD_LOGIC;
    led: out STD_LOGIC_VECTOR(1 downto 0)
    );
end lab05_Q1;

architecture Behavioral of lab05_Q1 is
signal Q,Q_BAR,D,CLK: std_logic;
signal H1A,H1B,H2A,H2B: STD_LOGIC;

begin
D<=sw(0);
CLK<=btnC;
Process(D,btnC)
begin

if(btnc'event and btnc='1') then
if(D='0')then
Q<='0';
Q_BAR<='1';
end if;
if(D='1')then
Q<='1';
Q_BAR<='0';
end if;
end if;

end process;
led(1)<=Q_BAR;
led(0)<=Q;
end Behavioral;