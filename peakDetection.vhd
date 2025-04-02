----------------------------------------------------------------------------
-- peakDetection.vhd - A submodule of dataConsume.vhd that identifies the
--					   peak byte from a sequence of bytes retrieved by the
--					   dataRetrieval module
----------------------------------------------------------------------------
-- Author: Yihyun Kwon
----------------------------------------------------------------------------
-- This module performs peak detection on a sequence on incoming bytes from
-- the dataRetrieval module. It stores each byte and continuously compares
-- incoming bytes to track the peak byte. Once the entire sequence of bytes
-- has been processed, the module outputs a 7 byte sequence consisting of the 
-- peak byte along with 6 surrounding bytes along with the index of the peak
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pack.all;
use work.bcd_integer_conversion.all;

entity peakDetection is
	port (
		clk: in  std_logic; 						-- system clock
		reset: in  std_logic; 						-- full system synchronous reset
		-- data retrieval signals
		byte: in  std_logic_vector(7 downto 0);  	-- input byte from dataRetrieval
		dataReady: in  std_logic; 					-- indicates a new byte is available	
		-- control signals 
		start: in  std_logic; 						-- initiates the peak detection sequence
		done: in  std_logic; 						-- signals the end of data retrieval
		-- output data
		dataResults: out CHAR_ARRAY_TYPE(0 to 6);	-- sequence containing the peak byte and 6 surrounding bytes
		maxIndex: out BCD_ARRAY_TYPE(2 downto 0);	-- index of the peak byte
		seqDone: out std_logic   					-- raised when peak detection is complete
	);
end peakDetection;

architecture behav of peakDetection is
   
	type state_type is (	-- state definitions
		IdleState,       	-- wait for start to be raised to begin peak detection
		PeakCompareState,	-- compare new byte against peak
		DataFormatState	-- prepare dataResults and maxIndex for output
	);
   
	type byteStorageType is array (0 to 999) of std_logic_vector(7 downto 0);	-- definiing the byte storage array
   
	signal state: state_type := IdleState;        												-- current state
	signal byteStorage: byteStorageType;														-- stores all bytes recieved from data retrieval such that peak's surrounding bytes can be retrieved
	signal count: integer := 0;              													-- tracks the number of bytes recieved
	signal peakVal: std_logic_vector(7 downto 0) := (others => '0');							-- stores peak byte value
	signal peakIndex: integer := 0;              												-- stores the index of the maximum byte during comparisons
	signal maxIndexPeakDetection: integer := 0;       											-- stores the index of the maximum byte for output
	signal dataResultsPeakDetection: CHAR_ARRAY_TYPE(0 to 6) := (others => (others => '0'));	-- stores the sequence containing peak byte and 6 surrounding bytes
	signal seqDonePeakDetection: std_logic := '0';												-- raised when peak detection is complete
	signal bytePeakDetection: std_logic_vector(7 downto 0) := (others => '0');					-- byte from data generator
	signal dataReadyPeakDetection: std_logic := '0';											-- raised when data is ready

begin
	-- isolate internal logic from ports, stopping different modules driving the same signal
	maxIndex <= integer_to_bcd(maxIndexPeakDetection);
	dataResults <= dataResultsPeakDetection;
	seqDone <= seqDonePeakDetection;
	bytePeakDetection <= byte;
	dataReadyPeakDetection <= dataReady;

	process(clk)
		variable dataResultsTemp: CHAR_ARRAY_TYPE(0 to 6);	-- temporary dataResults storage before reversing the sequence (as to pass the supplied testbench)
		variable i: integer; 								-- loop counter variable
	begin
		if rising_edge(clk) then
	  
			if reset = '1' then 				-- when reset is raised, set all signals to their initial value
				state <= IdleState;
				count <= 0;
				peakVal <= (others => '0');
				peakIndex <= 0;
				maxIndexPeakDetection <= 0;
				seqDonePeakDetection <= '0';
			else 								-- clear this signal every clock cycle so that it is only raised for one clock pulse
				seqDonePeakDetection <= '0';	-- clear every clock cycle. seqDone should only be raised for one clock cycle
            
				case state is 					-- define each state in the FSM 

					----------------------------------------------------------------------------
					-- IdleState - wait for start signal to initiate peak detection. initiating
					-- peak detection consists of resetting the byte counter, peak byte value,
					-- and peak byte index, then, transitioning to PeakCompareState
					----------------------------------------------------------------------------

					when IdleState =>
						if start = '1' then
							count <= 0;
							peakVal <= (others => '0');
							peakIndex <= 0;
							state <= PeakCompareState;
						end if;

					----------------------------------------------------------------------------
					-- PeakCompareState - store incoming byte within byteStorage for future 
					-- retrieval when bytes surrounding the peak are required. compare incoming
					-- byte with the current peak byte and update peak byte and peak index if
					-- a new peak byte is found.
					----------------------------------------------------------------------------

					when PeakCompareState =>
						if dataReadyPeakDetection = '1' then
							byteStorage(count) <= bytePeakDetection;
							if signed(bytePeakDetection) > signed(peakVal) then
								peakVal <= bytePeakDetection;
								peakIndex <= count;
							end if;
							count <= count + 1;
						end if;
						if done = '1' then
							state <= DataFormatState;
						end if;

					----------------------------------------------------------------------------
					-- DataFormatState - use the peak byte index to retrieve the 6 surrounding
					-- bytes from byteStorage. Reverse the sequence before output to match the
					-- order they are recieved, not stored.
					----------------------------------------------------------------------------

					when DataFormatState =>
						maxIndexPeakDetection <= peakIndex;
						for i in 0 to 6 loop
							if (peakIndex - 3 + i) < 0 or (peakIndex - 3 + i) >= count then
								dataResultsTemp(i) := (others => '0');
							else
								dataResultsTemp(i) := byteStorage(peakIndex - 3 + i);
							end if;
						end loop;
						for i in 0 to 6 loop
							dataResultsPeakDetection(i) <= dataResultsTemp(6-i);	
						end loop;
					  
						seqDonePeakDetection <= '1';
						state <= IdleState;
					  
				end case;
			end if;
		end if;
	end process;
end behav;