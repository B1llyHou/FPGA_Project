----------------------------------------------------------------------------------
-- Author: Kristian Norris
-- Create Date/Time: 05.02.2025/06:07
----------------------------------------------------------------------------------
-- Module Name: dataConsume
-- Behavioural Function:
-- 1) dataConsume will wait for a signal "start" which tells it to begin retrieving data.
-- 2) dataConsume will receive numWords_bcd from the CmdProc which tells dataConsume how many bytes to process.
-- 3) dataConsume will receive a sequence of bytes (one at a time in the form of the siganl "data") from dataGen. [Two-phase handshaking protocol] (ctrlIn and ctrlOut).
-- 4) As each byte arrives, it compares against the current largest byte (this isn't instantiated in other programs so make personal signal), if the new byte is bigger, maxIndex is updated.
-- 5) dataConsume will store the max value byte as well as 3 surrounding bytes within dataResults
-- 6) When all bytes have been processed (we have reached the value stated in numWords), dataConsume asserts seqDone, and sends maxIndex, dataResults back to the CmdProc
-- 7) Wait for next start to begin processing next bytes
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;		-- Defines STD_LOGIC and STD_LOGIC_VECTOR for digital logic.
use ieee.std_logic_arith.all;		-- Provides arithmetic functions for STD_LOGIC_VECTOR.
use work.common_pack.all;			-- Imports common_pack.vhd, which instantiates CHAR_ARRAY_TYPE, BCD_ARRAY_TYPE as well as data sequences for testing


entity dataConsume is
  port (
	clk: in STD_LOGIC;											-- 100 MHz clock signal
	reset: in STD_LOGIC;										-- Resets system to initial state
	start: in STD_LOGIC;										-- Asserted by the CmdProc, starting a data retrival cycle
	numWords_bcd: in BCD_ARRAY_TYPE(2 downto 0);				-- Number of bytes to process
	ctrlIn: in STD_LOGIC;										-- Data Generator indicating data is ready (Ctrl_2 in 4.1 diagram)
    ctrlOut: out STD_LOGIC;										-- Data Processor requesting data (Ctrl_1 in 4.1 diagram)
    data: in STD_LOGIC_VECTOR (7 downto 0);						-- The data from the Data Generator to be transmitted to the PC
    dataReady: out STD_LOGIC;									-- Latest byte has been processed
    byte: out STD_LOGIC_VECTOR (7 downto 0);					-- Latest byte from the data generator
    seqDone: out STD_LOGIC;										-- dataResults is ready
    maxIndex: out BCD_ARRAY_TYPE(2 downto 0);					-- Index of the peak value
    dataResults: out CHAR_ARRAY_TYPE(0 to RESULT_BYTE_NUM-1)	-- Processed data results (peak[i=3] and 3 surrounding[each side] bytes)
  );
end dataConsume;

architecture Behavioral of dataConsume is
	
		-- Personal Signals start (I think I will need to create some of my own signals, instatiate them here)
	...
		-- Personal Signals end
	
		-- BCD to Integer start (Not 100% sure if I need this, guess we will find out ...)
	...
		-- BCD to Integer end

begin

	process(clk)
	begin
		if rising_edge(clk)
			if reset = '1' then		-- Reset all signals to 0
				...
			if start = '1' then		-- Start new data retrieval
				...
			if ctrlIn = '1' then 	-- Read next byte
			
end Behavioral;

