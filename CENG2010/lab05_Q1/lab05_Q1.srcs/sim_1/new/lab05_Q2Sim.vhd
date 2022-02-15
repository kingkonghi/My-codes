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

entity lab05_Q2 is

end lab05_Q2;

architecture Behavioral of lab05_Q2 is
Component Flip_flop
    Port ( sw0: in std_logic;
         clk: in STD_LOGIC;
    led0: out STD_LOGIC;
    led1: out STD_LOGIC
    );
end component ;
signal input: std_logic;
signal output: std_logic;
constant clock_period: time := 100ns;

begin

Clock_process:Process
begin
input <='0';
wait for clock_period/2;
input <='1';
wait for clock_period/2;

end process;

stimuli:process
begin
output<='0';
wait for clock_period/2;
output<='1';
wait for clock_period;
output<='0';
wait for clock_period/2;
end process;
end Behavioral;