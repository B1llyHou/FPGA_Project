----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2019 21:00:29
-- Design Name: 
-- Module Name: cmdProc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dataConsume is
port (
  clk:		in std_logic;
  reset:        in std_logic; -- synchronous reset
  start: in std_logic; -- goes high to signal data transfer
  numWords_bcd: in BCD_ARRAY_TYPE(2 downto 0);
  ctrlIn: in std_logic;
  ctrlOut: out std_logic;
  data: in std_logic_vector(7 downto 0);
  dataReady: out std_logic;
  byte: out std_logic_vector(7 downto 0);
  seqDone: out std_logic;
  maxIndex: out BCD_ARRAY_TYPE(2 downto 0);
  dataResults: out CHAR_ARRAY_TYPE(0 to RESULT_BYTE_NUM-1) -- index 3 holds the peak
);
end dataConsume;

architecture Behavioral of dataConsume is

    component dataConsume_synthesised is
     port (
     clk : in STD_LOGIC;
     reset : in STD_LOGIC;
     start : in STD_LOGIC;
     \numWords_bcd[2]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
     \numWords_bcd[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
     \numWords_bcd[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
     ctrlIn : in STD_LOGIC;
     ctrlOut : out STD_LOGIC;
     data : in STD_LOGIC_VECTOR ( 7 downto 0 );
     dataReady : out STD_LOGIC;
     byte : out STD_LOGIC_VECTOR ( 7 downto 0 );
     seqDone : out STD_LOGIC;
     \maxIndex[2]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
     \maxIndex[1]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
     \maxIndex[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
     \dataResults[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[1]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[2]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[4]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[5]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
     \dataResults[6]\ : out STD_LOGIC_VECTOR ( 7 downto 0 )

     ); 
    end component;

--for cmdProc_struct1:cmdProc_struct use entity work.cmdProc(STRUCTURE);

begin
    cmdProc_struct1: dataConsume_synthesised
    port map (
          clk => clk,
          reset => reset,
          start => start,          
          \numWords_bcd[0]\ => numWords_bcd(0),
          \numWords_bcd[1]\ => numWords_bcd(1),
          \numWords_bcd[2]\ => numWords_bcd(2),
          ctrlIn => ctrlIn,
          ctrlOut => ctrlOut,
          data => data,
          dataReady => dataReady,
          byte => byte,
          seqDone => seqDone,          
          \maxIndex[0]\ => maxIndex(0),
          \maxIndex[1]\ => maxIndex(1),
          \maxIndex[2]\ => maxIndex(2),          
          \dataResults[0]\ => dataResults(0),
          \dataResults[1]\ => dataResults(1),
          \dataResults[2]\ => dataResults(2),
          \dataResults[3]\ => dataResults(3),
          \dataResults[4]\ => dataResults(4),
          \dataResults[5]\ => dataResults(5),
          \dataResults[6]\ => dataResults(6)
        );

end Behavioral;
