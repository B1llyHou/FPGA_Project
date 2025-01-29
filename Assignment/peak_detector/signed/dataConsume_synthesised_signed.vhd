-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Feb  7 16:13:36 2019
-- Host        : IT000752 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl E:/work/teaching/Bristol/Digital_ECAD/compareSims/dataConsume_synthesised_signed.vhd
--               -rename_top dataConsume_synthesised -cell dataConsume -mode funcsim
-- Design      : dataConsume
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comparator is
  port (
    data1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    grtThan : out STD_LOGIC;
    equal : out STD_LOGIC
  );
end comparator;

architecture STRUCTURE of comparator is
  signal \<const0>\ : STD_LOGIC;
  signal grtThan_INST_0_i_1_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_2_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_3_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_4_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_5_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_6_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_7_n_0 : STD_LOGIC;
  signal grtThan_INST_0_i_8_n_0 : STD_LOGIC;
  signal grtThan_INST_0_n_1 : STD_LOGIC;
  signal grtThan_INST_0_n_2 : STD_LOGIC;
  signal grtThan_INST_0_n_3 : STD_LOGIC;
  signal NLW_grtThan_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  equal <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
grtThan_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => grtThan,
      CO(2) => grtThan_INST_0_n_1,
      CO(1) => grtThan_INST_0_n_2,
      CO(0) => grtThan_INST_0_n_3,
      CYINIT => '0',
      DI(3) => grtThan_INST_0_i_1_n_0,
      DI(2) => grtThan_INST_0_i_2_n_0,
      DI(1) => grtThan_INST_0_i_3_n_0,
      DI(0) => grtThan_INST_0_i_4_n_0,
      O(3 downto 0) => NLW_grtThan_INST_0_O_UNCONNECTED(3 downto 0),
      S(3) => grtThan_INST_0_i_5_n_0,
      S(2) => grtThan_INST_0_i_6_n_0,
      S(1) => grtThan_INST_0_i_7_n_0,
      S(0) => grtThan_INST_0_i_8_n_0
    );
grtThan_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => data1(6),
      I1 => data2(6),
      I2 => data1(7),
      I3 => data2(7),
      O => grtThan_INST_0_i_1_n_0
    );
grtThan_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => data1(4),
      I1 => data2(4),
      I2 => data2(5),
      I3 => data1(5),
      O => grtThan_INST_0_i_2_n_0
    );
grtThan_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => data1(2),
      I1 => data2(2),
      I2 => data2(3),
      I3 => data1(3),
      O => grtThan_INST_0_i_3_n_0
    );
grtThan_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => data1(0),
      I1 => data2(0),
      I2 => data2(1),
      I3 => data1(1),
      O => grtThan_INST_0_i_4_n_0
    );
grtThan_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data1(6),
      I1 => data2(6),
      I2 => data2(7),
      I3 => data1(7),
      O => grtThan_INST_0_i_5_n_0
    );
grtThan_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data1(4),
      I1 => data2(4),
      I2 => data1(5),
      I3 => data2(5),
      O => grtThan_INST_0_i_6_n_0
    );
grtThan_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data1(2),
      I1 => data2(2),
      I2 => data1(3),
      I3 => data2(3),
      O => grtThan_INST_0_i_7_n_0
    );
grtThan_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data1(0),
      I1 => data2(0),
      I2 => data1(1),
      I3 => data2(1),
      O => grtThan_INST_0_i_8_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dataConsume_synthesised is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dataConsume_synthesised : entity is true;
end dataConsume_synthesised;

