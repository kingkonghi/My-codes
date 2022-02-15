----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/10 15:44:36
-- Design Name: 
-- Module Name: lab02_Q2 - Behavioral
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

entity lab02_Q2 is
    Port ( sw : in STD_LOGIC_VECTOR(3 downto 0);
                    seg: out STD_LOGIC_VECTOR(6 downto 0);
                    an: out STD_ULOGIC_VECTOR(3 downto 0));
end lab02_Q2;

architecture Behavioral of lab02_Q2 is

begin
an(3) <='1';
an(2)<='1';
an(1)<='1';
an(0)<='0';
with sw select
seg(0)<= '1' when"0001"|"0100",
            '0' when others;
with sw select
seg(1)<= '0' when"0001"|"0010"|"0011"|"0100"|"0111"|"1000"|"1001",
            '1' when others;
with sw select
seg(2)<= '0' when"0001"|"0011"|"0100"|"0101"|"0110"|"0111"|"1000"|"1001",
            '1' when others;
with sw select
seg(3)<= '1' when"0001"|"0100"|"0111",
            '0' when others;
with sw select
seg(4)<= '1' when"0001"|"0011"|"0100"|"0101"|"0111"|"1001",
            '0' when others;
with sw select
seg(5)<= '1' when"0001"|"0010"|"0011"|"0111",
            '0' when others;
with sw select
seg(6)<= '1' when"0001"|"0111",
            '0' when others;
end Behavioral;
