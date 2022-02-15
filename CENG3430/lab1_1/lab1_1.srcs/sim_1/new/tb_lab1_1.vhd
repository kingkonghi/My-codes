-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 18.1.2022 09:08:28 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_lab1_1 is
end tb_lab1_1;

architecture tb of tb_lab1_1 is

    component lab1_1
        port (A : in std_logic_vector(1 downto 0);
              B : in std_logic_vector(1 downto 0);
              C : out std_logic);
    end component;

    signal A : std_logic_vector(1 downto 0);
    signal B : std_logic_vector(1 downto 0);
    signal C : std_logic;

begin

    dut : lab1_1
    port map (A => A,
              B => B,
              C => C);

    stimuli : process
    constant period: time :=10ns;
        begin
            A(1) <= '0';
            A(0) <= '0';
            B(1) <= '0';
            B(0) <= '0';
            wait for period;
            assert(C='1')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '0';
            B(1) <= '0';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '0';
            B(1) <= '1';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '0';
            B(1) <= '1';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '1';
            B(1) <= '0';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;            
            
            A(1) <= '0';
            A(0) <= '1';
            B(1) <= '0';
            B(0) <= '1';
            wait for period;
            assert(C='1')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '1';
            B(1) <= '1';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '0';
            A(0) <= '1';
            B(1) <= '1';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;       
            
            A(1) <= '1';
            A(0) <= '0';
            B(1) <= '0';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;             
            
            A(1) <= '1';
            A(0) <= '0';
            B(1) <= '0';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '1';
            A(0) <= '0';
            B(1) <= '1';
            B(0) <= '0';
            wait for period;
            assert(C='1')
            report "test failed for input combination 00" severity error;             
            
            A(1) <= '1';
            A(0) <= '0';
            B(1) <= '1';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;                                      
            
            A(1) <= '1';
            A(0) <= '1';
            B(1) <= '0';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;            
            
            A(1) <= '1';
            A(0) <= '1';
            B(1) <= '0';
            B(0) <= '1';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '1';
            A(0) <= '1';
            B(1) <= '1';
            B(0) <= '0';
            wait for period;
            assert(C='0')
            report "test failed for input combination 00" severity error;
            
            A(1) <= '1';
            A(0) <= '1';
            B(1) <= '1';
            B(0) <= '1';
            wait for period;
            assert(C='1')
            report "test failed for input combination 00" severity error;                  
            
            
            
            wait;
            
        end process;    

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_lab1_1 of tb_lab1_1 is
    for tb
    end for;
end cfg_tb_lab1_1;