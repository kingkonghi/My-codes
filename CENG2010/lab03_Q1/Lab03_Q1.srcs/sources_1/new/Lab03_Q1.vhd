----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/24 13:59:46
-- Design Name: 
-- Module Name: Lab03_Q1 - Behavioral
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

entity Lab03_Q1 is
    Port ( 
          sw: in STD_LOGIC_VECTOR(6 downto 0);
          btnC: in STD_LOGIC;
          dp: out STD_LOGIC:='0';
         seg: out STD_LOGIC_VECTOR (6 downto 0);
         an: out STD_LOGIC_VECTOR(3 downto 0)
);
end Lab03_Q1;

architecture Behavioral of Lab03_Q1 is
signal A:STD_LOGIC:='0';
signal B:STD_LOGIC:='0';
signal C:STD_LOGIC:='1';
signal D:STD_LOGIC:='1';
begin
an(3)<=A;
an(2)<=B;
an(1)<=C;
an(0)<=D;
seg(0)<= sw(0);
seg(1)<= sw(1);
seg(2)<= sw(2);
seg(3)<= sw(3);
seg(4)<= sw(4);
seg(5)<= sw(5);
seg(6)<= sw(6);
dp<='1';
Press:Process(btnC)
begin
if (btnc'event and btnc='1') then

B<=not A;
A<=not B;
D<=not C;
C<=not D;

end if;
end process Press;

end Behavioral;
