library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ethernet_II_Frame_Parser is
    port (
        -- input
        clk : in std_logic;
        data_in : in std_logic_vector(12143 downto 0);
        -- output
        payloadAndCRC : out std_logic_vector(12031 downto 0);
        destMACAddress : out std_logic_vector(47 downto 0);
        srcMACAddress : out std_logic_vector(47 downto 0);
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
        isOtherEthertype : out std_logic;
        isBroadcast : out std_logic;
        sus : out std_logic
    );
end entity Ethernet_II_Frame_Parser;

architecture rtl of Ethernet_II_Frame_Parser is
    -- Component
    component MAC_Address_Parser is
        port(
            data_in : in std_logic_vector(95 downto 0);
            src_add : out std_logic_vector(47 downto 0);
            dst_add : out std_logic_vector(47 downto 0);
            is_broadcast : out std_logic
        );
    end component;

    component EtherType_Parser is
        port(
            data_in : in std_logic_vector(15 downto 0);
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
    end component;

    component IDS is
        port(
            is_broadcast : in std_logic;
            isARP : in std_logic;
            isRARP : in std_logic;
            sus : out std_logic
        );
    end component;

    -- Signal
    type STATE is (IDLE, FETCH, PARSE, DETECT, COMPLETE);

    signal currSt : STATE;
    signal nextSt : STATE;

    signal data_in_temp : std_logic_vector(12143 downto 0);
    signal data_add_temp : std_logic_vector(95 downto 0);
    signal data_typ_temp : std_logic_vector(15 downto 0);
    signal src_add : std_logic_vector(47 downto 0);
    signal dst_add : std_logic_vector(47 downto 0);
    signal isIPv4temp : std_logic;
    signal isARPtemp : std_logic;
    signal isIPv6temp : std_logic;
    signal isVLANtaggedtemp : std_logic;
    signal isIPCPtemp : std_logic;
    signal isIPv6CPtemp : std_logic;
    signal isLLDPtemp : std_logic;
    signal isMPLSunicasttemp : std_logic;
    signal isMPLSmulticasttemp : std_logic;
    signal isRARPtemp : std_logic;
    signal isOtherEthertypetemp : std_logic;
    signal isBroadcasttemp : std_logic;
    signal sustemp : std_logic;

begin
    -- portmap
    addressParser : MAC_Address_Parser port map (data_add_temp, src_add, dst_add, isBroadcasttemp);
    ethertypeParser : EtherType_Parser port map (data_typ_temp, isIPv4temp, isARPtemp, isIPv6temp, isVLANtaggedtemp, isIPCPtemp, isIPv6CPtemp, isLLDPtemp, isMPLSunicasttemp, isMPLSmulticasttemp, isRARPtemp, isOtherEthertypetemp);
    detection : IDS port map (isBroadcasttemp, isARPtemp, isRARPtemp, sustemp);
    process (clk) is
    begin
        if (rising_edge(clk)) then
            if (to_integer(unsigned(data_in)) = 0) then nextSt <= IDLE;
            end if;
            currSt <= nextSt;
            case currSt is
                when IDLE =>
                    if (to_integer(unsigned(data_in)) /= 0) then nextSt <= FETCH;
                    end if;
                when FETCH =>
                    data_in_temp <= data_in;
                    nextSt <= PARSE;
                when PARSE =>
                    data_add_temp <= data_in_temp(12143 downto 12048);
                    data_typ_temp <= data_in_temp(12047 downto 12032);
                    nextSt <= DETECT;
                when DETECT =>
                    isBroadcasttemp <= isBroadcasttemp;
                    isARPtemp <= isARPtemp;
                    isRARPtemp <= isRARPtemp;
                    nextSt <= COMPLETE;
                when COMPLETE =>
                    payloadAndCRC <= data_in_temp(12031 downto 0);
                    destMACAddress <= dst_add;
                    srcMACAddress <= src_add;
                    isIPv4 <= isIPv4temp;
                    isARP <= isARPtemp;
                    isIPv6 <= isIPv6temp;
                    isVLANtagged <= isVLANtaggedtemp;
                    isIPCP <= isIPCPtemp;
                    isIPv6CP <= isIPv6CPtemp;
                    isLLDP <= isLLDPtemp;
                    isMPLSunicast <= isMPLSunicasttemp;
                    isMPLSmulticast <= isMPLSmulticasttemp;
                    isRARP <= isRARPtemp;
                    isOtherEthertype <= isOtherEthertypetemp;
                    isBroadcast <= isBroadcasttemp;
                    sus <= sustemp;
                    nextSt <= IDLE;
            end case;
        end if;
    end process;
end architecture rtl;