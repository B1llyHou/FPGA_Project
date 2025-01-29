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

entity cmdProc is
port (
    clk:		in std_logic;
    reset:        in std_logic;
    rxnow:        in std_logic;
    rxData:            in std_logic_vector (7 downto 0);
    txData:            out std_logic_vector (7 downto 0);
    rxdone:        out std_logic;
    ovErr:        in std_logic;
    framErr:    in std_logic;
    txnow:        out std_logic;
    txdone:        in std_logic;
    start: out std_logic;
    numWords_bcd: out BCD_ARRAY_TYPE(2 downto 0);
    dataReady: in std_logic;
    byte: in std_logic_vector(7 downto 0);
    maxIndex: in BCD_ARRAY_TYPE(2 downto 0);
    dataResults: in CHAR_ARRAY_TYPE(0 to RESULT_BYTE_NUM-1);
    seqDone: in std_logic
    );
end cmdProc;

architecture Behavioral of cmdProc is

    component cmdProc_synthesised is
     port (
      clk : in STD_LOGIC;
      dataReady : in STD_LOGIC;
      framErr : in STD_LOGIC;
      ovErr : in STD_LOGIC;
      reset : in STD_LOGIC;
      rxdone : out STD_LOGIC;
      rxnow : in STD_LOGIC;
      seqDone : in STD_LOGIC;
      start : out STD_LOGIC;
      txdone : in STD_LOGIC;
      txnow : out STD_LOGIC;
      byte : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[1]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[2]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[3]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[4]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[5]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \dataResults[6]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
      \maxIndex[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
      \maxIndex[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
      \maxIndex[2]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
      \numWords_bcd[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
      \numWords_bcd[1]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
      \numWords_bcd[2]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
      rxData : in STD_LOGIC_VECTOR ( 7 downto 0 );
      txData : out STD_LOGIC_VECTOR ( 7 downto 0 )
     ); 
    end component;

--for cmdProc_struct1:cmdProc_struct use entity work.cmdProc(STRUCTURE);

begin
    cmdProc_struct1: cmdProc_synthesised
    port map (
          clk => clk,
          reset => reset,
          rxNow => rxNow,
          rxData => rxData,
          txData => txData,
          rxDone => rxDone,
          ovErr => ovErr,
          framErr => framErr,
          txNow => txNow,
          txDone => txDone,
          start => start,
          \numWords_bcd[0]\ => numWords_bcd(0),
          \numWords_bcd[1]\ => numWords_bcd(1),
          \numWords_bcd[2]\ => numWords_bcd(2),
          dataReady => dataReady,
          byte => byte,
          \maxIndex[0]\ => maxIndex(0),
          \maxIndex[1]\ => maxIndex(1),
          \maxIndex[2]\ => maxIndex(2),
          seqDone => seqDone,
          \dataResults[0]\ => dataResults(6),
          \dataResults[1]\ => dataResults(5),
          \dataResults[2]\ => dataResults(4),
          \dataResults[3]\ => dataResults(3),
          \dataResults[4]\ => dataResults(2),
          \dataResults[5]\ => dataResults(1),
          \dataResults[6]\ => dataResults(0)
        );

end Behavioral;