architecture STRUCTURE of dataConsume_synthesised is
  signal ctrlIn_delayed : STD_LOGIC;
  signal \^ctrlout\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of ctrlOut : signal is "true";
  signal ctrlOut_reg_i_1_n_0 : STD_LOGIC;
  signal curState : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \curState[0]_i_2_n_0\ : STD_LOGIC;
  signal \curState[1]_i_1_n_0\ : STD_LOGIC;
  signal \curState[2]_i_1_n_0\ : STD_LOGIC;
  signal \^data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP of \^data\ : signal is "true";
  signal \dataArrayCurrent_reg[0]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \dataArrayCurrent_reg[1]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \dataArrayCurrent_reg[2]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \dataArrayCurrent_reg[3]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \dataArraySaved[0][7]_i_1_n_0\ : STD_LOGIC;
  signal \dataArraySaved[1][7]_i_1_n_0\ : STD_LOGIC;
  signal \dataArraySaved[2][7]_i_1_n_0\ : STD_LOGIC;
  signal \dataArraySaved_reg[0]0\ : STD_LOGIC;
  signal \^dataready\ : STD_LOGIC;
  attribute RTL_KEEP of dataReady : signal is "true";
  signal \^dataresults[3]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP of \^dataresults[3]\ : signal is "true";
  signal eqOp : STD_LOGIC;
  signal grtThan : STD_LOGIC;
  signal \maxIndex_reg[0][2]_i_1_n_0\ : STD_LOGIC;
  signal \maxIndex_reg[0][3]_i_1_n_0\ : STD_LOGIC;
  signal \maxIndex_reg[2][3]_i_2_n_0\ : STD_LOGIC;
  signal minusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nextState : STD_LOGIC_VECTOR ( 0 to 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^seqdone\ : STD_LOGIC;
  attribute RTL_KEEP of seqDone : signal is "true";
  signal seqDone_inferred_i_2_n_0 : STD_LOGIC;
  signal seqDone_inferred_i_3_n_0 : STD_LOGIC;
  signal seqDone_inferred_i_4_n_0 : STD_LOGIC;
  signal seqDone_inferred_i_5_n_0 : STD_LOGIC;
  signal seqDone_inferred_i_6_n_0 : STD_LOGIC;
  signal seqDone_inferred_i_7_n_0 : STD_LOGIC;
  signal sig_seqDone_delayed : STD_LOGIC;
  signal sig_seqDone_delayed_i_1_n_0 : STD_LOGIC;
  signal startUpdate_i_1_n_0 : STD_LOGIC;
  signal startUpdate_reg_n_0 : STD_LOGIC;
  signal updateCount0 : STD_LOGIC;
  signal \updateCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \updateCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \updateCount[1]_i_3_n_0\ : STD_LOGIC;
  signal \updateCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \updateCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \var_bcdCount[0][3]_i_1_n_0\ : STD_LOGIC;
  signal \var_bcdCount[1]\ : STD_LOGIC;
  signal \var_bcdCount[1][3]_i_1_n_0\ : STD_LOGIC;
  signal \var_bcdCount[1][3]_i_4_n_0\ : STD_LOGIC;
  signal \var_bcdCount[1][3]_i_5_n_0\ : STD_LOGIC;
  signal \var_bcdCount[2]\ : STD_LOGIC;
  signal \var_bcdCount[2][3]_i_1_n_0\ : STD_LOGIC;
  signal \var_bcdCount[2][3]_i_4_n_0\ : STD_LOGIC;
  signal \var_bcdCount[2][3]_i_5_n_0\ : STD_LOGIC;
  signal \var_bcdCount_reg[0]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \var_bcdCount_reg[1]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \var_bcdCount_reg[2]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_comp_equal_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ctrlOut_reg_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \curState[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \curState[2]_i_1\ : label is "soft_lutpair8";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \curState_reg[0]\ : label is "wait_data:010,data_valid:011,update_reg:100,init:000,req_data:001";
  attribute FSM_ENCODED_STATES of \curState_reg[1]\ : label is "wait_data:010,data_valid:011,update_reg:100,init:000,req_data:001";
  attribute FSM_ENCODED_STATES of \curState_reg[2]\ : label is "wait_data:010,data_valid:011,update_reg:100,init:000,req_data:001";
  attribute SOFT_HLUTNM of \maxIndex_reg[0][0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \maxIndex_reg[0][1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \maxIndex_reg[0][2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \maxIndex_reg[0][3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \updateCount[1]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \updateCount[1]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \var_bcdCount[0][1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \var_bcdCount[0][2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \var_bcdCount[0][3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \var_bcdCount[0][3]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \var_bcdCount[1][0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \var_bcdCount[1][1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \var_bcdCount[1][2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \var_bcdCount[1][3]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \var_bcdCount[1][3]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \var_bcdCount[1][3]_i_5\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \var_bcdCount[2][0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \var_bcdCount[2][1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \var_bcdCount[2][2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \var_bcdCount[2][3]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \var_bcdCount[2][3]_i_5\ : label is "soft_lutpair6";
  attribute keep : string;
  attribute keep of clk : signal is "true";
  attribute keep of ctrlIn : signal is "true";
  attribute keep of ctrlOut : signal is "true";
  attribute keep of dataReady : signal is "true";
  attribute keep of reset : signal is "true";
  attribute keep of seqDone : signal is "true";
  attribute keep of start : signal is "true";
  attribute keep of byte : signal is "true";
  attribute keep of data : signal is "true";
  attribute keep of \dataResults[0]\ : signal is "true";
  attribute keep of \dataResults[1]\ : signal is "true";
  attribute keep of \dataResults[2]\ : signal is "true";
  attribute keep of \dataResults[3]\ : signal is "true";
  attribute keep of \dataResults[4]\ : signal is "true";
  attribute keep of \dataResults[5]\ : signal is "true";
  attribute keep of \dataResults[6]\ : signal is "true";
  attribute keep of \maxIndex[0]\ : signal is "true";
  attribute keep of \maxIndex[1]\ : signal is "true";
  attribute keep of \maxIndex[2]\ : signal is "true";
  attribute keep of \numWords_bcd[0]\ : signal is "true";
  attribute keep of \numWords_bcd[1]\ : signal is "true";
  attribute keep of \numWords_bcd[2]\ : signal is "true";
begin
  \^data\(7 downto 0) <= data(7 downto 0);
  byte(7 downto 0) <= \^data\(7 downto 0);
  ctrlOut <= \^ctrlout\;
  dataReady <= \^dataready\;
  \dataResults[3]\(7 downto 0) <= \^dataresults[3]\(7 downto 0);
  seqDone <= \^seqdone\;
comp: entity work.comparator
     port map (
      data1(7 downto 0) => \^data\(7 downto 0),
      data2(7 downto 0) => \^dataresults[3]\(7 downto 0),
      equal => NLW_comp_equal_UNCONNECTED,
      grtThan => grtThan
    );
ctrlIn_delayed_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => ctrlIn,
      Q => ctrlIn_delayed,
      R => '0'
    );
ctrlOut_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF10"
    )
        port map (
      I0 => curState(1),
      I1 => curState(2),
      I2 => curState(0),
      I3 => \^ctrlout\,
      O => ctrlOut_reg_i_1_n_0
    );
ctrlOut_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => ctrlOut_reg_i_1_n_0,
      Q => \^ctrlout\,
      R => reset
    );
\curState[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B888B8BBB888"
    )
        port map (
      I0 => start,
      I1 => curState(2),
      I2 => \curState[0]_i_2_n_0\,
      I3 => curState(1),
      I4 => start,
      I5 => curState(0),
      O => nextState(0)
    );
\curState[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"202F2F20"
    )
        port map (
      I0 => start,
      I1 => grtThan,
      I2 => curState(0),
      I3 => ctrlIn_delayed,
      I4 => ctrlIn,
      O => \curState[0]_i_2_n_0\
    );
\curState[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => curState(0),
      I1 => curState(1),
      I2 => curState(2),
      O => \curState[1]_i_1_n_0\
    );
\curState[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => curState(0),
      I1 => grtThan,
      I2 => curState(1),
      I3 => curState(2),
      O => \curState[2]_i_1_n_0\
    );
\curState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => nextState(0),
      Q => curState(0),
      R => reset
    );
\curState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \curState[1]_i_1_n_0\,
      Q => curState(1),
      R => reset
    );
\curState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \curState[2]_i_1_n_0\,
      Q => curState(2),
      R => reset
    );
\dataArrayCurrent_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(0),
      Q => \dataArrayCurrent_reg[0]__0\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(1),
      Q => \dataArrayCurrent_reg[0]__0\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(2),
      Q => \dataArrayCurrent_reg[0]__0\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(3),
      Q => \dataArrayCurrent_reg[0]__0\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(4),
      Q => \dataArrayCurrent_reg[0]__0\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(5),
      Q => \dataArrayCurrent_reg[0]__0\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(6),
      Q => \dataArrayCurrent_reg[0]__0\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \^data\(7),
      Q => \dataArrayCurrent_reg[0]__0\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(0),
      Q => \dataArrayCurrent_reg[1]__0\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(1),
      Q => \dataArrayCurrent_reg[1]__0\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(2),
      Q => \dataArrayCurrent_reg[1]__0\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(3),
      Q => \dataArrayCurrent_reg[1]__0\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(4),
      Q => \dataArrayCurrent_reg[1]__0\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(5),
      Q => \dataArrayCurrent_reg[1]__0\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(6),
      Q => \dataArrayCurrent_reg[1]__0\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[0]__0\(7),
      Q => \dataArrayCurrent_reg[1]__0\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(0),
      Q => \dataArrayCurrent_reg[2]__0\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(1),
      Q => \dataArrayCurrent_reg[2]__0\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(2),
      Q => \dataArrayCurrent_reg[2]__0\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(3),
      Q => \dataArrayCurrent_reg[2]__0\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(4),
      Q => \dataArrayCurrent_reg[2]__0\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(5),
      Q => \dataArrayCurrent_reg[2]__0\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(6),
      Q => \dataArrayCurrent_reg[2]__0\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[1]__0\(7),
      Q => \dataArrayCurrent_reg[2]__0\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(0),
      Q => \dataArrayCurrent_reg[3]__0\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(1),
      Q => \dataArrayCurrent_reg[3]__0\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(2),
      Q => \dataArrayCurrent_reg[3]__0\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(3),
      Q => \dataArrayCurrent_reg[3]__0\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(4),
      Q => \dataArrayCurrent_reg[3]__0\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(5),
      Q => \dataArrayCurrent_reg[3]__0\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(6),
      Q => \dataArrayCurrent_reg[3]__0\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArrayCurrent_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \dataArrayCurrent_reg[2]__0\(7),
      Q => \dataArrayCurrent_reg[3]__0\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => \updateCount_reg_n_0_[0]\,
      I1 => \updateCount_reg_n_0_[1]\,
      I2 => startUpdate_reg_n_0,
      I3 => curState(2),
      I4 => curState(0),
      I5 => curState(1),
      O => \dataArraySaved[0][7]_i_1_n_0\
    );
\dataArraySaved[1][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => \updateCount_reg_n_0_[1]\,
      I1 => \updateCount_reg_n_0_[0]\,
      I2 => startUpdate_reg_n_0,
      I3 => curState(2),
      I4 => curState(0),
      I5 => curState(1),
      O => \dataArraySaved[1][7]_i_1_n_0\
    );
\dataArraySaved[2][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \updateCount_reg_n_0_[1]\,
      I1 => \updateCount_reg_n_0_[0]\,
      I2 => startUpdate_reg_n_0,
      I3 => curState(2),
      I4 => curState(0),
      I5 => curState(1),
      O => \dataArraySaved[2][7]_i_1_n_0\
    );
\dataArraySaved_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(0),
      Q => \dataResults[0]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(1),
      Q => \dataResults[0]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(2),
      Q => \dataResults[0]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(3),
      Q => \dataResults[0]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(4),
      Q => \dataResults[0]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(5),
      Q => \dataResults[0]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(6),
      Q => \dataResults[0]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[0][7]_i_1_n_0\,
      D => \^data\(7),
      Q => \dataResults[0]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(0),
      Q => \dataResults[1]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(1),
      Q => \dataResults[1]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(2),
      Q => \dataResults[1]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(3),
      Q => \dataResults[1]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(4),
      Q => \dataResults[1]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(5),
      Q => \dataResults[1]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(6),
      Q => \dataResults[1]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[1][7]_i_1_n_0\,
      D => \^data\(7),
      Q => \dataResults[1]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(0),
      Q => \dataResults[2]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(1),
      Q => \dataResults[2]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(2),
      Q => \dataResults[2]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(3),
      Q => \dataResults[2]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(4),
      Q => \dataResults[2]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(5),
      Q => \dataResults[2]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(6),
      Q => \dataResults[2]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \dataArraySaved[2][7]_i_1_n_0\,
      D => \^data\(7),
      Q => \dataResults[2]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(0),
      Q => \^dataresults[3]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(1),
      Q => \^dataresults[3]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(2),
      Q => \^dataresults[3]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(3),
      Q => \^dataresults[3]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(4),
      Q => \^dataresults[3]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(5),
      Q => \^dataresults[3]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(6),
      Q => \^dataresults[3]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[0]__0\(7),
      Q => \^dataresults[3]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(0),
      Q => \dataResults[4]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(1),
      Q => \dataResults[4]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(2),
      Q => \dataResults[4]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(3),
      Q => \dataResults[4]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(4),
      Q => \dataResults[4]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(5),
      Q => \dataResults[4]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(6),
      Q => \dataResults[4]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[1]__0\(7),
      Q => \dataResults[4]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(0),
      Q => \dataResults[5]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(1),
      Q => \dataResults[5]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(2),
      Q => \dataResults[5]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(3),
      Q => \dataResults[5]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(4),
      Q => \dataResults[5]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(5),
      Q => \dataResults[5]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(6),
      Q => \dataResults[5]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[2]__0\(7),
      Q => \dataResults[5]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(0),
      Q => \dataResults[6]\(0),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(1),
      Q => \dataResults[6]\(1),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(2),
      Q => \dataResults[6]\(2),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(3),
      Q => \dataResults[6]\(3),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(4),
      Q => \dataResults[6]\(4),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(5),
      Q => \dataResults[6]\(5),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(6),
      Q => \dataResults[6]\(6),
      R => \dataArraySaved_reg[0]0\
    );
\dataArraySaved_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \dataArrayCurrent_reg[3]__0\(7),
      Q => \dataResults[6]\(7),
      R => \dataArraySaved_reg[0]0\
    );
\dataReady_inferred__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => curState(2),
      I1 => curState(0),
      I2 => curState(1),
      O => \^dataready\
    );
\maxIndex_reg[0][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(0),
      O => minusOp(0)
    );
\maxIndex_reg[0][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(1),
      I1 => \var_bcdCount_reg[0]__0\(0),
      O => minusOp(1)
    );
\maxIndex_reg[0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(1),
      I1 => \var_bcdCount_reg[0]__0\(0),
      I2 => \var_bcdCount_reg[0]__0\(2),
      O => \maxIndex_reg[0][2]_i_1_n_0\
    );
\maxIndex_reg[0][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(2),
      I1 => \var_bcdCount_reg[0]__0\(0),
      I2 => \var_bcdCount_reg[0]__0\(1),
      I3 => \var_bcdCount_reg[0]__0\(3),
      O => \maxIndex_reg[0][3]_i_1_n_0\
    );
\maxIndex_reg[2][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset,
      I1 => sig_seqDone_delayed,
      O => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg[2][3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      I2 => curState(2),
      O => \maxIndex_reg[2][3]_i_2_n_0\
    );
\maxIndex_reg_reg[0][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => minusOp(0),
      Q => \maxIndex[0]\(0),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[0][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => minusOp(1),
      Q => \maxIndex[0]\(1),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[0][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \maxIndex_reg[0][2]_i_1_n_0\,
      Q => \maxIndex[0]\(2),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[0][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \maxIndex_reg[0][3]_i_1_n_0\,
      Q => \maxIndex[0]\(3),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[1][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[1]__0\(0),
      Q => \maxIndex[1]\(0),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[1][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[1]__0\(1),
      Q => \maxIndex[1]\(1),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[1][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[1]__0\(2),
      Q => \maxIndex[1]\(2),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[1][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[1]__0\(3),
      Q => \maxIndex[1]\(3),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[2][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[2]__0\(0),
      Q => \maxIndex[2]\(0),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[2][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[2]__0\(1),
      Q => \maxIndex[2]\(1),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[2][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[2]__0\(2),
      Q => \maxIndex[2]\(2),
      S => \dataArraySaved_reg[0]0\
    );
\maxIndex_reg_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \maxIndex_reg[2][3]_i_2_n_0\,
      D => \var_bcdCount_reg[2]__0\(3),
      Q => \maxIndex[2]\(3),
      S => \dataArraySaved_reg[0]0\
    );
seqDone_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => seqDone_inferred_i_2_n_0,
      I1 => seqDone_inferred_i_3_n_0,
      I2 => seqDone_inferred_i_4_n_0,
      I3 => seqDone_inferred_i_5_n_0,
      I4 => seqDone_inferred_i_6_n_0,
      I5 => seqDone_inferred_i_7_n_0,
      O => \^seqdone\
    );
seqDone_inferred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \var_bcdCount_reg[2]__0\(0),
      I1 => \numWords_bcd[2]\(0),
      I2 => \numWords_bcd[2]\(2),
      I3 => \var_bcdCount_reg[2]__0\(2),
      I4 => \numWords_bcd[2]\(1),
      I5 => \var_bcdCount_reg[2]__0\(1),
      O => seqDone_inferred_i_2_n_0
    );
seqDone_inferred_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \numWords_bcd[2]\(3),
      I1 => \var_bcdCount_reg[2]__0\(3),
      O => seqDone_inferred_i_3_n_0
    );
seqDone_inferred_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \numWords_bcd[1]\(3),
      I1 => \var_bcdCount_reg[1]__0\(3),
      O => seqDone_inferred_i_4_n_0
    );
seqDone_inferred_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(0),
      I1 => \numWords_bcd[1]\(0),
      I2 => \numWords_bcd[1]\(2),
      I3 => \var_bcdCount_reg[1]__0\(2),
      I4 => \numWords_bcd[1]\(1),
      I5 => \var_bcdCount_reg[1]__0\(1),
      O => seqDone_inferred_i_5_n_0
    );
seqDone_inferred_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \numWords_bcd[0]\(3),
      I1 => \var_bcdCount_reg[0]__0\(3),
      O => seqDone_inferred_i_6_n_0
    );
seqDone_inferred_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(0),
      I1 => \numWords_bcd[0]\(0),
      I2 => \numWords_bcd[0]\(2),
      I3 => \var_bcdCount_reg[0]__0\(2),
      I4 => \numWords_bcd[0]\(1),
      I5 => \var_bcdCount_reg[0]__0\(1),
      O => seqDone_inferred_i_7_n_0
    );
sig_seqDone_delayed_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_seqDone_delayed,
      I1 => reset,
      I2 => \^seqdone\,
      O => sig_seqDone_delayed_i_1_n_0
    );
sig_seqDone_delayed_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sig_seqDone_delayed_i_1_n_0,
      Q => sig_seqDone_delayed,
      R => '0'
    );
startUpdate_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0FFFF88808888"
    )
        port map (
      I0 => \updateCount_reg_n_0_[1]\,
      I1 => \updateCount_reg_n_0_[0]\,
      I2 => curState(1),
      I3 => curState(0),
      I4 => curState(2),
      I5 => startUpdate_reg_n_0,
      O => startUpdate_i_1_n_0
    );
startUpdate_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => startUpdate_i_1_n_0,
      Q => startUpdate_reg_n_0,
      S => reset
    );
\updateCount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000A6"
    )
        port map (
      I0 => \updateCount_reg_n_0_[0]\,
      I1 => \^dataready\,
      I2 => startUpdate_reg_n_0,
      I3 => \updateCount[1]_i_3_n_0\,
      I4 => reset,
      I5 => \^seqdone\,
      O => \updateCount[0]_i_1_n_0\
    );
\updateCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000006A"
    )
        port map (
      I0 => \updateCount_reg_n_0_[1]\,
      I1 => updateCount0,
      I2 => \updateCount_reg_n_0_[0]\,
      I3 => \updateCount[1]_i_3_n_0\,
      I4 => reset,
      I5 => \^seqdone\,
      O => \updateCount[1]_i_1_n_0\
    );
\updateCount[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      I2 => curState(2),
      I3 => startUpdate_reg_n_0,
      O => updateCount0
    );
\updateCount[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => curState(2),
      I1 => curState(0),
      I2 => curState(1),
      O => \updateCount[1]_i_3_n_0\
    );
\updateCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \updateCount[0]_i_1_n_0\,
      Q => \updateCount_reg_n_0_[0]\,
      R => '0'
    );
\updateCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \updateCount[1]_i_1_n_0\,
      Q => \updateCount_reg_n_0_[1]\,
      R => '0'
    );
