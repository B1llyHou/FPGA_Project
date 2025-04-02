----------------------------------------------------------------------------
-- bcd_integer_conversion.vhd - A package that provides conversion functions
-- 								between integer values and BCD values.
----------------------------------------------------------------------------
-- Author: Yihyun Kwon
----------------------------------------------------------------------------
-- This package defines two conversion functions: bcd_to_integer as well as
-- integer_to_bcd. bcd_to_integer converts a 12 bit BCD value into an integer
-- whilst integer_to_bcd converts an integer (with a range of 0 to 999) into
-- a BCD_ARRAY_TYPE value (which is defined in common_pack.vhd)
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.common_pack.all;

package bcd_integer_conversion is
	function bcd_to_integer(bcd : std_logic_vector(11 downto 0)) return integer;
	function integer_to_bcd(val : integer) return BCD_ARRAY_TYPE;
end package bcd_integer_conversion;

package body bcd_integer_conversion is

	-- bcd_unit_to_integer converts a 4-bit BCD byte into its integer value
	function bcd_unit_to_integer(digit : std_logic_vector(3 downto 0)) return integer is
		variable result : integer;
	begin
		case digit is
			when x"0" => result := 0;
			when x"1" => result := 1;
			when x"2" => result := 2;
			when x"3" => result := 3;
			when x"4" => result := 4;
			when x"5" => result := 5;
			when x"6" => result := 6;
			when x"7" => result := 7;
			when x"8" => result := 8;
			when x"9" => result := 9;
			when others => result := 0;
		end case;
		return result;
	end function;

	-- integer_unit_to_bcd converts an integer unit into its 4-bit BCD value
	function integer_unit_to_bcd(digit : integer) return std_logic_vector is
		variable result : std_logic_vector(3 downto 0);
	begin
		case digit is
			when 0 => result := x"0";
			when 1 => result := x"1";
			when 2 => result := x"2";
			when 3 => result := x"3";
			when 4 => result := x"4";
			when 5 => result := x"5";
			when 6 => result := x"6";
			when 7 => result := x"7";
			when 8 => result := x"8";
			when 9 => result := x"9";
			when others => result := x"0";
		end case;
		return result;
	end function;

	-- bcd_to_integer uses the previously defined bcd_unit_to_integer function to 
	-- convert a 12 bit BCD value into an integer
	function bcd_to_integer(bcd : std_logic_vector(11 downto 0)) return integer is
		variable hundred, ten, unit : integer;
	begin
		hundred := bcd_unit_to_integer(bcd(11 downto 8));
		ten := bcd_unit_to_integer(bcd(7 downto 4));
		unit := bcd_unit_to_integer(bcd(3 downto 0));
		return hundred * 100 + ten * 10 + unit;
	end function;


	-- integer_to_bcd uses the previously defined integer_unit_to_bcd function to
	-- convert an integer (0-999) into a BCD value
	function integer_to_bcd(val : integer) return BCD_ARRAY_TYPE is
		variable hundred, ten, unit : integer;
		variable result : BCD_ARRAY_TYPE(2 downto 0);
	begin
		hundred := val / 100;
		ten := (val mod 100) / 10;
		unit := val mod 10;

		result(2) := integer_unit_to_bcd(hundred);
		result(1) := integer_unit_to_bcd(ten);
		result(0) := integer_unit_to_bcd(unit);

		return result;
	end function;

end package body bcd_integer_conversion;