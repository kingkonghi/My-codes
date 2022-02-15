
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

---- Your entity should be consistent with the following component delcaration
---- Otherwise, it will report errors.

-- component nor_en
-- port (
--     EN, A, B : in std_logic;
--     Y : out std_logic);
-- end component;

--------
entity tb_nor_en is
    --    Port ( );
end tb_nor_en;
architecture Behavioral of tb_nor_en is

    signal SCORE : real := 0.0;
    signal DIFFERENCE : std_logic := 'X';
    signal FINISHED : std_logic := '0';

    -- configuration of the tb
    constant R : integer := 8; -- Row number of testcase
    constant C : integer := 4; -- Colomn number of testcase
    constant E : integer := 1; -- Output number in the component;
    constant Aligned_C : integer := (C + 3)/4 * 4; -- Column number upround to 4;
    -- type
    type testcase_t is array (0 to R - 1) of std_logic_vector(Aligned_C - 1 downto 0);

    -- declare component to use 
    component nor_en
        port (
            EN, A, B : in std_logic;
            Y : out std_logic);
    end component;

    -- declare internal signals
    signal EN, A, B : std_logic;
    signal Y : std_logic;
    signal Y_expected : std_logic;
    signal testcase : testcase_t := (x"0", x"2", x"4", x"6", x"9", x"a", x"c", x"e");
    signal expected : std_logic;
    signal component_output : std_logic;
    signal index : integer := 0;
    signal clk : std_logic := '0';
begin

    -- Assign a row of testcase to the signals;
    process (index)
    begin
        (EN, A, B, Y_expected) <= testcase(index)(C - 1 downto 0);
    end process;

    -- Instantiate component for test, connect ports to internal singals
    INSTANCE : nor_en port map(A => A, B => B, EN => EN, Y => Y);

    -- Compare the output with the expected result.
    expected <= Y_expected;
    component_output <= Y;
    DIFFERENCE <= '0' when expected = component_output else
        'X';

    -- Generate testing signals.
    process
    begin
        for i in 0 to R - 1 loop
            -- wait for 50 ns;
            index <= i;
            wait for 30 ns;
            clk <= not clk;
            wait for 70 ns;
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