\var_bcdCount[0][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(0),
      I1 => \var_bcdCount_reg[0]__0\(1),
      O => \plusOp__0\(1)
    );
\var_bcdCount[0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(0),
      I1 => \var_bcdCount_reg[0]__0\(1),
      I2 => \var_bcdCount_reg[0]__0\(2),
      O => \plusOp__0\(2)
    );
\var_bcdCount[0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFEEEEEEEAEEE"
    )
        port map (
      I0 => reset,
      I1 => \^seqdone\,
      I2 => curState(0),
      I3 => curState(1),
      I4 => curState(2),
      I5 => eqOp,
      O => \var_bcdCount[0][3]_i_1_n_0\
    );
\var_bcdCount[0][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(1),
      I1 => \var_bcdCount_reg[0]__0\(0),
      I2 => \var_bcdCount_reg[0]__0\(2),
      I3 => \var_bcdCount_reg[0]__0\(3),
      O => \plusOp__0\(3)
    );
\var_bcdCount[0][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(2),
      I1 => \var_bcdCount_reg[0]__0\(1),
      I2 => \var_bcdCount_reg[0]__0\(3),
      I3 => \var_bcdCount_reg[0]__0\(0),
      O => eqOp
    );
\var_bcdCount[1][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(0),
      O => plusOp(0)
    );
