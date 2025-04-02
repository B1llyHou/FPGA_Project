----------------------------------------------------------------------------
-- tb_dataRetrieval.vhd - A testbench that tests the functionality of the
--						  dataRetrieval.vhd module
----------------------------------------------------------------------------
-- Author: Kristian Norris
----------------------------------------------------------------------------
-- This testbench instantiates the dataRetrieval module and verifies its
-- ability to retrieve a defined number of bytes from a simulated data
-- generator using a two-phase handshaking protocol. This testbench supplies
-- control signals, simulates incoming data from the data generator, and
-- monitors the output signals dataReady and done
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pack.all;

entity tb_dataRetrieval is
end tb_dataRetrieval;

architecture test of tb_dataRetrieval is

	component dataRetrieval is
		port (
			clk: in  std_logic;
			reset: in  std_logic;
			ctrlIn: in  std_logic;
			ctrlOut: out std_logic;
			data: in  std_logic_vector(7 downto 0);
			start: in  std_logic;
			numWords: in  integer range 0 to 999;
			dataReady: out std_logic;
			done: out std_logic;
			byte: out std_logic_vector(7 downto 0)
		);
	end component;

	signal clk: std_logic := '0';
	signal reset: std_logic := '0';
	signal start: std_logic := '0';
	signal numWords: integer range 0 to 999 := 0;
	signal ctrlIn: std_logic := '0';
	signal ctrlOut: std_logic;
	signal data: std_logic_vector(7 downto 0) := (others => '0');
	signal dataReady: std_logic;
	signal done: std_logic;
	signal byte: std_logic_vector(7 downto 0);
	signal cycleCount: integer := 0;
	signal datagenCounter: integer := 0;
	signal lastctrlOut: std_logic := '0';
	
	constant maxCycleCount : integer := 100;

begin

	clk <= not clk after 5 ns;
	reset <= '0', '1' after 2 ns, '0' after 20 ns;

	cycleCounter: process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				cycleCount <= 0;
			else
				cycleCount <= cycleCount + 1;
				assert cycleCount < maxCycleCount 
					report "Cycle count exceeded " & integer'image(maxCycleCount) 
					severity failure;
			end if;
		end if;
	end process;

	dataRetrievalProcess: process
	begin
	
		wait for 50 ns;
		numWords <= 5; 			-- retrieve 5 bytes 
		start <= '1'; 			-- start data retrieval
		wait for 50 ns;
		start <= '0';
		wait until done = '1';
		wait for 50 ns;

		assert false 
			report "test complete. cycle count: " & integer'image(cycleCount) 
			severity note;
		wait;
		
	end process;

	dataRetrieval1: dataRetrieval
		port map (
			clk => clk,
			reset => reset,
			ctrlIn => ctrlIn,
			ctrlOut => ctrlOut,
			data => data,
			start => start,
			numWords => numWords,
			dataReady => dataReady,
			done => done,
			byte => byte
		);

	dataGeneratorProcess: process(clk)
		type dataSequenceType is array(0 to 4) of std_logic_vector(7 downto 0);
		constant dataSequence: dataSequenceType := (
			x"AA", x"BB", x"CC", x"DD", x"EE" -- bytes to be retrieved
		);
		
	begin
		-- simulate the data generator
		if rising_edge(clk) then
			if ctrlOut /= lastctrlOut then
				lastctrlOut <= ctrlOut;
				ctrlIn <= not ctrlIn;
				if datagenCounter < 5 then
					data <= dataSequence(datagenCounter);
					datagenCounter <= datagenCounter + 1;
				end if;
			end if;
		end if;
	end process;

end test;