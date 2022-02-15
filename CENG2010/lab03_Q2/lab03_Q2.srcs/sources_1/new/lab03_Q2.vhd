----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/24 15:47:22
-- Design Name: 
-- Module Name: lab03_Q2 - Behavioral
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

entity lab03_Q2 is
    Port ( sw : in STD_LOGIC_VECTOR(3 downto 0);
           btnC : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(1 downto 0)
           );
end lab03_Q2;

architecture Behavioral of lab03_Q2 is
signal notQ: STD_LOGIC;
signal Q:STD_LOGIC;
signal PRESET:STD_LOGIC;
signal RESET:STD_LOGIC;
signal J: STD_LOGIC;
signal K:STD_LOGIC;
signal A:STD_LOGIC;
signal B:STD_LOGIC;

begin
led(1)<=Q;
led(0)<= notQ;
J<= sw(1);
K<=sw(0);
PRESET<=sw(3);
RESET<=sw(2);

Process(PRESET,RESET,btnC)
begin
if( PRESET = '0' and RESET='1') then
Q<= '1';
notQ<= '0';
elsif( PRESET = '1' and RESET='0') then
Q<= '0';
notQ<= '1';
elsif( PRESET = '0' and RESET='0') then
Q<= '1';
notQ<= '1';
elsif( PRESET = '1' and RESET='1') then


if(btnc'event and btnc='0') then
if(J='0' and K='0')then
end if;
if(J='0' and K='1')then
Q<='0';
notQ<='1';
end if;
if(J='1' and K='0')then
Q<='1';
notQ<='0';
end if;
if(J='1' and K='1')then
Q<=notQ;
notQ<=Q;
end if;
end if;

end if;
end process;

end Behavioral;