\var_bcdCount[1][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(0),
      I1 => \var_bcdCount_reg[1]__0\(1),
      O => plusOp(1)
    );
\var_bcdCount[1][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(0),
      I1 => \var_bcdCount_reg[1]__0\(1),
      I2 => \var_bcdCount_reg[1]__0\(2),
      O => plusOp(2)
    );
\var_bcdCount[1][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFEEEEEEEAEEE"
    )
        port map (
      I0 => reset,
      I1 => \^seqdone\,
      I2 => curState(0),
      I3 => curState(1),
      I4 => curState(2),
      I5 => \var_bcdCount[1][3]_i_4_n_0\,
      O => \var_bcdCount[1][3]_i_1_n_0\
    );
\var_bcdCount[1][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => \var_bcdCount_reg[0]__0\(2),
      I1 => \var_bcdCount_reg[0]__0\(1),
      I2 => \var_bcdCount_reg[0]__0\(3),
      I3 => \var_bcdCount_reg[0]__0\(0),
      I4 => curState(2),
      I5 => \var_bcdCount[1][3]_i_5_n_0\,
      O => \var_bcdCount[1]\
    );
\var_bcdCount[1][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(1),
      I1 => \var_bcdCount_reg[1]__0\(0),
      I2 => \var_bcdCount_reg[1]__0\(2),
      I3 => \var_bcdCount_reg[1]__0\(3),
      O => plusOp(3)
    );
