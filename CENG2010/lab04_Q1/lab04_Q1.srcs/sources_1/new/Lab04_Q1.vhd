----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/03/03 14:21:46
-- Design Name: 
-- Module Name: Lab04_Q1 - Behavioral
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

entity Lab04_Q1 is
--  Port ( );
Port(sw: in STD_LOGIC_VECTOR(0 downto 0);
btnC: in STD_LOGIC;
btnD: in STD_LOGIC;
led: out STD_LOGIC_VECTOR(7 downto 0)
);
end Lab04_Q1;

architecture Behavioral of Lab04_Q1 is
Signal INPUT: STD_LOGIC;
Signal SYNC: STD_LOGIC;
Signal RESET: STD_LOGIC;
Signal OUTPUT:STD_LOGIC;
type state_type is(S0,S1,S2);
Signal state, next_state: state_type;
Signal A:STD_LOGIC;
Signal B:STD_LOGIC;
Signal C:STD_LOGIC;

begin
INPUT<=sw(0);
SYNC<=btnC;
RESET<=btnD;

led(0)<=OUTPUT;
led(5)<=A;
led(6)<=B;
led(7)<=C;

SYNC_PROC: process( SYNC, RESET)
begin
    if(RESET='1')then
        state<=S0;
        elsif rising_edge(SYNC) then
        state <= next_state;
        end if;
end process;

OUTPUT_DECODE: process(state,INPUT)
begin
output<='0';
case (state) is
    when S0 =>
        output <='0';
        A<='1';
        B<='0';
        C<='0';
    when S1 =>
        output <='1';
        A<='0';
        B<='1';
        C<='0';
    when S2 =>
        output <='0';
        A<='0';
        B<='0';
        C<='1';
    when others =>
        output <='0';
        A<='1';
        B<='0';
        C<='0';
    end case;
end process;

NEXT_STATE_DECODE : process (state,INPUT)
begin
next_state <=state;
case (state) is
    when S0=>
        if(INPUT ='1')then
            next_state<= S1;
        else
            next_state<=S0;
        end if;
    when S1=>
        if(INPUT ='0')then
            next_state<= S2;
        else
            next_state<=S1;
        end if;
    when S2=>
        if(INPUT ='1')then
            next_state<= S1;
        else
            next_state<=S2;
        end if;
    when others =>
    next_state <=S0;
    end case;
end process;
end Behavioral;
