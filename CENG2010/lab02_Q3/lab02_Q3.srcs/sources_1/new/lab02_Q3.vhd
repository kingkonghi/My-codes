----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/02/11 01:36:23
-- Design Name: 
-- Module Name: lab02_Q3 - Behavioral
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

entity lab02_Q3 is
    Port ( sw: in STD_LOGIC_VECTOR(1 downto 0);
           led: out STD_LOGIC_VECTOR(1 downto 0)
           );
end lab02_Q3;

architecture Behavioral of lab02_Q3 is
signal notQ : STD_LOGIC;
signal    Q: STD_LOGIC;
begin
led(1)<= Q;
led(0)<= notQ;
         
Q    <= sw(1) nand notQ ;
notQ <= sw(0) nand Q ;
end Behavioral;