\var_bcdCount[1][3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => eqOp,
      I1 => \var_bcdCount_reg[1]__0\(0),
      I2 => \var_bcdCount_reg[1]__0\(3),
      I3 => \var_bcdCount_reg[1]__0\(1),
      I4 => \var_bcdCount_reg[1]__0\(2),
      O => \var_bcdCount[1][3]_i_4_n_0\
    );
\var_bcdCount[1][3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      O => \var_bcdCount[1][3]_i_5_n_0\
    );
\var_bcdCount[2][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \var_bcdCount_reg[2]__0\(0),
      O => \plusOp__1\(0)
    );
\var_bcdCount[2][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \var_bcdCount_reg[2]__0\(0),
      I1 => \var_bcdCount_reg[2]__0\(1),
      O => \plusOp__1\(1)
    );
\var_bcdCount[2][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \var_bcdCount_reg[2]__0\(0),
      I1 => \var_bcdCount_reg[2]__0\(1),
      I2 => \var_bcdCount_reg[2]__0\(2),
      O => \plusOp__1\(2)
    );
\var_bcdCount[2][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFEEEEEEEAEEE"
    )
        port map (
      I0 => reset,
      I1 => \^seqdone\,
      I2 => curState(0),
      I3 => curState(1),
      I4 => curState(2),
      I5 => \var_bcdCount[2][3]_i_4_n_0\,
      O => \var_bcdCount[2][3]_i_1_n_0\
    );
