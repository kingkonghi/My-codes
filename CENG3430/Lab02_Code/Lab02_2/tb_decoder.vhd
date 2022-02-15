
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

---- Your entity should be consistent with the following component delcaration
---- Otherwise, it will report errors.

-- component decoder
--     port (
--         EN, A, B : in std_logic;
--         Y3, Y2, Y1, Y0 : out std_logic);
-- end component;

--------

entity tb_decoder is
    --    Port ( );
end tb_decoder;
architecture Behavioral of tb_decoder is

    signal SCORE : real := 0.0;
    signal DIFFERENCE : std_logic := 'X';
    signal FINISHED : std_logic := '0';

    -- configuration of the tb
    constant R : integer := 8; -- Row number of testcase
    constant C : integer := 7; -- Colomn number of testcase
    constant E : integer := 4; -- Output number in the component;
    constant Aligned_C : integer := (C + 3)/4 * 4; -- Column number upround to 4;
    -- type
    type testcase_t is array (0 to R - 1) of std_logic_vector(Aligned_C - 1 downto 0);

    -- declare component to use 
    component decoder
        port (
            EN, A, B : in std_logic;
            Y3, Y2, Y1, Y0 : out std_logic);
    end component;

    -- declare internal signals
    signal EN, A, B : std_logic;
    signal Y3, Y2, Y1, Y0 : std_logic;
    signal Y3_expected, Y2_expected, Y1_expected, Y0_expected : std_logic;
    signal testcase : testcase_t := (x"00", x"10", x"20", x"30", x"41", x"52", x"64", x"78");
    signal expected : std_logic_vector(E - 1 downto 0);
    signal component_output : std_logic_vector(E - 1 downto 0);
    signal index : integer := 0;
    signal clk : std_logic := '0';
begin

    -- Assign a row of testcase to the signals;
    process (index)
    begin
        (EN, A, B, Y3_expected, Y2_expected, Y1_expected, Y0_expected) <= testcase(index)(C - 1 downto 0);
    end process;

    -- Instantiate component for test, connect ports to internal singals
    INSTANCE : decoder port map(EN => EN, A => A, B => B, Y3 => Y3, Y2 => Y2, Y1 => Y1, Y0 => Y0);
    -- Compare the output with the expected result.
    expected <= Y3_expected & Y2_expected & Y1_expected & Y0_expected;
    component_output <= Y3 & Y2 & Y1 & Y0;
    DIFFERENCE <= '0' when expected = component_output else
        'X';

    -- Generate testing signals.
    process
    begin
        for i in 0 to R - 1 loop
            -- wait for 50 ns;
            index <= i;
            wait for 10 ns;
            clk <= not clk;
            wait for 90 ns;
        end loop;
        wait for 100 ns;
        FINISHED <= '1';
        wait;
    end process;

    -- Calculate SCORE
    process (clk)
    begin
        if DIFFERENCE = '0' then
            SCORE <= SCORE + 100.0/real(R);
        end if;
    end process;

end Behavioral;