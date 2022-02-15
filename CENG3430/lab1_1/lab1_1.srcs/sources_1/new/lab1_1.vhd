----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2022 17:06:15
-- Design Name: 
-- Module Name: lab1_1 - Behavioral
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

entity lab1_1 is
Port(
A:in std_logic_vector(1 downto 0);
B:in std_logic_vector(1 downto 0);
C:out std_logic);
end lab1_1;

architecture Behavioral of lab1_1 is

begin

C<= '1' when (a=b) else '0';

end Behavioral;