\var_bcdCount[2][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \var_bcdCount[1][3]_i_4_n_0\,
      I1 => curState(2),
      I2 => curState(0),
      I3 => curState(1),
      O => \var_bcdCount[2]\
    );
\var_bcdCount[2][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \var_bcdCount_reg[2]__0\(1),
      I1 => \var_bcdCount_reg[2]__0\(0),
      I2 => \var_bcdCount_reg[2]__0\(2),
      I3 => \var_bcdCount_reg[2]__0\(3),
      O => \plusOp__1\(3)
    );
\var_bcdCount[2][3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200000000000000"
    )
        port map (
      I0 => eqOp,
      I1 => \var_bcdCount_reg[2]__0\(1),
      I2 => \var_bcdCount_reg[2]__0\(2),
      I3 => \var_bcdCount_reg[2]__0\(0),
      I4 => \var_bcdCount_reg[2]__0\(3),
      I5 => \var_bcdCount[2][3]_i_5_n_0\,
      O => \var_bcdCount[2][3]_i_4_n_0\
    );
\var_bcdCount[2][3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \var_bcdCount_reg[1]__0\(2),
      I1 => \var_bcdCount_reg[1]__0\(1),
      I2 => \var_bcdCount_reg[1]__0\(3),
      I3 => \var_bcdCount_reg[1]__0\(0),
      O => \var_bcdCount[2][3]_i_5_n_0\
    );
