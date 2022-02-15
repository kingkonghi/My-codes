
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
    constant R : integer := 12; -- Row number of testcase
    constant C : integer := 11; -- Colomn number of testcase
    constant E : integer := 4; -- Output number in the component;
    constant Aligned_C : integer := (C + 3)/4 * 4; -- Column number upround to 4;
    -- type
    type testcase_t is array (0 to R - 1) of std_logic_vector(Aligned_C - 1 downto 0);

    -- declare component to use 
    component pipo is
        port (
            clk, reset, sel : in std_logic;
            Din : in std_logic_vector(3 downto 0);
            Q : buffer std_logic_vector(3 downto 0)
        );
    end component;

    -- declare port signals
    signal clk, reset, sel : std_logic;
    signal Din : std_logic_vector(3 downto 0);
    signal Q : std_logic_vector(3 downto 0);
    signal Q_expected : std_logic_vector(3 downto 0);

    -- declare internal signals
    signal testcase : testcase_t := (x"033", x"133", x"055", x"155",
    x"20a", x"30a", x"204", x"304",
    x"0f0", x"4f0", x"2f0", x"3f0");

    signal index : integer := 0;
    signal tick_grader : std_logic := '0';
begin

    -- Assign a row of testcase to the signals;
    process (index)
    begin
        clk <= testcase(index)(8);
        sel <= testcase(index)(9);
        reset <= testcase(index)(10);
        Din <= testcase(index)(7 downto 4);
        Q_expected <= testcase(index)(3 downto 0);
    end process;

    -- Instantiate component for test, connect ports to internal singals
    INSTANCE : pipo port map(clk => clk, sel => sel, reset => reset, Din => Din, Q => Q);

    -- Generate testing signals.
    process
    begin
        for i in 0 to R/2 - 1 loop
            index <= i * 2;
            wait for 10 ns;
            index <= i * 2 + 1;
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
            SCORE <= SCORE + 100.0/real(R/2);
        end if;
    end process;

end Behavioral;