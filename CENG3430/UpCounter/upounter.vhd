library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity upcounter is
    port (
        clk, btnc : in std_logic;
        mode : out std_logic;
        COUNT : out std_logic_vector(3 downto 0)
    );
end upcounter;
architecture arch_upcounter of upcounter is

    signal clk_1, clk_4 : std_logic;
    signal s_mode : std_logic := '0';
    signal s : std_logic_vector(3 downto 0) := "0000";

    component clk_1hz is
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;
    component clk_4hz is
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;

begin
    u1 : clk_1hz port map(clk, clk_1);
    u4 : clk_4hz port map(clk, clk_4);

    -- change state;
    process (clk_4, btnc)
    begin
        if rising_edge (clk_4) and btnc = '1' then
            s_mode <= not s_mode;
        end if;
    end process;

    -- count up
    process (clk_1, s_mode)
    begin
        if rising_edge(clk_1) and s_mode = '0' then
            -- up count mode
            s <= std_logic_vector(unsigned(s) + 1);
        end if;

    end process;

    mode <= s_mode;
    COUNT <= s;
end arch_upcounter; -- arch_downcounter