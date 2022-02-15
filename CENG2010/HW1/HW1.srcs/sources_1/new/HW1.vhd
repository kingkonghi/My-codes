----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/03/20 17:53:15
-- Design Name: 
-- Module Name: HW1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- Uncomment the following library declaration if instantiating
--any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity HW1 is
    Port ( clk : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;    
            btnD: in STD_LOGIC; 
            sw: in STD_LOGIC_VECTOR(0 downto 0);
     seg: out STD_LOGIC_VECTOR(6 downto 0);
     an: out STD_LOGIC_VECTOR(3 downto 0)
    
           );
end HW1;

architecture Behavioral of HW1 is
signal LED_BCD: STD_LOGIC_VECTOR(3 downto 0);
signal displayed_number: STD_LOGIC_VECTOR(15 downto 0) :="0000000100100011";
signal LED_activating_counter: STD_LOGIC_VECTOR(1 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
signal pressed: STD_LOGIC_VECTOR(0 downto 0):="0";
begin
process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => seg <= "1000000"; -- "0"     
    when "0001" => seg <= "1111001"; -- "1" 
    when "0010" => seg <= "0100100"; -- "2" 
    when "0011" => seg <= "0110000"; -- "3" 
    when "0100" => seg <= "1001100"; -- "4" 
    when "0101" => seg <= "0010010"; -- "5" 
    when "0110" => seg <= "0100000"; -- "6" 
    when "0111" => seg <= "1111000"; -- "7" 
    when "1000" => seg <= "0000000"; -- "8"     
    when "1001" => seg <= "0010000"; -- "9" 
    when "1010" => seg <= "0100000"; -- a
    when "1011" => seg <= "0000011"; -- b
    when "1100" => seg <= "1000110"; -- C
    when "1101" => seg <= "0100001"; -- d
    when "1110" => seg <= "0000110"; -- E
    when "1111" => seg <= "0001110"; -- F
    end case;
end process;

process(clk,btnC,btnD)
begin 
    if(btnD = '1') then
        displayed_number <="0000000100100011";
        refresh_counter <= (others=>'0');
            
    elsif (btnC'event and btnC ='1') then
    if(sw(0) = '1') then
        displayed_number <= std_logic_vector(unsigned(displayed_number) ror 4);
        else
            displayed_number <= std_logic_vector(unsigned(displayed_number) rol 4);
    end if;
    end if;
    
    if(rising_edge(clk)) then
        refresh_counter <= std_logic_vector(unsigned(refresh_counter) + 1);
    end if;
    
end process;

LED_activating_counter <=  refresh_counter(19 downto 18);
process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        an <= "0111"; 
        LED_BCD <= displayed_number(15 downto 12);
    when "01" =>
        an <= "1011"; 
        LED_BCD <= displayed_number(11 downto 8);
    when "10" =>
        an <= "1101"; 
        LED_BCD <= displayed_number(7 downto 4);
    when "11" =>
        an <= "1110"; 
        LED_BCD <= displayed_number(3 downto 0);
    end case;
end process;

end Behavioral;
