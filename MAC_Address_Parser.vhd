library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MAC_Address_Parser is
    port (
        -- input
        data_in : in std_logic_vector(95 downto 0);
        -- output
        src_add : out std_logic_vector(47 downto 0);
        dst_add : out std_logic_vector(47 downto 0);
        is_broadcast : out std_logic
    );
end entity MAC_Address_Parser;

architecture rtl of MAC_Address_Parser is
    signal dst_add_temp : std_logic_vector(47 downto 0);
begin
    process is
    begin
        src_add <= data_in(47 downto 0);
        dst_add <= data_in(95 downto 48);
        dst_add_temp <= data_in(95 downto 48);
        if (dst_add_temp = "111111111111111111111111111111111111111111111111") then
            is_broadcast <= '1';
        else is_broadcast <= '0';
        end if;
    end process;
end architecture rtl;