\var_bcdCount_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => minusOp(0),
      Q => \var_bcdCount_reg[0]__0\(0),
      R => \var_bcdCount[0][3]_i_1_n_0\
    );
\var_bcdCount_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \plusOp__0\(1),
      Q => \var_bcdCount_reg[0]__0\(1),
      R => \var_bcdCount[0][3]_i_1_n_0\
    );
\var_bcdCount_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \plusOp__0\(2),
      Q => \var_bcdCount_reg[0]__0\(2),
      R => \var_bcdCount[0][3]_i_1_n_0\
    );
\var_bcdCount_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dataready\,
      D => \plusOp__0\(3),
      Q => \var_bcdCount_reg[0]__0\(3),
      R => \var_bcdCount[0][3]_i_1_n_0\
    );
\var_bcdCount_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[1]\,
      D => plusOp(0),
      Q => \var_bcdCount_reg[1]__0\(0),
      R => \var_bcdCount[1][3]_i_1_n_0\
    );
\var_bcdCount_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[1]\,
      D => plusOp(1),
      Q => \var_bcdCount_reg[1]__0\(1),
      R => \var_bcdCount[1][3]_i_1_n_0\
    );
\var_bcdCount_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[1]\,
      D => plusOp(2),
      Q => \var_bcdCount_reg[1]__0\(2),
      R => \var_bcdCount[1][3]_i_1_n_0\
    );
\var_bcdCount_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[1]\,
      D => plusOp(3),
      Q => \var_bcdCount_reg[1]__0\(3),
      R => \var_bcdCount[1][3]_i_1_n_0\
    );
\var_bcdCount_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[2]\,
      D => \plusOp__1\(0),
      Q => \var_bcdCount_reg[2]__0\(0),
      R => \var_bcdCount[2][3]_i_1_n_0\
    );
\var_bcdCount_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[2]\,
      D => \plusOp__1\(1),
      Q => \var_bcdCount_reg[2]__0\(1),
      R => \var_bcdCount[2][3]_i_1_n_0\
    );
\var_bcdCount_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[2]\,
      D => \plusOp__1\(2),
      Q => \var_bcdCount_reg[2]__0\(2),
      R => \var_bcdCount[2][3]_i_1_n_0\
    );
\var_bcdCount_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \var_bcdCount[2]\,
      D => \plusOp__1\(3),
      Q => \var_bcdCount_reg[2]__0\(3),
      R => \var_bcdCount[2][3]_i_1_n_0\
    );
end STRUCTURE;
