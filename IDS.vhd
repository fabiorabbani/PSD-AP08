library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity IDS is
    port (
        -- input
        clk : in std_logic;
        is_broadcast : in std_logic;
        isARP : in std_logic;
        isRARP : in std_logic;
        -- output
        sus : out std_logic
    );
end entity IDS;

architecture rtl of IDS is
    
begin
    process (clk) is
    begin
        if ((isARP = '1' or isRARP = '1') and is_broadcast = '0') then
            sus <= '1';
        else sus <= '0';
        end if;
    end process;
end architecture rtl;