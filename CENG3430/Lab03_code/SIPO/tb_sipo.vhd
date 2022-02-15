
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity tb_decoder is
    --    Port ( );
end tb_decoder;
architecture Behavioral of tb_decoder is

    signal SCORE : real := 0.0;
    signal DIFFERENCE : std_logic := '1';
    signal FINISHED : std_logic := '0';

    -- configuration of the tb
    constant R : integer := 28; -- Row number of testcase
    constant INIT : integer := 16; -- Row number of testcase
    constant C : integer := 7; -- Colomn number of testcase
    constant E : integer := 4; -- Output number in the component;
    constant Aligned_C : integer := (C + 3)/4 * 4; -- Column number upround to 4;
    -- type
    type testcase_t is array (0 to R - 1) of std_logic_vector(Aligned_C - 1 downto 0);

    -- declare component to use 
    component sipo is
        port (
            D, clk, reset : in std_logic;
            Q : buffer std_logic_vector(3 downto 0)
        );
    end component;

    -- declare port signals
    signal D, clk, reset : std_logic;
    signal Q : std_logic_vector(3 downto 0);
    signal Q_expected : std_logic_vector(3 downto 0);

    -- declare internal signals
    signal testcase : testcase_t := (
        x"00", x"10", x"00", x"10",
        x"00", x"10", x"00", x"10",
        x"00", x"10", x"00", x"10",
        x"00", x"10", x"00", x"10",
        x"21", x"31", x"23", x"33",
        x"06", x"16", x"2d", x"3d",
        x"00", x"40", x"00", x"10");

    signal index : integer := 0;
    signal tick_grader : std_logic := '0';
begin
    -- Assign a row of testcase to the signals;
    process (index)
    begin
        reset <= testcase(index)(6);
        D <= testcase(index)(5);
        clk <= testcase(index)(4);
        Q_expected <= testcase(index)(3 downto 0);

    end process;
    -- Instantiate component for test, connect ports to internal singals
    INSTANCE : sipo port map(D => D, clk => clk, reset => reset, Q => Q);

    -- Generate testing signals.
    process
    begin
        -- Initialize the sipo
        for i in 0 to INIT - 1 loop
            index <= i;
            wait for 10 ns;
        end loop;
        -- Run test
        for i in 0 to (R - INIT)/2 - 1 loop
            index <= i * 2 + 16;
            wait for 10 ns;
            index <= i * 2 + 1 + 16;
            wait for 10 ns;
            if Q_expected = Q then
                DIFFERENCE <= '0';
            else
                DIFFERENCE <= 'X';
            end if;
            wait for 10ns;
            tick_grader <= not tick_grader;
            wait for 70 ns;
        end loop;
        wait for 100 ns;
        FINISHED <= '1';
        wait;
    end process;

    -- Calculate SCORE
    process (tick_grader)
    begin
        if DIFFERENCE = '0' then
            SCORE <= SCORE + 100.0/real((R - INIT)/2);
        end if;
    end process;

end Behavioral;