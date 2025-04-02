----------------------------------------------------------------------------
-- tb_peakDetection.vhd - A testbench that tests the functionality of the
--						  peakDetection.vhd module
----------------------------------------------------------------------------
-- Author: Yihyun Kwon
----------------------------------------------------------------------------
-- This testbench instantiates the peakDetection module and verifies its
-- ability to detect peak values within a sequence of input bytes. This
-- testbench supplies control signals and simulates and incoming data stream
-- with a predefined sequence of bytes. The testbench monitors the output
-- signals dataResults, maxIndex, and done.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pack.all;
use work.bcd_integer_conversion.all;

entity tb_peakDetection is
end tb_peakDetection;

architecture test of tb_peakDetection is

	component peakDetection is
		port (
			clk: in  std_logic;
			reset: in  std_logic;
			byte: in  std_logic_vector(7 downto 0);
			dataReady: in  std_logic;
			start: in  std_logic;
			done: in  std_logic;
			dataResults: out CHAR_ARRAY_TYPE(0 to 6);
			maxIndex: out BCD_ARRAY_TYPE(2 downto 0);
			seqDone: out std_logic
		);
	end component;

	signal clk: std_logic := '0';
	signal reset: std_logic := '0';
	signal byte: std_logic_vector(7 downto 0) := (others => '0');
	signal dataReady: std_logic := '0';
	signal start: std_logic := '0';
	signal done: std_logic := '0';
	signal dataResults: CHAR_ARRAY_TYPE(0 to 6);
	signal maxIndex: BCD_ARRAY_TYPE(2 downto 0);
	signal seqDone: std_logic;
	
	signal cycleCount: integer := 0;
	constant maxCycleCount : integer := 100;

	type byteSequence is array (0 to 9) of std_logic_vector(7 downto 0);
	constant dataRetrievalSequence: byteSequence := (
		x"AA", x"11", x"CC", x"DD", x"FF", x"FD", x"DF", x"34", x"AA", x"BB"  -- bytes to be processed 
	);
	
	constant test_length: integer := 10;

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

	peakDetectionProcess: process
		variable i: integer := 0;
	begin
		wait for 50 ns;
		start <= '1'; -- initiate peak detection
		wait for 50 ns;
		start <= '0';
		wait for 50 ns;
      
		for i in 0 to test_length - 1 loop
			byte <= dataRetrievalSequence(i); -- simulate bytes coming in from dataRetrieval
			dataReady <= '1';
			wait for 10 ns;
			dataReady <= '0';
			wait for 10 ns;
		end loop;
      
		done <= '1'; -- dataRetrieval complete (raised for one clock cycle)
		wait for 10 ns;
		done <= '0';
      
		wait for 50 ns;
      
		assert false 
			report "test complete. cycle count: " & integer'image(cycleCount) 
			severity note;
		wait;

	peakDetection1: peakDetection
		port map (
			clk => clk,
			reset => reset,
			byte => byte,
			dataReady => dataReady,
			start => start,
			done => done,
			dataResults => dataResults,
			maxIndex => maxIndex,
			seqDone => seqDone
		);

end architecture test;
