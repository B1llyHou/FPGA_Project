----------------------------------------------------------------------------
-- dataConsume.vhd - Top level  module that controls the data retrieval and
--					 peak detection submodules
----------------------------------------------------------------------------
-- Author: Kristian Norris
----------------------------------------------------------------------------
-- This module coordinates the data retrieval and peak detection processes 
-- established in dataRetrieval.vhd and peakDetection.vhd. It waits for the
-- start signal, converts the BCD numWords input into an integer (for the
-- dataRetrieval submodule) and triggers both submodules to initiate.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pack.all;
use work.bcd_integer_conversion.all;

entity dataConsume is
	port(
		clk: in  std_logic; 							-- system clock
		reset: in  std_logic; 							-- full system synchronous reset
		ctrlIn: in  std_logic; 							-- control from data generator (data is ready)
		ctrlOut: out std_logic; 						-- control output to data generator (data request)
		data: in  std_logic_vector(7 downto 0); 		-- byte from data generator
		start: in  std_logic; 							-- start data retrieval and peak detection
		numWords_bcd: in  BCD_ARRAY_TYPE(2 downto 0);	-- number of words to retrieve
		dataReady: out std_logic; 						-- raised when byte from data retrieval is ready
		byte: out std_logic_vector(7 downto 0); 		-- each byte from data retrieval process
		maxIndex: out BCD_ARRAY_TYPE(2 downto 0); 		-- index of the peak byte
		dataResults: out CHAR_ARRAY_TYPE(0 to 6);		-- sequence containing the peak byte and 6 surrounding bytes
		seqDone: out std_logic 							-- raised when peak detection is complete
	);
end dataConsume;

architecture behav of dataConsume is

	-- dataConsume FSM
	type state_type is (	-- dataConsume FSM
		IdleState, 			-- wait for start to be raised to initiate data retrieval and peak detection
		ActiveState 		-- wait for sequence completion to return to IdleState
	);
	
	signal state: state_type := IdleState; 		-- current state 
	
	-- internal signals for submodule communication
	signal startDataConsume: std_logic := '0'; 	-- start signal, when raised, initiates the data retrieval and peak detector sub modules
	signal numWordsDataConsume: integer := 0; 	-- number of bytes to retrieve from the data generator (in integer format)

	-- dataRetrieval outputs
	signal byteDataRetrieval: std_logic_vector(7 downto 0);
	signal dataReadyDataRetrieval: std_logic;
	signal doneDataRetrieval: std_logic;
	signal ctrlOutDataRetrieval: std_logic;

	-- peakDetection outputs
	signal dataResultsPeakDetection: CHAR_ARRAY_TYPE(0 to 6);
	signal maxIndexPeakDetection: BCD_ARRAY_TYPE(2 downto 0);
	signal seqDonePeakDetection: std_logic;

begin

	-- Instantiate dataRetrieval
	dataRetrieval1: entity work.dataRetrieval
		port map (
			clk => clk,
			reset => reset,
			start => startDataConsume,
			numWords => numWordsDataConsume,
			ctrlIn => ctrlIn,
			data => data,
			ctrlOut => ctrlOutDataRetrieval,
			dataReady => dataReadyDataRetrieval,
			done => doneDataRetrieval,
			byte => byteDataRetrieval
		);

	-- Instantiate peakDetection
	peakDetection1: entity work.peakDetection
		port map (
			clk => clk,
			reset => reset,
			start => startDataConsume,
			byte => byteDataRetrieval,
			dataReady => dataReadyDataRetrieval,
			done => doneDataRetrieval,
			dataResults => dataResultsPeakDetection,
			maxIndex => maxIndexPeakDetection,
			seqDone => seqDonePeakDetection
		);

	ctrlOut <= ctrlOutDataRetrieval;
	byte <= byteDataRetrieval;
	dataReady <= dataReadyDataRetrieval;
	dataResults <= dataResultsPeakDetection;
	maxIndex <= maxIndexPeakDetection;
	seqDone <= seqDonePeakDetection;

	process(clk)
	begin
		if rising_edge(clk) then
		
			if reset = '1' then 		-- when reset is raised, set all signals to their initial value
				state <= IdleState;
				startDataConsume <= '0';
				numWordsDataConsume <= 0;
			else

				case state is 			-- define each state in the FSM
				
					----------------------------------------------------------------------------
					-- IdleState - wait for start signal. once recieved, convert the number of
					-- bytes to be retrieved into an integer value, then, initiate the data
					-- retrieval and peak detection modules by raising startDataConsume. finally,
					-- transition to ActiveState.
					----------------------------------------------------------------------------

					when IdleState =>
						if start = '1' then
							numWordsDataConsume <= bcd_to_integer(numWords_bcd(2) & numWords_bcd(1) & numWords_bcd(0));
							startDataConsume <= '1';
							state <= ActiveState;
						end if;
						
					----------------------------------------------------------------------------
					-- ActiveState - set startDataConsume to zero such that when a sequence is
					-- completed, the data retrieval and peak detection modules dont retrigger
					-- again. Continuously check for sequence completion and return to IdleState
					-- if a sequence is completed.
					----------------------------------------------------------------------------

					when ActiveState =>
						startDataConsume <= '0';
						if seqDonePeakDetection = '1' then
							state <= IdleState;
						end if;

				end case;
			end if;
		end if;
	end process;

end behav;
