library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity EtherType_Parser is
    port (
        -- input
        clk : in std_logic;
        data_in : in std_logic_vector(15 downto 0);
        -- output
        isIPv4 : out std_logic;
        isARP : out std_logic;
        isIPv6 : out std_logic;
        isVLANtagged : out std_logic;
        isIPCP : out std_logic;
        isIPv6CP : out std_logic;
        isLLDP : out std_logic;
        isMPLSunicast : out std_logic;
        isMPLSmulticast : out std_logic;
        isRARP : out std_logic;
        isOtherEthertype : out std_logic
    );
end entity EtherType_Parser;

architecture rtl of EtherType_Parser is
    
begin
    process (clk) is
    begin
        case data_in is
            when "0000100000000000" =>
                isIPv4 <= '1';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "0000100000000110" =>
                isIPv4 <= '0';
                isARP <= '1';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000011011011101" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '1';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000000100000000" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '1';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000000000100001" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '1';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000000001010111" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '1';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000100011001100" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '1';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000100001000111" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '1';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000100001001000" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '1';
                isRARP <= '0';
                isOtherEthertype <= '0';
            when "1000000000110101" =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '1';
                isOtherEthertype <= '0';
            when others =>
                isIPv4 <= '0';
                isARP <= '0';
                isIPv6 <= '0';
                isVLANtagged <= '0';
                isIPCP <= '0';
                isIPv6CP <= '0';
                isLLDP <= '0';
                isMPLSunicast <= '0';
                isMPLSmulticast <= '0';
                isRARP <= '0';
                isOtherEthertype <= '1';
        end case;
    end process;
end architecture rtl;