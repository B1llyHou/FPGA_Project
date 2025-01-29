----------------------------------------------------------------------------
--	test_top.vhd -- Top level component for testing
----------------------------------------------------------------------------
-- Author:  Dinesh Pamunuwa
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--	This component instantiates the Rx, Tx and control_unit_test
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Version:			1.0
-- Revision History:
--  31/01/2019 (Dinesh): Created using Xilinx Vivado for 64 bit Win
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity TEST_TOP is 
	port (
		clk:	in std_logic;
		clear:	in std_logic; -- asynchronous reset
		reset:	in std_logic; -- synchronous reset
		rxData:	in std_logic;
		txData:	out std_logic
	);
end;

architecture STRUCT of TEST_TOP is

    component clk_wiz_0
    port (
        clk_out          : out    std_logic; -- Clock out ports
        clk_in           : in     std_logic  -- Clock in ports
    );
    end component;


	component UART_TX_CTRL is
		port( 
			SEND : in  STD_LOGIC; -- start Tx (active high)
			DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- parallel data in
			CLK : in  STD_LOGIC; -- system clock
			READY : out  STD_LOGIC; -- Tx done (active high)
			UART_TX : out  STD_LOGIC -- seial data out
		);
	end component;  

	component UART_RX_CTRL is
	  port(
		 RxD: in std_logic; 			-- serial data in
		 sysclk: in std_logic; 		-- system clock
		 reset: in std_logic;		--	synchronous reset
		 rxDone: in std_logic;		-- data succesfully read (active high)
		 rcvDataReg: out std_logic_vector(7 downto 0); -- received data
		 dataReady: out std_logic;	-- data ready to be read
		 setOE: out std_logic;		-- overrun error (active high)
		 setFE: out std_logic		-- frame error (active high)
	  );
	end component;


	component CONTROL_UNIT_TST is
		port (
			clk:		in std_logic; -- system clock
			clear:		in std_logic; -- asynchronous reset
			reset:		in std_logic; -- synchronous reset
			rxnow:		in std_logic; -- data ready signal from Rx
			rx:			in std_logic_vector (7 downto 0); -- parallel data in
			tx:			out std_logic_vector (7 downto 0); -- parallel data out
			rxdone:		out std_logic; -- data read complete signal to Rx
			ovrerr:		in std_logic; -- overrun error (not used in this implementation)
			framerr:	in std_logic; -- frame error  (not used in this implementation)
			txnow:		out std_logic; -- data ready signal to Tx
			txdone:		in std_logic  -- data transmission complete signal from Tx
		);
	end component;	

	for rx: UART_RX_CTRL use
	  entity work.UART_RX_CTRL(rcvr);

    signal clk_100: std_logic;
	signal sig_rxnow, sig_rxdone, sig_overr, sig_framerr, sig_txnow, sig_txdone: std_logic;
	signal sig_rxdata, sig_txdata: std_logic_vector (7 downto 0);
begin 

clk_wiz : clk_wiz_0
   port map (  
   clk_out => clk_100, -- Clock out ports  
   clk_in => clk       -- Clock in ports
 );


control:	CONTROL_UNIT_TST
	port map (
		clk => clk_100,
		clear => clear,
		reset => reset,
		rxnow => sig_rxnow,
		rx => sig_rxdata,
		tx => sig_txdata,
		rxdone => sig_rxdone,
		ovrerr => sig_overr,
		framerr => sig_framerr,
		txnow => sig_txnow,
		txdone => sig_txdone
	);

tx: UART_TX_CTRL
	port map (
		SEND => sig_txnow,
		DATA => sig_txdata,
		CLK => clk_100,
		READY => sig_txdone,
		UART_TX => txdata
	);

rx : UART_RX_CTRL
   port map(
	  RxD => rxdata, -- input serial line
	  sysclk => clk_100,
	  reset => reset, 
	  rxDone => sig_rxdone,
	  rcvDataReg => sig_rxdata,
     dataReady => sig_rxnow,
     setOE => sig_overr,
     setFE =>  sig_framerr
   ); 
	
end;