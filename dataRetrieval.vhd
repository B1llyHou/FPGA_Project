----------------------------------------------------------------------------
-- dataRetrieval.vhd - A submodule of dataConsume.vhd that controls the 
--					   retrieval of a defined number of data bytes from 
--					   the data generator using a two-phase handshaking 
--					   protocol
----------------------------------------------------------------------------
-- Author: Kristian Norris
----------------------------------------------------------------------------
-- This module retrieves bytes from the data generator. It uses a finite
-- state machine to manage handshake signals (ctrlIn, ctrlOut), read incoming
-- bytes, and raise signals (dataReady, done). The number of bytes to retrieve
-- is specified by numWords, and data retrieval begins when the start signal
-- is raised.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pack.all;

entity dataRetrieval is
	port (
		clk: in  std_logic;         				-- system clock
		reset: in  std_logic;         				-- full system synchronous reset
		-- data generator handshake signals
		ctrlIn: in  std_logic;         				-- control from data generator (data is ready)
		ctrlOut: out std_logic;         			-- control output to data generator (data request)
		data: in  std_logic_vector(7 downto 0);  	-- byte from data generator
		-- control signals
		start: in  std_logic;         				-- start data retrieval
		numWords: in  integer range 0 to 999;  		-- number of words to retrieve
		dataReady: out std_logic;         			-- raised when data is ready
		done: out std_logic;          				-- data retrieval is complete
		-- output data
		byte: out std_logic_vector(7 downto 0)	    -- output byte to peakDetection
	);
end dataRetrieval;

architecture behav of dataRetrieval is

	type state_type is (		-- state definitions
		IdleState,             	-- wait for start to be raised to begin data retrieval
		DataRequestState,      	-- raise ctrlOut, requesting a byte from data generator
		DataRequestIdleState,  	-- wait for ctrlIn to raise, signalling byte from data generator is ready
		ReadByteState          	-- process the current byte from the data generator and check for completion
	);
    
	signal state: state_type := IdleState;  									-- current state
	signal count: integer := 0;             									-- tracks the number of bytes read
	signal lastctrlIn: std_logic := '0';         								-- stores previous ctrlIn for edge detection
	signal ctrlOutDataRetrieval: std_logic := '0';         						-- drives ctrlOut signal
	signal dataReadyDataRetrieval: std_logic := '0';         					-- internal signal remains unchanged
	signal byteDataRetrieval: std_logic_vector(7 downto 0) := (others => '0');	-- stores byte from data generator
	signal doneDataRetrieval: std_logic := '0';         						-- indicates completion
	
begin
	-- isolate internal logic from ports, stopping different modules driving the same signal
	ctrlOut <= ctrlOutDataRetrieval;
	byte <= byteDataRetrieval;
	dataReady <= dataReadyDataRetrieval;
	done <= doneDataRetrieval;

	process(clk)
	begin
		if rising_edge(clk) then
	   
			if reset = '1' then 						-- when reset is raised, set all signals to their initial value
				state <= IdleState;
				count <= 0;
				lastctrlIn <= ctrlIn;
				ctrlOutDataRetrieval <= '0';
				dataReadyDataRetrieval <= '0';
				doneDataRetrieval <= '0';
				byteDataRetrieval <= (others => '0');
			else
				dataReadyDataRetrieval <= '0';			-- clear every clock cycle. dataReady should only be raised for one clock cycle
				doneDataRetrieval <= '0';				-- clear every clock cycle. done should only be raised for one clock cycle
			 
				case state is 							-- define each state in the FSM 
			 
				----------------------------------------------------------------------------
				-- IdleState - wait for start signal to be raised before initiating data
				-- retrieval. initiating data retrieval consists of resetting the byte
				-- counter, storing the current ctrlIn for edge detection, ensuring ctrlOut
				-- is low, adn transitioning to the DataRquestState.
				----------------------------------------------------------------------------
			 
				when IdleState =>
					if start = '1' then
						count <= 0;
						lastctrlIn <= ctrlIn;
						ctrlOutDataRetrieval <= '0';
						state <= DataRequestState;
					end if;

				----------------------------------------------------------------------------
				-- DataRequestState - raise ctrlOut to request a new byte from the data
				-- generator. After this, transition to the DataRequestIdleState
				----------------------------------------------------------------------------  
				 
				when DataRequestState =>
					ctrlOutDataRetrieval <= not ctrlOutDataRetrieval;
					state <= DataRequestIdleState;
				   
				----------------------------------------------------------------------------
				-- DataRequestIdleState - wait for a change in ctrlIn from the data generator,
				-- indicating that the requested byte is ready. Once a change in ctrlIn is
				-- detected, transition to the ReadByteState
				----------------------------------------------------------------------------  
				   
				when DataRequestIdleState =>
					if ctrlIn /= lastctrlIn then
						lastctrlIn <= ctrlIn;
						state <= ReadByteState;
					end if;
				   
				----------------------------------------------------------------------------
				-- ReadByteState - store the incoming byte from the data generator, raise
				-- the dataReady signal, and check if the desired number of words has been
				-- retrieved. If not, transition to DataRequestState, otherwise, raise
				-- the done signal and transition back to IdleState.
				----------------------------------------------------------------------------  
				   
				when ReadByteState =>
					byteDataRetrieval <= data;
					dataReadyDataRetrieval <= '1';
					if count < numWords - 1 then
						count <= count + 1;
						state <= DataRequestState;
					else
						count <= count + 1;
						doneDataRetrieval <= '1';
						state <= IdleState;
					end if;
				   
				end case;
			end if;
		end if;
	end process;
end behav;
