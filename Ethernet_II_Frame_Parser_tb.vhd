ARCHITECTURE tb_arch OF Ethernet_II_Frame_Parser_tb IS
    -- Constants
    CONSTANT CLK_PERIOD : TIME := 1000 ps;

    -- Signals
    SIGNAL clk_tb : STD_LOGIC := '0';
    SIGNAL data_in_tb : STD_LOGIC_VECTOR(111 DOWNTO 0) := (OTHERS => '0');

    SIGNAL destMACAddress_tb : STD_LOGIC_VECTOR(47 DOWNTO 0);
    SIGNAL srcMACAddress_tb : STD_LOGIC_VECTOR(47 DOWNTO 0);
    SIGNAL isIPv4_tb : STD_LOGIC;
    SIGNAL isARP_tb : STD_LOGIC;
    SIGNAL isIPv6_tb : STD_LOGIC;
    SIGNAL isVLANtagged_tb : STD_LOGIC;
    SIGNAL isIPCP_tb : STD_LOGIC;
    SIGNAL isIPv6CP_tb : STD_LOGIC;
    SIGNAL isLLDP_tb : STD_LOGIC;
    SIGNAL isMPLSunicast_tb : STD_LOGIC;
    SIGNAL isMPLSmulticast_tb : STD_LOGIC;
    SIGNAL isRARP_tb : STD_LOGIC;
    SIGNAL isOtherEthertype_tb : STD_LOGIC;
    SIGNAL isBroadcast_tb : STD_LOGIC;
    SIGNAL sus_tb : STD_LOGIC;

    -- Component instantiation
    COMPONENT Ethernet_II_Frame_Parser
        PORT (
            clk : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(111 DOWNTO 0);
            destMACAddress : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
            srcMACAddress : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
            isIPv4 : OUT STD_LOGIC;
            isARP : OUT STD_LOGIC;
            isIPv6 : OUT STD_LOGIC;
            isVLANtagged : OUT STD_LOGIC;
            isIPCP : OUT STD_LOGIC;
            isIPv6CP : OUT STD_LOGIC;
            isLLDP : OUT STD_LOGIC;
            isMPLSunicast : OUT STD_LOGIC;
            isMPLSmulticast : OUT STD_LOGIC;
            isRARP : OUT STD_LOGIC;
            isOtherEthertype : OUT STD_LOGIC;
            isBroadcast : OUT STD_LOGIC;
            sus : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : Ethernet_II_Frame_Parser
    PORT MAP(
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
    PROCESS
    BEGIN
        WHILE NOW < 4000 ps LOOP
            clk_tb <= NOT clk_tb AFTER CLK_PERIOD / 4;
            WAIT FOR CLK_PERIOD / 4;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Stimulus process
    PROCESS
    BEGIN
        -- Test case 1: Broadcasting frame
        data_in_tb <= "1111111111111111111111111111111111111111111111110000000000011010001010110011110001001101010111100000100000000000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for broadcasting frame
        ASSERT isBroadcast_tb = '1'
            REPORT "Test case 1 failed: Frame should be broadcast" SEVERITY FAILURE;

        -- Test case 2: Unicast frame with specific destination MAC address
        data_in_tb <= "0011001100110011001100110011001100110011001100110000000000011010001010110011110001001101010111100000100000000000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for unicast frame
        ASSERT isBroadcast_tb = '0' AND destMACAddress_tb = "001100110011001100110011001100110011001100110011" -- Replace with the expected MAC address
            REPORT "Test case 2 failed: Frame should be unicast with specific destination MAC address" SEVERITY FAILURE;

        -- Test case 3: VLAN-tagged frame
        data_in_tb <= "1111111111111111111111111111111111111111111111110000000000011010001010110011110001001101010111100000100000010000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for VLAN-tagged frame
        ASSERT isVLANtagged_tb = '1'
            REPORT "Test case 3 failed: Frame should be VLAN-tagged" SEVERITY FAILURE;

        -- Test case 4: Frame with IPv4 payload
        data_in_tb <= "0011001100110011001100110011001100110011001100110000000000011010001010110011110001001101010111100000100000000000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for IPv4 payload
        ASSERT isIPv4_tb = '1'
            REPORT "Test case 4 failed: Frame should contain IPv4 payload" SEVERITY FAILURE;

        -- Test case 5: Frame with ARP payload
        data_in_tb <= "0000100000000110001100110011001100110011001100110000000000011010001010110011110001001101010111100000100000000000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for ARP payload
        ASSERT isARP_tb = '1'
            REPORT "Test case 5 failed: Frame should contain ARP payload" SEVERITY FAILURE;

        -- Test case 6: Frame with IPv6 payload
        data_in_tb <= "1000011011011101001100110011001100110011001100110000000000011010001010110011110001001101010111100000100000000000";
        WAIT FOR CLK_PERIOD;
        -- Add assertion for IPv6 payload
        ASSERT isIPv6_tb = '1'
            REPORT "Test case 6 failed: Frame should contain IPv6 payload" SEVERITY FAILURE;

        -- Add more test cases and assertions as needed

        WAIT;
    END PROCESS;

END ARCHITECTURE tb_arch;
