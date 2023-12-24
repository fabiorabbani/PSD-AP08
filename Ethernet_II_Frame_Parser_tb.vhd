library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ethernet_II_Frame_Parser_tb is
end entity Ethernet_II_Frame_Parser_tb;

architecture tb_arch of Ethernet_II_Frame_Parser_tb is
    -- Constants
    constant CLK_PERIOD : time := 10 ns;

    -- Signals
    signal clk_tb      : std_logic := '0';
    signal data_in_tb  : std_logic_vector(111 downto 0) := (others => '0');

    signal destMACAddress_tb : std_logic_vector(47 downto 0);
    signal srcMACAddress_tb  : std_logic_vector(47 downto 0);
    signal isIPv4_tb         : std_logic;
    signal isARP_tb          : std_logic;
    signal isIPv6_tb         : std_logic;
    signal isVLANtagged_tb   : std_logic;
    signal isIPCP_tb         : std_logic;
    signal isIPv6CP_tb       : std_logic;
    signal isLLDP_tb         : std_logic;
    signal isMPLSunicast_tb  : std_logic;
    signal isMPLSmulticast_tb : std_logic;
    signal isRARP_tb         : std_logic;
    signal isOtherEthertype_tb : std_logic;
    signal isBroadcast_tb    : std_logic;
    signal sus_tb            : std_logic;

    -- Component instantiation
    component Ethernet_II_Frame_Parser
        port (
            clk : in std_logic;
            data_in : in std_logic_vector(111 downto 0);
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
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : Ethernet_II_Frame_Parser
        port map (
            clk => clk_tb,
            data_in => data_in_tb,
            destMACAddress => destMACAddress_tb,
            srcMACAddress => srcMACAddress_tb,
            isIPv4 => isIPv4_tb,
            isARP => isARP_tb,
            isIPv6 => isIPv6_tb,
            isVLANtagged => isVLANtagged_tb,
            isIPCP => isIPCP_tb,
            isIPv6CP => isIPv6CP_tb,
            isLLDP => isLLDP_tb,
            isMPLSunicast => isMPLSunicast_tb,
            isMPLSmulticast => isMPLSmulticast_tb,
            isRARP => isRARP_tb,
            isOtherEthertype => isOtherEthertype_tb,
            isBroadcast => isBroadcast_tb,
            sus => sus_tb
        );

    -- Clock process
    process
    begin
        while now < 1000 ms loop
            clk_tb <= not clk_tb after CLK_PERIOD / 2;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        wait for CLK_PERIOD * 2;

        -- Test case 1: Broadcasting frame
        data_in_tb <= "0011001100110011001100110011001100110011001100110011001100110011";
        wait for CLK_PERIOD * 10;

        -- Test case 2: Unicast frame, IPv4
        data_in_tb <= "0000111100000000001100000000000000000011111111110000000011111111";
        wait for CLK_PERIOD * 10;

        -- Add more test cases as needed

        wait;
    end process;

    -- Monitor process
    process
    begin
        wait for CLK_PERIOD / 2;

        while now < 1000 ms loop
            report "Time = " & time'image(now) &
                " destMACAddress = " & to_string(destMACAddress_tb) &
                " srcMACAddress = " & to_string(srcMACAddress_tb) &
                " isIPv4 = " & to_string(isIPv4_tb) &
                " isARP = " & to_string(isARP_tb) &
                " isBroadcast = " & to_string(isBroadcast_tb);
            wait for CLK_PERIOD;
        end loop;
        wait;
    end process;

end architecture tb_arch;
