----------------------------------------------------------------------------
-- tb_bcd_integer_conversion.vhd - A testbench that tests the functionality
-- 								   of the bcd_integer_conversion.vhd package.
----------------------------------------------------------------------------
-- Author: Yihyun Kwon
----------------------------------------------------------------------------
-- This testbench instantiates the bcd_integer_conversion package and tests
-- the bcd_to_integer and integer_to_bcd functions. Multiple test values are
-- available and can be manually selected by uncommenting the desired values.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.common_pack.all;
use work.bcd_integer_conversion.all;

entity tb_bcd_integer_conversion is
end tb_bcd_integer_conversion;

architecture test of tb_bcd_integer_conversion is

	-- multiple test values can be found below. uncomment the value to be tested

	signal intInput: integer := 443;
	--signal intInput: integer := 0;
	--signal intInput: integer := 999;
	--signal intInput: integer := 85;
	--signal intInput: integer := 732;

	signal bcdInput: std_logic_vector(11 downto 0) := x"443";
	--signal bcdInput: std_logic_vector(11 downto 0) := x"000";
	--signal bcdInput: std_logic_vector(11 downto 0) := x"999";
	--signal bcdInput: std_logic_vector(11 downto 0) := x"085";
	--signal bcdInput: std_logic_vector(11 downto 0) := x"732";
	
	signal intResult: integer;
	signal bcdResult: BCD_ARRAY_TYPE(2 downto 0);

begin

	process
	begin

		intResult <= bcd_to_integer(bcdInput);
		bcdResult <= integer_to_bcd(intInput);
		
		wait;
	end process;
	
end test;
