-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Feb  7 15:08:48 2019
-- Host        : IT000752 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl E:/work/teaching/Bristol/Digital_ECAD/compareSims/cmdProc_synthesised.vhd -rename_top
--               cmdProc_synthesised -cell cmdProc -mode funcsim -force
-- Design      : cmdProc
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cmdProc_synthesised is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    rxnow : in STD_LOGIC;
    rxData : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txData : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdone : out STD_LOGIC;
    ovErr : in STD_LOGIC;
    framErr : in STD_LOGIC;
    txnow : out STD_LOGIC;
    txdone : in STD_LOGIC;
    start : out STD_LOGIC;
    \numWords_bcd[2]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \numWords_bcd[1]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \numWords_bcd[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dataReady : in STD_LOGIC;
    byte : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \maxIndex[2]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \maxIndex[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \maxIndex[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \dataResults[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[1]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[2]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[3]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[4]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[5]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \dataResults[6]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    seqDone : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of cmdProc_synthesised : entity is true;
end cmdProc_synthesised;

architecture STRUCTURE of cmdProc_synthesised is
  signal byteCount : STD_LOGIC;
  signal \byteCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount[1]_i_2_n_0\ : STD_LOGIC;
  signal \byteCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \byteCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \byteNum_reg[0]0\ : STD_LOGIC;
  signal \byteNum_reg[3]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \byteNum_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][5]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][6]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[0][7]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][5]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][6]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[1][7]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][4]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][5]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][6]\ : STD_LOGIC;
  signal \byteNum_reg_n_0_[2][7]\ : STD_LOGIC;
  signal ctrlByteCount : STD_LOGIC;
  signal \ctrlByteCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \ctrlByteCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \ctrlByteCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \ctrlByteCount[3]_i_2_n_0\ : STD_LOGIC;
  signal \ctrlByteCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \ctrlByteCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \ctrlByteCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \ctrlByteCount_reg_n_0_[3]\ : STD_LOGIC;
  signal curState : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \curState[0]_i_10_n_0\ : STD_LOGIC;
  signal \curState[0]_i_11_n_0\ : STD_LOGIC;
  signal \curState[0]_i_12_n_0\ : STD_LOGIC;
  signal \curState[0]_i_13_n_0\ : STD_LOGIC;
  signal \curState[0]_i_14_n_0\ : STD_LOGIC;
  signal \curState[0]_i_15_n_0\ : STD_LOGIC;
  signal \curState[0]_i_2_n_0\ : STD_LOGIC;
  signal \curState[0]_i_3_n_0\ : STD_LOGIC;
  signal \curState[0]_i_4_n_0\ : STD_LOGIC;
  signal \curState[0]_i_5_n_0\ : STD_LOGIC;
  signal \curState[0]_i_6_n_0\ : STD_LOGIC;
  signal \curState[0]_i_7_n_0\ : STD_LOGIC;
  signal \curState[0]_i_8_n_0\ : STD_LOGIC;
  signal \curState[0]_i_9_n_0\ : STD_LOGIC;
  signal \curState[1]_i_2_n_0\ : STD_LOGIC;
  signal \curState[1]_i_3_n_0\ : STD_LOGIC;
  signal \curState[1]_i_4_n_0\ : STD_LOGIC;
  signal \curState[1]_i_5_n_0\ : STD_LOGIC;
  signal \curState[1]_i_6_n_0\ : STD_LOGIC;
  signal \curState[1]_i_7_n_0\ : STD_LOGIC;
  signal \curState[2]_i_2_n_0\ : STD_LOGIC;
  signal \curState[2]_i_3_n_0\ : STD_LOGIC;
  signal \curState[2]_i_4_n_0\ : STD_LOGIC;
  signal \curState[2]_i_5_n_0\ : STD_LOGIC;
  signal \curState[2]_i_6_n_0\ : STD_LOGIC;
  signal \curState[2]_i_7_n_0\ : STD_LOGIC;
  signal \curState[2]_i_8_n_0\ : STD_LOGIC;
  signal \curState[2]_i_9_n_0\ : STD_LOGIC;
  signal \curState[3]_i_10_n_0\ : STD_LOGIC;
  signal \curState[3]_i_2_n_0\ : STD_LOGIC;
  signal \curState[3]_i_3_n_0\ : STD_LOGIC;
  signal \curState[3]_i_4_n_0\ : STD_LOGIC;
  signal \curState[3]_i_5_n_0\ : STD_LOGIC;
  signal \curState[3]_i_6_n_0\ : STD_LOGIC;
  signal \curState[3]_i_7_n_0\ : STD_LOGIC;
  signal \curState[3]_i_8_n_0\ : STD_LOGIC;
  signal \curState[3]_i_9_n_0\ : STD_LOGIC;
  signal \curState[4]_i_2_n_0\ : STD_LOGIC;
  signal \curState[4]_i_3_n_0\ : STD_LOGIC;
  signal dataComplete_i_1_n_0 : STD_LOGIC;
  signal dataComplete_i_2_n_0 : STD_LOGIC;
  signal dataComplete_reg_n_0 : STD_LOGIC;
  signal dataStarted_i_1_n_0 : STD_LOGIC;
  signal dataStarted_reg_n_0 : STD_LOGIC;
  signal lastByte : STD_LOGIC;
  signal lastByte_i_1_n_0 : STD_LOGIC;
  signal nextState : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal nibbleCount03_out : STD_LOGIC;
  signal \nibbleCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \nibbleCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \nibbleCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \nibbleCount[2]_i_3_n_0\ : STD_LOGIC;
  signal \nibbleCount[2]_i_4_n_0\ : STD_LOGIC;
  signal \nibbleCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \nibbleCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \nibbleCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \peakByteCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \peakByteCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \peakByteCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \peakByteCount[2]_i_2_n_0\ : STD_LOGIC;
  signal \peakByteCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \peakByteCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \peakByteCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \reg_dataResults_reg[0]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg[1]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg[2]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg[4]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg[5]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg[6]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reg_dataResults_reg_n_0_[3][0]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][1]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][2]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][3]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][4]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][5]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][6]\ : STD_LOGIC;
  signal \reg_dataResults_reg_n_0_[3][7]\ : STD_LOGIC;
  signal \reg_maxIndex_reg[0]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \reg_maxIndex_reg[1]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \reg_maxIndex_reg[2]__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \reg_numWords_bcd[2][3]_i_10_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_2_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_3_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_4_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_5_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_6_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_7_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_8_n_0\ : STD_LOGIC;
  signal \reg_numWords_bcd[2][3]_i_9_n_0\ : STD_LOGIC;
  signal \^rxdone\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of rxdone : signal is "true";
  signal \^start\ : STD_LOGIC;
  attribute RTL_KEEP of start : signal is "true";
  signal txData_inferred_i_10_n_0 : STD_LOGIC;
  signal txData_inferred_i_11_n_0 : STD_LOGIC;
  signal txData_inferred_i_12_n_0 : STD_LOGIC;
  signal txData_inferred_i_13_n_0 : STD_LOGIC;
  signal txData_inferred_i_14_n_0 : STD_LOGIC;
  signal txData_inferred_i_15_n_0 : STD_LOGIC;
  signal txData_inferred_i_16_n_0 : STD_LOGIC;
  signal txData_inferred_i_17_n_0 : STD_LOGIC;
  signal txData_inferred_i_18_n_0 : STD_LOGIC;
  signal txData_inferred_i_19_n_0 : STD_LOGIC;
  signal txData_inferred_i_20_n_0 : STD_LOGIC;
  signal txData_inferred_i_21_n_0 : STD_LOGIC;
  signal txData_inferred_i_22_n_0 : STD_LOGIC;
  signal txData_inferred_i_23_n_0 : STD_LOGIC;
  signal txData_inferred_i_24_n_0 : STD_LOGIC;
  signal txData_inferred_i_25_n_0 : STD_LOGIC;
  signal txData_inferred_i_26_n_0 : STD_LOGIC;
  signal txData_inferred_i_27_n_0 : STD_LOGIC;
  signal txData_inferred_i_28_n_0 : STD_LOGIC;
  signal txData_inferred_i_29_n_0 : STD_LOGIC;
  signal txData_inferred_i_30_n_0 : STD_LOGIC;
  signal txData_inferred_i_31_n_0 : STD_LOGIC;
  signal txData_inferred_i_32_n_0 : STD_LOGIC;
  signal txData_inferred_i_33_n_0 : STD_LOGIC;
  signal txData_inferred_i_34_n_0 : STD_LOGIC;
  signal txData_inferred_i_35_n_0 : STD_LOGIC;
  signal txData_inferred_i_36_n_0 : STD_LOGIC;
  signal txData_inferred_i_37_n_0 : STD_LOGIC;
  signal txData_inferred_i_38_n_0 : STD_LOGIC;
  signal txData_inferred_i_39_n_0 : STD_LOGIC;
  signal txData_inferred_i_40_n_0 : STD_LOGIC;
  signal txData_inferred_i_41_n_0 : STD_LOGIC;
  signal txData_inferred_i_42_n_0 : STD_LOGIC;
  signal txData_inferred_i_43_n_0 : STD_LOGIC;
  signal txData_inferred_i_44_n_0 : STD_LOGIC;
  signal txData_inferred_i_45_n_0 : STD_LOGIC;
  signal txData_inferred_i_46_n_0 : STD_LOGIC;
  signal txData_inferred_i_47_n_0 : STD_LOGIC;
  signal txData_inferred_i_48_n_0 : STD_LOGIC;
  signal txData_inferred_i_49_n_0 : STD_LOGIC;
  signal txData_inferred_i_50_n_0 : STD_LOGIC;
  signal txData_inferred_i_51_n_0 : STD_LOGIC;
  signal txData_inferred_i_52_n_0 : STD_LOGIC;
  signal txData_inferred_i_53_n_0 : STD_LOGIC;
  signal txData_inferred_i_54_n_0 : STD_LOGIC;
  signal txData_inferred_i_55_n_0 : STD_LOGIC;
  signal txData_inferred_i_56_n_0 : STD_LOGIC;
  signal txData_inferred_i_57_n_0 : STD_LOGIC;
  signal txData_inferred_i_58_n_0 : STD_LOGIC;
  signal txData_inferred_i_59_n_0 : STD_LOGIC;
  signal txData_inferred_i_60_n_0 : STD_LOGIC;
  signal txData_inferred_i_61_n_0 : STD_LOGIC;
  signal txData_inferred_i_62_n_0 : STD_LOGIC;
  signal txData_inferred_i_63_n_0 : STD_LOGIC;
  signal txData_inferred_i_64_n_0 : STD_LOGIC;
  signal txData_inferred_i_65_n_0 : STD_LOGIC;
  signal txData_inferred_i_66_n_0 : STD_LOGIC;
  signal txData_inferred_i_67_n_0 : STD_LOGIC;
  signal txData_inferred_i_68_n_0 : STD_LOGIC;
  signal txData_inferred_i_69_n_0 : STD_LOGIC;
  signal txData_inferred_i_70_n_0 : STD_LOGIC;
  signal txData_inferred_i_71_n_0 : STD_LOGIC;
  signal txData_inferred_i_72_n_0 : STD_LOGIC;
  signal txData_inferred_i_73_n_0 : STD_LOGIC;
  signal txData_inferred_i_74_n_0 : STD_LOGIC;
  signal txData_inferred_i_75_n_0 : STD_LOGIC;
  signal txData_inferred_i_76_n_0 : STD_LOGIC;
  signal txData_inferred_i_77_n_0 : STD_LOGIC;
  signal txData_inferred_i_78_n_0 : STD_LOGIC;
  signal txData_inferred_i_79_n_0 : STD_LOGIC;
  signal txData_inferred_i_80_n_0 : STD_LOGIC;
  signal txData_inferred_i_81_n_0 : STD_LOGIC;
  signal txData_inferred_i_82_n_0 : STD_LOGIC;
  signal txData_inferred_i_83_n_0 : STD_LOGIC;
  signal txData_inferred_i_84_n_0 : STD_LOGIC;
  signal txData_inferred_i_85_n_0 : STD_LOGIC;
  signal txData_inferred_i_86_n_0 : STD_LOGIC;
  signal txData_inferred_i_87_n_0 : STD_LOGIC;
  signal txData_inferred_i_88_n_0 : STD_LOGIC;
  signal txData_inferred_i_89_n_0 : STD_LOGIC;
  signal txData_inferred_i_90_n_0 : STD_LOGIC;
  signal txData_inferred_i_91_n_0 : STD_LOGIC;
  signal txData_inferred_i_92_n_0 : STD_LOGIC;
  signal txData_inferred_i_9_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \byteCount[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \byteCount[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \byteCount[2]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \ctrlByteCount[0]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \ctrlByteCount[1]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \ctrlByteCount[3]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \curState[0]_i_12\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \curState[0]_i_13\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \curState[0]_i_14\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \curState[0]_i_6\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \curState[0]_i_8\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \curState[1]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \curState[1]_i_5\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \curState[2]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \curState[2]_i_5\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \curState[2]_i_6\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \curState[3]_i_4\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \curState[3]_i_7\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \curState[3]_i_9\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of dataComplete_i_2 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \nibbleCount[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \nibbleCount[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \nibbleCount[2]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \peakByteCount[2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \peakByteCount[2]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \reg_numWords_bcd[2][3]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \reg_numWords_bcd[2][3]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of txData_inferred_i_10 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of txData_inferred_i_11 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of txData_inferred_i_15 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of txData_inferred_i_16 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of txData_inferred_i_22 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of txData_inferred_i_23 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of txData_inferred_i_25 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of txData_inferred_i_28 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of txData_inferred_i_32 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of txData_inferred_i_41 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of txData_inferred_i_45 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of txData_inferred_i_47 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of txData_inferred_i_48 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of txData_inferred_i_53 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of txData_inferred_i_57 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of txData_inferred_i_60 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of txData_inferred_i_70 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of txData_inferred_i_71 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of txData_inferred_i_72 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of txData_inferred_i_78 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of txData_inferred_i_79 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of txData_inferred_i_86 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of txData_inferred_i_88 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of txData_inferred_i_89 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of txData_inferred_i_90 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of txData_inferred_i_91 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of txData_inferred_i_92 : label is "soft_lutpair29";
  attribute keep : string;
  attribute keep of clk : signal is "true";
  attribute keep of dataReady : signal is "true";
  attribute keep of framErr : signal is "true";
  attribute keep of ovErr : signal is "true";
  attribute keep of reset : signal is "true";
  attribute keep of rxdone : signal is "true";
  attribute keep of rxnow : signal is "true";
  attribute keep of seqDone : signal is "true";
  attribute keep of start : signal is "true";
  attribute keep of txdone : signal is "true";
  attribute keep of txnow : signal is "true";
  attribute keep of byte : signal is "true";
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
  attribute keep of rxData : signal is "true";
  attribute keep of txData : signal is "true";
begin
  rxdone <= \^rxdone\;
  start <= \^start\;
\byteCount[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8FF0"
    )
        port map (
      I0 => \byteCount_reg_n_0_[2]\,
      I1 => \byteCount_reg_n_0_[1]\,
      I2 => byteCount,
      I3 => \byteCount_reg_n_0_[0]\,
      O => \byteCount[0]_i_1_n_0\
    );
\byteCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFDF00000020"
    )
        port map (
      I0 => \byteCount_reg_n_0_[0]\,
      I1 => \byteCount[1]_i_2_n_0\,
      I2 => curState(3),
      I3 => curState(1),
      I4 => curState(2),
      I5 => \byteCount_reg_n_0_[1]\,
      O => \byteCount[1]_i_1_n_0\
    );
\byteCount[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => curState(4),
      I1 => curState(0),
      O => \byteCount[1]_i_2_n_0\
    );
\byteCount[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \byteCount_reg_n_0_[0]\,
      I1 => \byteCount_reg_n_0_[1]\,
      I2 => byteCount,
      I3 => \byteCount_reg_n_0_[2]\,
      O => \byteCount[2]_i_1_n_0\
    );
\byteCount[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => curState(4),
      I1 => curState(0),
      I2 => curState(3),
      I3 => curState(1),
      I4 => curState(2),
      O => byteCount
    );
\byteCount_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \byteCount[0]_i_1_n_0\,
      Q => \byteCount_reg_n_0_[0]\,
      S => reset
    );
\byteCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \byteCount[1]_i_1_n_0\,
      Q => \byteCount_reg_n_0_[1]\,
      R => reset
    );
\byteCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \byteCount[2]_i_1_n_0\,
      Q => \byteCount_reg_n_0_[2]\,
      R => reset
    );
\byteNum[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAAAAAAAAEAEAA"
    )
        port map (
      I0 => reset,
      I1 => curState(0),
      I2 => curState(4),
      I3 => curState(3),
      I4 => curState(2),
      I5 => curState(1),
      O => \byteNum_reg[0]0\
    );
\byteNum_reg[0][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(0),
      Q => \byteNum_reg_n_0_[0][0]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(1),
      Q => \byteNum_reg_n_0_[0][1]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(2),
      Q => \byteNum_reg_n_0_[0][2]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(3),
      Q => \byteNum_reg_n_0_[0][3]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(4),
      Q => \byteNum_reg_n_0_[0][4]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(5),
      Q => \byteNum_reg_n_0_[0][5]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(6),
      Q => \byteNum_reg_n_0_[0][6]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[0][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => rxData(7),
      Q => \byteNum_reg_n_0_[0][7]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][0]\,
      Q => \byteNum_reg_n_0_[1][0]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][1]\,
      Q => \byteNum_reg_n_0_[1][1]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][2]\,
      Q => \byteNum_reg_n_0_[1][2]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][3]\,
      Q => \byteNum_reg_n_0_[1][3]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][4]\,
      Q => \byteNum_reg_n_0_[1][4]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][5]\,
      Q => \byteNum_reg_n_0_[1][5]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][6]\,
      Q => \byteNum_reg_n_0_[1][6]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[1][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[0][7]\,
      Q => \byteNum_reg_n_0_[1][7]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][0]\,
      Q => \byteNum_reg_n_0_[2][0]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][1]\,
      Q => \byteNum_reg_n_0_[2][1]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][2]\,
      Q => \byteNum_reg_n_0_[2][2]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][3]\,
      Q => \byteNum_reg_n_0_[2][3]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][4]\,
      Q => \byteNum_reg_n_0_[2][4]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][5]\,
      Q => \byteNum_reg_n_0_[2][5]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][6]\,
      Q => \byteNum_reg_n_0_[2][6]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[2][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[1][7]\,
      Q => \byteNum_reg_n_0_[2][7]\,
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][0]\,
      Q => \byteNum_reg[3]__0\(0),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][1]\,
      Q => \byteNum_reg[3]__0\(1),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][2]\,
      Q => \byteNum_reg[3]__0\(2),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][3]\,
      Q => \byteNum_reg[3]__0\(3),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][4]\,
      Q => \byteNum_reg[3]__0\(4),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][6]\,
      Q => \byteNum_reg[3]__0\(6),
      S => \byteNum_reg[0]0\
    );
\byteNum_reg[3][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \^rxdone\,
      D => \byteNum_reg_n_0_[2][7]\,
      Q => \byteNum_reg[3]__0\(7),
      S => \byteNum_reg[0]0\
    );
\ctrlByteCount[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10FF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[2]\,
      I1 => \ctrlByteCount_reg_n_0_[1]\,
      I2 => \ctrlByteCount_reg_n_0_[3]\,
      I3 => \ctrlByteCount_reg_n_0_[0]\,
      O => \ctrlByteCount[0]_i_1_n_0\
    );
\ctrlByteCount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[2]\,
      I1 => \ctrlByteCount_reg_n_0_[3]\,
      I2 => \ctrlByteCount_reg_n_0_[0]\,
      I3 => \ctrlByteCount_reg_n_0_[1]\,
      O => \ctrlByteCount[1]_i_1_n_0\
    );
\ctrlByteCount[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[2]\,
      I1 => \ctrlByteCount_reg_n_0_[0]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      O => \ctrlByteCount[2]_i_1_n_0\
    );
\ctrlByteCount[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => curState(1),
      I1 => curState(2),
      I2 => curState(3),
      I3 => curState(0),
      I4 => curState(4),
      O => ctrlByteCount
    );
\ctrlByteCount[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7B80"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[2]\,
      I1 => \ctrlByteCount_reg_n_0_[0]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      I3 => \ctrlByteCount_reg_n_0_[3]\,
      O => \ctrlByteCount[3]_i_2_n_0\
    );
\ctrlByteCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ctrlByteCount,
      D => \ctrlByteCount[0]_i_1_n_0\,
      Q => \ctrlByteCount_reg_n_0_[0]\,
      R => reset
    );
\ctrlByteCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ctrlByteCount,
      D => \ctrlByteCount[1]_i_1_n_0\,
      Q => \ctrlByteCount_reg_n_0_[1]\,
      R => reset
    );
\ctrlByteCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ctrlByteCount,
      D => \ctrlByteCount[2]_i_1_n_0\,
      Q => \ctrlByteCount_reg_n_0_[2]\,
      R => reset
    );
\ctrlByteCount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ctrlByteCount,
      D => \ctrlByteCount[3]_i_2_n_0\,
      Q => \ctrlByteCount_reg_n_0_[3]\,
      R => reset
    );
\curState[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABABABAAABAAAA"
    )
        port map (
      I0 => \curState[0]_i_2_n_0\,
      I1 => curState(4),
      I2 => \curState[0]_i_3_n_0\,
      I3 => \curState[0]_i_4_n_0\,
      I4 => curState(2),
      I5 => \curState[0]_i_5_n_0\,
      O => nextState(0)
    );
\curState[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00004F4C"
    )
        port map (
      I0 => txdone,
      I1 => curState(1),
      I2 => curState(0),
      I3 => rxnow,
      I4 => curState(2),
      I5 => \curState[0]_i_15_n_0\,
      O => \curState[0]_i_10_n_0\
    );
\curState[0]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curState(0),
      I1 => txdone,
      O => \curState[0]_i_11_n_0\
    );
\curState[0]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \byteCount_reg_n_0_[0]\,
      I1 => \byteCount_reg_n_0_[1]\,
      I2 => \byteCount_reg_n_0_[2]\,
      O => \curState[0]_i_12_n_0\
    );
\curState[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \byteNum_reg_n_0_[1][5]\,
      I1 => \byteNum_reg_n_0_[2][6]\,
      I2 => \byteNum_reg_n_0_[1][4]\,
      I3 => \byteNum_reg[3]__0\(3),
      O => \curState[0]_i_13_n_0\
    );
\curState[0]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \byteNum_reg[3]__0\(6),
      I1 => \byteNum_reg_n_0_[2][4]\,
      I2 => \byteNum_reg[3]__0\(4),
      I3 => \byteNum_reg_n_0_[1][6]\,
      O => \curState[0]_i_14_n_0\
    );
\curState[0]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAAAAA"
    )
        port map (
      I0 => curState(3),
      I1 => curState(1),
      I2 => curState(0),
      I3 => curState(2),
      I4 => dataReady,
      O => \curState[0]_i_15_n_0\
    );
\curState[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA82AAA2AAAAAAAA"
    )
        port map (
      I0 => \curState[3]_i_9_n_0\,
      I1 => \peakByteCount_reg_n_0_[2]\,
      I2 => \peakByteCount_reg_n_0_[0]\,
      I3 => \peakByteCount_reg_n_0_[1]\,
      I4 => \curState[0]_i_6_n_0\,
      I5 => \curState[0]_i_7_n_0\,
      O => \curState[0]_i_2_n_0\
    );
\curState[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFDFDD"
    )
        port map (
      I0 => rxnow,
      I1 => \curState[0]_i_8_n_0\,
      I2 => \curState[0]_i_9_n_0\,
      I3 => \reg_numWords_bcd[2][3]_i_2_n_0\,
      I4 => \curState[3]_i_7_n_0\,
      I5 => \curState[0]_i_10_n_0\,
      O => \curState[0]_i_3_n_0\
    );
\curState[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F8F8FCF8FCFC"
    )
        port map (
      I0 => \curState[3]_i_6_n_0\,
      I1 => curState(1),
      I2 => curState(0),
      I3 => \curState[0]_i_9_n_0\,
      I4 => \reg_numWords_bcd[2][3]_i_2_n_0\,
      I5 => \curState[3]_i_7_n_0\,
      O => \curState[0]_i_4_n_0\
    );
\curState[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAABBBFAAAA"
    )
        port map (
      I0 => \curState[3]_i_8_n_0\,
      I1 => \curState[0]_i_11_n_0\,
      I2 => \curState[0]_i_6_n_0\,
      I3 => \curState[0]_i_12_n_0\,
      I4 => curState(1),
      I5 => curState(2),
      O => \curState[0]_i_5_n_0\
    );
\curState[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[2]\,
      I1 => \nibbleCount_reg_n_0_[0]\,
      I2 => \nibbleCount_reg_n_0_[1]\,
      O => \curState[0]_i_6_n_0\
    );
\curState[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA08"
    )
        port map (
      I0 => txdone,
      I1 => curState(0),
      I2 => curState(1),
      I3 => curState(2),
      O => \curState[0]_i_7_n_0\
    );
\curState[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      O => \curState[0]_i_8_n_0\
    );
\curState[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \reg_numWords_bcd[2][3]_i_6_n_0\,
      I1 => \reg_numWords_bcd[2][3]_i_5_n_0\,
      I2 => \curState[0]_i_13_n_0\,
      I3 => \reg_numWords_bcd[2][3]_i_10_n_0\,
      I4 => \curState[0]_i_14_n_0\,
      I5 => \reg_numWords_bcd[2][3]_i_9_n_0\,
      O => \curState[0]_i_9_n_0\
    );
\curState[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFABFFABABABAB"
    )
        port map (
      I0 => \curState[1]_i_2_n_0\,
      I1 => curState(4),
      I2 => \curState[1]_i_3_n_0\,
      I3 => \peakByteCount_reg_n_0_[2]\,
      I4 => \curState[1]_i_4_n_0\,
      I5 => \curState[3]_i_5_n_0\,
      O => nextState(1)
    );
\curState[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4F4FFF00000000"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      I2 => txdone,
      I3 => \curState[1]_i_5_n_0\,
      I4 => \curState[1]_i_6_n_0\,
      I5 => txData_inferred_i_10_n_0,
      O => \curState[1]_i_2_n_0\
    );
\curState[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EBEBEBAB"
    )
        port map (
      I0 => curState(3),
      I1 => curState(1),
      I2 => curState(0),
      I3 => curState(2),
      I4 => txdone,
      I5 => \curState[1]_i_7_n_0\,
      O => \curState[1]_i_3_n_0\
    );
\curState[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \peakByteCount_reg_n_0_[0]\,
      I1 => \peakByteCount_reg_n_0_[1]\,
      O => \curState[1]_i_4_n_0\
    );
\curState[1]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[0]\,
      I1 => \ctrlByteCount_reg_n_0_[3]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      I3 => \ctrlByteCount_reg_n_0_[2]\,
      O => \curState[1]_i_5_n_0\
    );
\curState[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBFFFF"
    )
        port map (
      I0 => \byteNum_reg_n_0_[0][3]\,
      I1 => \byteNum_reg_n_0_[0][4]\,
      I2 => dataComplete_reg_n_0,
      I3 => \byteNum_reg_n_0_[0][2]\,
      I4 => \curState[3]_i_10_n_0\,
      O => \curState[1]_i_6_n_0\
    );
\curState[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CFFFF4F0"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => \curState[0]_i_6_n_0\,
      I2 => curState(0),
      I3 => txdone,
      I4 => curState(1),
      I5 => \curState[2]_i_8_n_0\,
      O => \curState[1]_i_7_n_0\
    );
\curState[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBBBBAAAAA"
    )
        port map (
      I0 => \curState[3]_i_5_n_0\,
      I1 => \curState[2]_i_2_n_0\,
      I2 => curState(0),
      I3 => \curState[3]_i_3_n_0\,
      I4 => \curState[2]_i_3_n_0\,
      I5 => \curState[2]_i_4_n_0\,
      O => nextState(2)
    );
\curState[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40444040"
    )
        port map (
      I0 => \curState[2]_i_5_n_0\,
      I1 => curState(3),
      I2 => curState(0),
      I3 => \curState[3]_i_6_n_0\,
      I4 => \curState[2]_i_6_n_0\,
      I5 => \curState[2]_i_7_n_0\,
      O => \curState[2]_i_2_n_0\
    );
\curState[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curState(2),
      I1 => curState(1),
      O => \curState[2]_i_3_n_0\
    );
\curState[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0C80"
    )
        port map (
      I0 => txdone,
      I1 => curState(1),
      I2 => curState(0),
      I3 => curState(2),
      I4 => curState(3),
      O => \curState[2]_i_4_n_0\
    );
\curState[2]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => curState(2),
      I1 => curState(1),
      O => \curState[2]_i_5_n_0\
    );
\curState[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \curState[3]_i_10_n_0\,
      I1 => \byteNum_reg_n_0_[0][2]\,
      I2 => \byteNum_reg_n_0_[0][3]\,
      I3 => dataComplete_reg_n_0,
      I4 => \byteNum_reg_n_0_[0][4]\,
      O => \curState[2]_i_6_n_0\
    );
\curState[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABABBBABBBABB"
    )
        port map (
      I0 => curState(4),
      I1 => \curState[2]_i_8_n_0\,
      I2 => \curState[0]_i_8_n_0\,
      I3 => txdone,
      I4 => \curState[0]_i_12_n_0\,
      I5 => \curState[2]_i_9_n_0\,
      O => \curState[2]_i_7_n_0\
    );
\curState[2]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => curState(2),
      I1 => curState(3),
      O => \curState[2]_i_8_n_0\
    );
\curState[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F800000000000000"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[1]\,
      I1 => \nibbleCount_reg_n_0_[0]\,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => curState(0),
      I4 => txdone,
      I5 => curState(1),
      O => \curState[2]_i_9_n_0\
    );
\curState[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55544444"
    )
        port map (
      I0 => curState(4),
      I1 => \curState[3]_i_2_n_0\,
      I2 => curState(0),
      I3 => \curState[3]_i_3_n_0\,
      I4 => \curState[3]_i_4_n_0\,
      I5 => \curState[3]_i_5_n_0\,
      O => nextState(3)
    );
\curState[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \byteNum_reg_n_0_[0][0]\,
      I1 => \byteNum_reg_n_0_[0][7]\,
      I2 => \byteNum_reg_n_0_[0][6]\,
      I3 => \byteNum_reg_n_0_[0][1]\,
      O => \curState[3]_i_10_n_0\
    );
\curState[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000054FFFFFF"
    )
        port map (
      I0 => curState(0),
      I1 => \curState[3]_i_6_n_0\,
      I2 => \curState[3]_i_7_n_0\,
      I3 => curState(2),
      I4 => curState(1),
      I5 => \curState[3]_i_8_n_0\,
      O => \curState[3]_i_2_n_0\
    );
\curState[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => \reg_numWords_bcd[2][3]_i_6_n_0\,
      I1 => \reg_numWords_bcd[2][3]_i_5_n_0\,
      I2 => \reg_numWords_bcd[2][3]_i_4_n_0\,
      I3 => \reg_numWords_bcd[2][3]_i_3_n_0\,
      I4 => \reg_numWords_bcd[2][3]_i_2_n_0\,
      I5 => \curState[3]_i_7_n_0\,
      O => \curState[3]_i_3_n_0\
    );
\curState[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0090"
    )
        port map (
      I0 => curState(1),
      I1 => curState(0),
      I2 => curState(2),
      I3 => curState(3),
      O => \curState[3]_i_4_n_0\
    );
\curState[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088880080"
    )
        port map (
      I0 => \curState[3]_i_9_n_0\,
      I1 => txdone,
      I2 => curState(0),
      I3 => curState(1),
      I4 => curState(2),
      I5 => \curState[4]_i_3_n_0\,
      O => \curState[3]_i_5_n_0\
    );
\curState[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFFFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[2]\,
      I1 => \ctrlByteCount_reg_n_0_[1]\,
      I2 => \ctrlByteCount_reg_n_0_[3]\,
      I3 => \ctrlByteCount_reg_n_0_[0]\,
      I4 => txdone,
      O => \curState[3]_i_6_n_0\
    );
\curState[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080200"
    )
        port map (
      I0 => \curState[3]_i_10_n_0\,
      I1 => \byteNum_reg_n_0_[0][2]\,
      I2 => dataComplete_reg_n_0,
      I3 => \byteNum_reg_n_0_[0][4]\,
      I4 => \byteNum_reg_n_0_[0][3]\,
      O => \curState[3]_i_7_n_0\
    );
\curState[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000010FFFFFFFF"
    )
        port map (
      I0 => curState(0),
      I1 => curState(1),
      I2 => txdone,
      I3 => dataStarted_reg_n_0,
      I4 => curState(2),
      I5 => curState(3),
      O => \curState[3]_i_8_n_0\
    );
\curState[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => curState(1),
      I1 => curState(2),
      I2 => curState(4),
      I3 => curState(3),
      O => \curState[3]_i_9_n_0\
    );
\curState[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000000800000008"
    )
        port map (
      I0 => \curState[4]_i_2_n_0\,
      I1 => curState(4),
      I2 => curState(3),
      I3 => curState(2),
      I4 => curState(1),
      I5 => curState(0),
      O => nextState(4)
    );
\curState[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABBFFFF"
    )
        port map (
      I0 => \curState[4]_i_3_n_0\,
      I1 => curState(2),
      I2 => curState(1),
      I3 => curState(0),
      I4 => txdone,
      O => \curState[4]_i_2_n_0\
    );
\curState[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000070000"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[1]\,
      I1 => \nibbleCount_reg_n_0_[0]\,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => \peakByteCount_reg_n_0_[1]\,
      I4 => \peakByteCount_reg_n_0_[0]\,
      I5 => \peakByteCount_reg_n_0_[2]\,
      O => \curState[4]_i_3_n_0\
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
      D => nextState(1),
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
      D => nextState(2),
      Q => curState(2),
      R => reset
    );
\curState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => nextState(3),
      Q => curState(3),
      R => reset
    );
\curState_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => nextState(4),
      Q => curState(4),
      R => reset
    );
dataComplete_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \^start\,
      I1 => dataComplete_reg_n_0,
      I2 => dataComplete_i_2_n_0,
      I3 => reset,
      O => dataComplete_i_1_n_0
    );
dataComplete_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[0]\,
      I1 => \nibbleCount_reg_n_0_[1]\,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => lastByte,
      O => dataComplete_i_2_n_0
    );
dataComplete_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dataComplete_i_1_n_0,
      Q => dataComplete_reg_n_0,
      R => '0'
    );
dataStarted_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555500000100"
    )
        port map (
      I0 => \^start\,
      I1 => lastByte,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => \nibbleCount_reg_n_0_[1]\,
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => dataStarted_reg_n_0,
      O => dataStarted_i_1_n_0
    );
dataStarted_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => dataStarted_i_1_n_0,
      Q => dataStarted_reg_n_0,
      S => reset
    );
lastByte_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CF8A"
    )
        port map (
      I0 => \^start\,
      I1 => dataStarted_reg_n_0,
      I2 => seqDone,
      I3 => lastByte,
      O => lastByte_i_1_n_0
    );
lastByte_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => lastByte_i_1_n_0,
      Q => lastByte,
      S => reset
    );
\nibbleCount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[0]\,
      I1 => nibbleCount03_out,
      I2 => \nibbleCount[2]_i_3_n_0\,
      O => \nibbleCount[0]_i_1_n_0\
    );
\nibbleCount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"006A"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[1]\,
      I1 => nibbleCount03_out,
      I2 => \nibbleCount_reg_n_0_[0]\,
      I3 => \nibbleCount[2]_i_3_n_0\,
      O => \nibbleCount[1]_i_1_n_0\
    );
\nibbleCount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006AAA"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[2]\,
      I1 => nibbleCount03_out,
      I2 => \nibbleCount_reg_n_0_[1]\,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => \nibbleCount[2]_i_3_n_0\,
      O => \nibbleCount[2]_i_1_n_0\
    );
\nibbleCount[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000410"
    )
        port map (
      I0 => curState(0),
      I1 => curState(3),
      I2 => curState(4),
      I3 => curState(1),
      I4 => curState(2),
      O => nibbleCount03_out
    );
\nibbleCount[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFEE"
    )
        port map (
      I0 => reset,
      I1 => ctrlByteCount,
      I2 => dataStarted_reg_n_0,
      I3 => \^start\,
      I4 => \nibbleCount[2]_i_4_n_0\,
      O => \nibbleCount[2]_i_3_n_0\
    );
\nibbleCount[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000040"
    )
        port map (
      I0 => curState(4),
      I1 => curState(0),
      I2 => curState(3),
      I3 => dataComplete_reg_n_0,
      I4 => curState(2),
      I5 => curState(1),
      O => \nibbleCount[2]_i_4_n_0\
    );
\nibbleCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \nibbleCount[0]_i_1_n_0\,
      Q => \nibbleCount_reg_n_0_[0]\,
      R => '0'
    );
\nibbleCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \nibbleCount[1]_i_1_n_0\,
      Q => \nibbleCount_reg_n_0_[1]\,
      R => '0'
    );
\nibbleCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \nibbleCount[2]_i_1_n_0\,
      Q => \nibbleCount_reg_n_0_[2]\,
      R => '0'
    );
\peakByteCount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF7FFF00008000"
    )
        port map (
      I0 => curState(0),
      I1 => curState(1),
      I2 => curState(2),
      I3 => curState(3),
      I4 => curState(4),
      I5 => \peakByteCount_reg_n_0_[0]\,
      O => \peakByteCount[0]_i_1_n_0\
    );
\peakByteCount[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \peakByteCount_reg_n_0_[0]\,
      I1 => \peakByteCount[2]_i_2_n_0\,
      I2 => \peakByteCount_reg_n_0_[1]\,
      O => \peakByteCount[1]_i_1_n_0\
    );
\peakByteCount[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F80"
    )
        port map (
      I0 => \peakByteCount_reg_n_0_[0]\,
      I1 => \peakByteCount_reg_n_0_[1]\,
      I2 => \peakByteCount[2]_i_2_n_0\,
      I3 => \peakByteCount_reg_n_0_[2]\,
      O => \peakByteCount[2]_i_1_n_0\
    );
\peakByteCount[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => curState(4),
      I1 => curState(3),
      I2 => curState(2),
      I3 => curState(1),
      I4 => curState(0),
      O => \peakByteCount[2]_i_2_n_0\
    );
\peakByteCount_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \peakByteCount[0]_i_1_n_0\,
      Q => \peakByteCount_reg_n_0_[0]\,
      S => reset
    );
\peakByteCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \peakByteCount[1]_i_1_n_0\,
      Q => \peakByteCount_reg_n_0_[1]\,
      R => reset
    );
\peakByteCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \peakByteCount[2]_i_1_n_0\,
      Q => \peakByteCount_reg_n_0_[2]\,
      R => reset
    );
\reg_dataResults_reg[0][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(0),
      Q => \reg_dataResults_reg[0]__0\(0),
      S => reset
    );
\reg_dataResults_reg[0][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(1),
      Q => \reg_dataResults_reg[0]__0\(1),
      S => reset
    );
\reg_dataResults_reg[0][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(2),
      Q => \reg_dataResults_reg[0]__0\(2),
      S => reset
    );
\reg_dataResults_reg[0][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(3),
      Q => \reg_dataResults_reg[0]__0\(3),
      S => reset
    );
\reg_dataResults_reg[0][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(4),
      Q => \reg_dataResults_reg[0]__0\(4),
      S => reset
    );
\reg_dataResults_reg[0][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(5),
      Q => \reg_dataResults_reg[0]__0\(5),
      S => reset
    );
\reg_dataResults_reg[0][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(6),
      Q => \reg_dataResults_reg[0]__0\(6),
      S => reset
    );
\reg_dataResults_reg[0][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[0]\(7),
      Q => \reg_dataResults_reg[0]__0\(7),
      S => reset
    );
\reg_dataResults_reg[1][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(0),
      Q => \reg_dataResults_reg[1]__0\(0),
      S => reset
    );
\reg_dataResults_reg[1][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(1),
      Q => \reg_dataResults_reg[1]__0\(1),
      S => reset
    );
\reg_dataResults_reg[1][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(2),
      Q => \reg_dataResults_reg[1]__0\(2),
      S => reset
    );
\reg_dataResults_reg[1][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(3),
      Q => \reg_dataResults_reg[1]__0\(3),
      S => reset
    );
\reg_dataResults_reg[1][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(4),
      Q => \reg_dataResults_reg[1]__0\(4),
      S => reset
    );
\reg_dataResults_reg[1][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(5),
      Q => \reg_dataResults_reg[1]__0\(5),
      S => reset
    );
\reg_dataResults_reg[1][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(6),
      Q => \reg_dataResults_reg[1]__0\(6),
      S => reset
    );
\reg_dataResults_reg[1][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[1]\(7),
      Q => \reg_dataResults_reg[1]__0\(7),
      S => reset
    );
\reg_dataResults_reg[2][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(0),
      Q => \reg_dataResults_reg[2]__0\(0),
      S => reset
    );
\reg_dataResults_reg[2][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(1),
      Q => \reg_dataResults_reg[2]__0\(1),
      S => reset
    );
\reg_dataResults_reg[2][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(2),
      Q => \reg_dataResults_reg[2]__0\(2),
      S => reset
    );
\reg_dataResults_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(3),
      Q => \reg_dataResults_reg[2]__0\(3),
      S => reset
    );
\reg_dataResults_reg[2][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(4),
      Q => \reg_dataResults_reg[2]__0\(4),
      S => reset
    );
\reg_dataResults_reg[2][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(5),
      Q => \reg_dataResults_reg[2]__0\(5),
      S => reset
    );
\reg_dataResults_reg[2][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(6),
      Q => \reg_dataResults_reg[2]__0\(6),
      S => reset
    );
\reg_dataResults_reg[2][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[2]\(7),
      Q => \reg_dataResults_reg[2]__0\(7),
      S => reset
    );
\reg_dataResults_reg[3][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(0),
      Q => \reg_dataResults_reg_n_0_[3][0]\,
      S => reset
    );
\reg_dataResults_reg[3][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(1),
      Q => \reg_dataResults_reg_n_0_[3][1]\,
      S => reset
    );
\reg_dataResults_reg[3][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(2),
      Q => \reg_dataResults_reg_n_0_[3][2]\,
      S => reset
    );
\reg_dataResults_reg[3][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(3),
      Q => \reg_dataResults_reg_n_0_[3][3]\,
      S => reset
    );
\reg_dataResults_reg[3][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(4),
      Q => \reg_dataResults_reg_n_0_[3][4]\,
      S => reset
    );
\reg_dataResults_reg[3][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(5),
      Q => \reg_dataResults_reg_n_0_[3][5]\,
      S => reset
    );
\reg_dataResults_reg[3][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(6),
      Q => \reg_dataResults_reg_n_0_[3][6]\,
      S => reset
    );
\reg_dataResults_reg[3][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[3]\(7),
      Q => \reg_dataResults_reg_n_0_[3][7]\,
      S => reset
    );
\reg_dataResults_reg[4][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(0),
      Q => \reg_dataResults_reg[4]__0\(0),
      S => reset
    );
\reg_dataResults_reg[4][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(1),
      Q => \reg_dataResults_reg[4]__0\(1),
      S => reset
    );
\reg_dataResults_reg[4][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(2),
      Q => \reg_dataResults_reg[4]__0\(2),
      S => reset
    );
\reg_dataResults_reg[4][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(3),
      Q => \reg_dataResults_reg[4]__0\(3),
      S => reset
    );
\reg_dataResults_reg[4][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(4),
      Q => \reg_dataResults_reg[4]__0\(4),
      S => reset
    );
\reg_dataResults_reg[4][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(5),
      Q => \reg_dataResults_reg[4]__0\(5),
      S => reset
    );
\reg_dataResults_reg[4][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(6),
      Q => \reg_dataResults_reg[4]__0\(6),
      S => reset
    );
\reg_dataResults_reg[4][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[4]\(7),
      Q => \reg_dataResults_reg[4]__0\(7),
      S => reset
    );
\reg_dataResults_reg[5][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(0),
      Q => \reg_dataResults_reg[5]__0\(0),
      S => reset
    );
\reg_dataResults_reg[5][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(1),
      Q => \reg_dataResults_reg[5]__0\(1),
      S => reset
    );
\reg_dataResults_reg[5][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(2),
      Q => \reg_dataResults_reg[5]__0\(2),
      S => reset
    );
\reg_dataResults_reg[5][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(3),
      Q => \reg_dataResults_reg[5]__0\(3),
      S => reset
    );
\reg_dataResults_reg[5][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(4),
      Q => \reg_dataResults_reg[5]__0\(4),
      S => reset
    );
\reg_dataResults_reg[5][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(5),
      Q => \reg_dataResults_reg[5]__0\(5),
      S => reset
    );
\reg_dataResults_reg[5][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(6),
      Q => \reg_dataResults_reg[5]__0\(6),
      S => reset
    );
\reg_dataResults_reg[5][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[5]\(7),
      Q => \reg_dataResults_reg[5]__0\(7),
      S => reset
    );
\reg_dataResults_reg[6][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(0),
      Q => \reg_dataResults_reg[6]__0\(0),
      S => reset
    );
\reg_dataResults_reg[6][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(1),
      Q => \reg_dataResults_reg[6]__0\(1),
      S => reset
    );
\reg_dataResults_reg[6][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(2),
      Q => \reg_dataResults_reg[6]__0\(2),
      S => reset
    );
\reg_dataResults_reg[6][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(3),
      Q => \reg_dataResults_reg[6]__0\(3),
      S => reset
    );
\reg_dataResults_reg[6][4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(4),
      Q => \reg_dataResults_reg[6]__0\(4),
      S => reset
    );
\reg_dataResults_reg[6][5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(5),
      Q => \reg_dataResults_reg[6]__0\(5),
      S => reset
    );
\reg_dataResults_reg[6][6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(6),
      Q => \reg_dataResults_reg[6]__0\(6),
      S => reset
    );
\reg_dataResults_reg[6][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \dataResults[6]\(7),
      Q => \reg_dataResults_reg[6]__0\(7),
      S => reset
    );
\reg_maxIndex_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[0]\(0),
      Q => \reg_maxIndex_reg[0]__0\(0),
      R => reset
    );
\reg_maxIndex_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[0]\(1),
      Q => \reg_maxIndex_reg[0]__0\(1),
      R => reset
    );
\reg_maxIndex_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[0]\(2),
      Q => \reg_maxIndex_reg[0]__0\(2),
      R => reset
    );
\reg_maxIndex_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[0]\(3),
      Q => \reg_maxIndex_reg[0]__0\(3),
      R => reset
    );
\reg_maxIndex_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[1]\(0),
      Q => \reg_maxIndex_reg[1]__0\(0),
      R => reset
    );
\reg_maxIndex_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[1]\(1),
      Q => \reg_maxIndex_reg[1]__0\(1),
      R => reset
    );
\reg_maxIndex_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[1]\(2),
      Q => \reg_maxIndex_reg[1]__0\(2),
      R => reset
    );
\reg_maxIndex_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[1]\(3),
      Q => \reg_maxIndex_reg[1]__0\(3),
      R => reset
    );
\reg_maxIndex_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[2]\(0),
      Q => \reg_maxIndex_reg[2]__0\(0),
      R => reset
    );
\reg_maxIndex_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[2]\(1),
      Q => \reg_maxIndex_reg[2]__0\(1),
      R => reset
    );
\reg_maxIndex_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[2]\(2),
      Q => \reg_maxIndex_reg[2]__0\(2),
      R => reset
    );
\reg_maxIndex_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => seqDone,
      D => \maxIndex[2]\(3),
      Q => \reg_maxIndex_reg[2]__0\(3),
      R => reset
    );
\reg_numWords_bcd[2][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \reg_numWords_bcd[2][3]_i_2_n_0\,
      I1 => \reg_numWords_bcd[2][3]_i_3_n_0\,
      I2 => \reg_numWords_bcd[2][3]_i_4_n_0\,
      I3 => \reg_numWords_bcd[2][3]_i_5_n_0\,
      I4 => \reg_numWords_bcd[2][3]_i_6_n_0\,
      O => \reg_numWords_bcd[2][3]_i_1_n_0\
    );
\reg_numWords_bcd[2][3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \byteNum_reg_n_0_[2][5]\,
      I1 => \byteNum_reg_n_0_[0][7]\,
      I2 => \byteNum_reg_n_0_[0][5]\,
      I3 => \byteNum_reg_n_0_[0][4]\,
      O => \reg_numWords_bcd[2][3]_i_10_n_0\
    );
\reg_numWords_bcd[2][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \reg_numWords_bcd[2][3]_i_7_n_0\,
      I1 => \reg_numWords_bcd[2][3]_i_8_n_0\,
      I2 => \byteNum_reg_n_0_[2][0]\,
      I3 => \byteNum_reg_n_0_[0][3]\,
      I4 => \byteNum_reg_n_0_[1][0]\,
      I5 => \byteNum_reg_n_0_[2][3]\,
      O => \reg_numWords_bcd[2][3]_i_2_n_0\
    );
\reg_numWords_bcd[2][3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => \byteNum_reg_n_0_[1][6]\,
      I1 => \byteNum_reg[3]__0\(4),
      I2 => \byteNum_reg_n_0_[2][4]\,
      I3 => \byteNum_reg[3]__0\(6),
      I4 => \reg_numWords_bcd[2][3]_i_9_n_0\,
      O => \reg_numWords_bcd[2][3]_i_3_n_0\
    );
\reg_numWords_bcd[2][3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \byteNum_reg[3]__0\(3),
      I1 => \byteNum_reg_n_0_[1][4]\,
      I2 => \byteNum_reg_n_0_[2][6]\,
      I3 => \byteNum_reg_n_0_[1][5]\,
      I4 => \reg_numWords_bcd[2][3]_i_10_n_0\,
      O => \reg_numWords_bcd[2][3]_i_4_n_0\
    );
\reg_numWords_bcd[2][3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE0"
    )
        port map (
      I0 => \byteNum_reg_n_0_[2][2]\,
      I1 => \byteNum_reg_n_0_[2][1]\,
      I2 => \byteNum_reg_n_0_[2][3]\,
      I3 => \byteNum_reg[3]__0\(1),
      I4 => \byteNum_reg[3]__0\(2),
      I5 => \byteNum_reg_n_0_[2][7]\,
      O => \reg_numWords_bcd[2][3]_i_5_n_0\
    );
\reg_numWords_bcd[2][3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \byteNum_reg_n_0_[0][2]\,
      I1 => \byteNum_reg_n_0_[0][1]\,
      I2 => \byteNum_reg_n_0_[0][3]\,
      I3 => \byteNum_reg_n_0_[1][2]\,
      I4 => \byteNum_reg_n_0_[1][1]\,
      I5 => \byteNum_reg_n_0_[1][3]\,
      O => \reg_numWords_bcd[2][3]_i_6_n_0\
    );
\reg_numWords_bcd[2][3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \byteNum_reg_n_0_[2][1]\,
      I1 => \byteNum_reg_n_0_[2][2]\,
      I2 => \byteNum_reg_n_0_[0][7]\,
      I3 => \byteNum_reg_n_0_[0][0]\,
      I4 => \byteNum_reg_n_0_[0][2]\,
      I5 => \byteNum_reg_n_0_[0][1]\,
      O => \reg_numWords_bcd[2][3]_i_7_n_0\
    );
\reg_numWords_bcd[2][3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \byteNum_reg_n_0_[1][1]\,
      I1 => \byteNum_reg_n_0_[1][2]\,
      I2 => \byteNum_reg_n_0_[1][3]\,
      I3 => \byteNum_reg_n_0_[0][6]\,
      O => \reg_numWords_bcd[2][3]_i_8_n_0\
    );
\reg_numWords_bcd[2][3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \byteNum_reg_n_0_[0][6]\,
      I1 => \byteNum_reg_n_0_[1][7]\,
      I2 => \byteNum_reg[3]__0\(0),
      I3 => \byteNum_reg[3]__0\(7),
      O => \reg_numWords_bcd[2][3]_i_9_n_0\
    );
\reg_numWords_bcd_reg[0][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[0][0]\,
      Q => \numWords_bcd[0]\(0),
      S => reset
    );
\reg_numWords_bcd_reg[0][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[0][1]\,
      Q => \numWords_bcd[0]\(1),
      S => reset
    );
\reg_numWords_bcd_reg[0][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[0][2]\,
      Q => \numWords_bcd[0]\(2),
      S => reset
    );
\reg_numWords_bcd_reg[0][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[0][3]\,
      Q => \numWords_bcd[0]\(3),
      S => reset
    );
\reg_numWords_bcd_reg[1][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[1][0]\,
      Q => \numWords_bcd[1]\(0),
      S => reset
    );
\reg_numWords_bcd_reg[1][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[1][1]\,
      Q => \numWords_bcd[1]\(1),
      S => reset
    );
\reg_numWords_bcd_reg[1][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[1][2]\,
      Q => \numWords_bcd[1]\(2),
      S => reset
    );
\reg_numWords_bcd_reg[1][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[1][3]\,
      Q => \numWords_bcd[1]\(3),
      S => reset
    );
\reg_numWords_bcd_reg[2][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[2][0]\,
      Q => \numWords_bcd[2]\(0),
      S => reset
    );
\reg_numWords_bcd_reg[2][1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[2][1]\,
      Q => \numWords_bcd[2]\(1),
      S => reset
    );
\reg_numWords_bcd_reg[2][2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[2][2]\,
      Q => \numWords_bcd[2]\(2),
      S => reset
    );
\reg_numWords_bcd_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \reg_numWords_bcd[2][3]_i_1_n_0\,
      D => \byteNum_reg_n_0_[2][3]\,
      Q => \numWords_bcd[2]\(3),
      S => reset
    );
rxdone_inferred_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => curState(4),
      I1 => curState(0),
      I2 => curState(1),
      I3 => curState(2),
      I4 => curState(3),
      O => \^rxdone\
    );
start_inferred_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => curState(4),
      I1 => curState(0),
      I2 => curState(1),
      I3 => curState(2),
      I4 => curState(3),
      O => \^start\
    );
txData_inferred_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => txData_inferred_i_9_n_0,
      I1 => \byteNum_reg_n_0_[0][7]\,
      I2 => txData_inferred_i_10_n_0,
      I3 => txData_inferred_i_11_n_0,
      O => txData(7)
    );
txData_inferred_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006000"
    )
        port map (
      I0 => curState(0),
      I1 => curState(1),
      I2 => curState(3),
      I3 => curState(2),
      I4 => curState(4),
      O => txData_inferred_i_10_n_0
    );
txData_inferred_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000030"
    )
        port map (
      I0 => curState(0),
      I1 => curState(3),
      I2 => curState(4),
      I3 => curState(2),
      I4 => curState(1),
      O => txData_inferred_i_11_n_0
    );
txData_inferred_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1515155515151515"
    )
        port map (
      I0 => txData_inferred_i_34_n_0,
      I1 => txData_inferred_i_9_n_0,
      I2 => txData_inferred_i_35_n_0,
      I3 => txData_inferred_i_10_n_0,
      I4 => txData_inferred_i_11_n_0,
      I5 => \byteNum_reg_n_0_[0][6]\,
      O => txData_inferred_i_12_n_0
    );
txData_inferred_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFDFFFDFFFFF"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => curState(4),
      I2 => curState(3),
      I3 => curState(2),
      I4 => curState(1),
      I5 => curState(0),
      O => txData_inferred_i_13_n_0
    );
txData_inferred_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[1]\,
      I1 => \nibbleCount_reg_n_0_[2]\,
      O => txData_inferred_i_14_n_0
    );
txData_inferred_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => txData_inferred_i_24_n_0,
      I1 => txData_inferred_i_36_n_0,
      I2 => txData_inferred_i_37_n_0,
      O => txData_inferred_i_15_n_0
    );
txData_inferred_i_16: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => txData_inferred_i_38_n_0,
      I1 => txData_inferred_i_39_n_0,
      I2 => txData_inferred_i_40_n_0,
      O => txData_inferred_i_16_n_0
    );
txData_inferred_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAFFBABAAAAAAAAA"
    )
        port map (
      I0 => txData_inferred_i_34_n_0,
      I1 => txData_inferred_i_41_n_0,
      I2 => \byteNum_reg_n_0_[0][5]\,
      I3 => txData_inferred_i_42_n_0,
      I4 => txData_inferred_i_35_n_0,
      I5 => txData_inferred_i_9_n_0,
      O => txData_inferred_i_17_n_0
    );
txData_inferred_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000015555550155"
    )
        port map (
      I0 => txData_inferred_i_14_n_0,
      I1 => byte(5),
      I2 => byte(6),
      I3 => byte(7),
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_43_n_0,
      O => txData_inferred_i_18_n_0
    );
txData_inferred_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"454045400000FFFF"
    )
        port map (
      I0 => txData_inferred_i_14_n_0,
      I1 => txData_inferred_i_16_n_0,
      I2 => \nibbleCount_reg_n_0_[0]\,
      I3 => txData_inferred_i_15_n_0,
      I4 => txData_inferred_i_44_n_0,
      I5 => txData_inferred_i_45_n_0,
      O => txData_inferred_i_19_n_0
    );
txData_inferred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888A8A8A888A"
    )
        port map (
      I0 => txData_inferred_i_12_n_0,
      I1 => txData_inferred_i_13_n_0,
      I2 => txData_inferred_i_14_n_0,
      I3 => txData_inferred_i_15_n_0,
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_16_n_0,
      O => txData(6)
    );
txData_inferred_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101015101010101"
    )
        port map (
      I0 => txData_inferred_i_14_n_0,
      I1 => txData_inferred_i_46_n_0,
      I2 => \nibbleCount_reg_n_0_[0]\,
      I3 => byte(1),
      I4 => byte(2),
      I5 => byte(3),
      O => txData_inferred_i_20_n_0
    );
txData_inferred_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF101F0000"
    )
        port map (
      I0 => txData_inferred_i_47_n_0,
      I1 => txData_inferred_i_38_n_0,
      I2 => \nibbleCount_reg_n_0_[0]\,
      I3 => txData_inferred_i_48_n_0,
      I4 => txData_inferred_i_49_n_0,
      I5 => txData_inferred_i_50_n_0,
      O => txData_inferred_i_21_n_0
    );
txData_inferred_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => \nibbleCount_reg_n_0_[1]\,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => txData_inferred_i_45_n_0,
      O => txData_inferred_i_22_n_0
    );
txData_inferred_i_23: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => txData_inferred_i_51_n_0,
      I1 => txData_inferred_i_37_n_0,
      I2 => txData_inferred_i_36_n_0,
      O => txData_inferred_i_23_n_0
    );
txData_inferred_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(6),
      I1 => \reg_dataResults_reg[4]__0\(6),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(6),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_54_n_0,
      O => txData_inferred_i_24_n_0
    );
txData_inferred_i_25: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => txData_inferred_i_40_n_0,
      I1 => txData_inferred_i_31_n_0,
      I2 => txData_inferred_i_38_n_0,
      I3 => txData_inferred_i_39_n_0,
      I4 => \nibbleCount_reg_n_0_[0]\,
      O => txData_inferred_i_25_n_0
    );
txData_inferred_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAAFBFFAAAAAAAA"
    )
        port map (
      I0 => txData_inferred_i_55_n_0,
      I1 => txData_inferred_i_56_n_0,
      I2 => txData_inferred_i_57_n_0,
      I3 => txData_inferred_i_11_n_0,
      I4 => txData_inferred_i_58_n_0,
      I5 => txData_inferred_i_9_n_0,
      O => txData_inferred_i_26_n_0
    );
txData_inferred_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABBABAABABBBB"
    )
        port map (
      I0 => txData_inferred_i_22_n_0,
      I1 => \nibbleCount_reg_n_0_[0]\,
      I2 => txData_inferred_i_37_n_0,
      I3 => txData_inferred_i_51_n_0,
      I4 => txData_inferred_i_36_n_0,
      I5 => txData_inferred_i_24_n_0,
      O => txData_inferred_i_27_n_0
    );
txData_inferred_i_28: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA4FFFF"
    )
        port map (
      I0 => txData_inferred_i_40_n_0,
      I1 => txData_inferred_i_39_n_0,
      I2 => txData_inferred_i_38_n_0,
      I3 => txData_inferred_i_31_n_0,
      I4 => \nibbleCount_reg_n_0_[0]\,
      O => txData_inferred_i_28_n_0
    );
txData_inferred_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202A202A2A2A2A2"
    )
        port map (
      I0 => txData_inferred_i_9_n_0,
      I1 => txData_inferred_i_59_n_0,
      I2 => txData_inferred_i_11_n_0,
      I3 => txData_inferred_i_60_n_0,
      I4 => txData_inferred_i_61_n_0,
      I5 => txData_inferred_i_62_n_0,
      O => txData_inferred_i_29_n_0
    );
txData_inferred_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55544454"
    )
        port map (
      I0 => txData_inferred_i_13_n_0,
      I1 => txData_inferred_i_14_n_0,
      I2 => txData_inferred_i_15_n_0,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_16_n_0,
      I5 => txData_inferred_i_17_n_0,
      O => txData(5)
    );
txData_inferred_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44BFFFFF44BF0000"
    )
        port map (
      I0 => byte(0),
      I1 => byte(3),
      I2 => byte(2),
      I3 => byte(1),
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_63_n_0,
      O => txData_inferred_i_30_n_0
    );
txData_inferred_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(0),
      I1 => \reg_dataResults_reg[4]__0\(0),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(0),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_64_n_0,
      O => txData_inferred_i_31_n_0
    );
txData_inferred_i_32: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBEEEEE"
    )
        port map (
      I0 => \nibbleCount_reg_n_0_[0]\,
      I1 => txData_inferred_i_51_n_0,
      I2 => txData_inferred_i_24_n_0,
      I3 => txData_inferred_i_36_n_0,
      I4 => txData_inferred_i_37_n_0,
      O => txData_inferred_i_32_n_0
    );
txData_inferred_i_33: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAAFBFFAAAAAAAA"
    )
        port map (
      I0 => txData_inferred_i_65_n_0,
      I1 => txData_inferred_i_66_n_0,
      I2 => txData_inferred_i_67_n_0,
      I3 => txData_inferred_i_11_n_0,
      I4 => txData_inferred_i_68_n_0,
      I5 => txData_inferred_i_9_n_0,
      O => txData_inferred_i_33_n_0
    );
txData_inferred_i_34: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5455545454555555"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => \nibbleCount_reg_n_0_[1]\,
      I2 => \nibbleCount_reg_n_0_[2]\,
      I3 => txData_inferred_i_43_n_0,
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_69_n_0,
      O => txData_inferred_i_34_n_0
    );
txData_inferred_i_35: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFF7F7F7FFFFFF"
    )
        port map (
      I0 => txData_inferred_i_70_n_0,
      I1 => txData_inferred_i_11_n_0,
      I2 => txData_inferred_i_14_n_0,
      I3 => txData_inferred_i_71_n_0,
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_72_n_0,
      O => txData_inferred_i_35_n_0
    );
txData_inferred_i_36: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(5),
      I1 => \reg_dataResults_reg[4]__0\(5),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(5),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_73_n_0,
      O => txData_inferred_i_36_n_0
    );
txData_inferred_i_37: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(7),
      I1 => \reg_dataResults_reg[4]__0\(7),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(7),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_74_n_0,
      O => txData_inferred_i_37_n_0
    );
txData_inferred_i_38: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F505F3F3F3030"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(3),
      I1 => \reg_dataResults_reg[4]__0\(3),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(3),
      I4 => txData_inferred_i_75_n_0,
      I5 => txData_inferred_i_53_n_0,
      O => txData_inferred_i_38_n_0
    );
txData_inferred_i_39: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(2),
      I1 => \reg_dataResults_reg[4]__0\(2),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(2),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_76_n_0,
      O => txData_inferred_i_39_n_0
    );
txData_inferred_i_4: unisim.vcomponents.MUXF7
     port map (
      I0 => txData_inferred_i_18_n_0,
      I1 => txData_inferred_i_19_n_0,
      O => txData(4),
      S => dataStarted_reg_n_0
    );
txData_inferred_i_40: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(1),
      I1 => \reg_dataResults_reg[4]__0\(1),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(1),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_77_n_0,
      O => txData_inferred_i_40_n_0
    );
txData_inferred_i_41: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40424002"
    )
        port map (
      I0 => curState(4),
      I1 => curState(2),
      I2 => curState(3),
      I3 => curState(1),
      I4 => curState(0),
      O => txData_inferred_i_41_n_0
    );
txData_inferred_i_42: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AABFFFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[3]\,
      I1 => \ctrlByteCount_reg_n_0_[1]\,
      I2 => \ctrlByteCount_reg_n_0_[0]\,
      I3 => \ctrlByteCount_reg_n_0_[2]\,
      I4 => txData_inferred_i_10_n_0,
      I5 => txData_inferred_i_11_n_0,
      O => txData_inferred_i_42_n_0
    );
txData_inferred_i_43: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => byte(3),
      I1 => byte(2),
      I2 => byte(1),
      O => txData_inferred_i_43_n_0
    );
txData_inferred_i_44: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF540000FF54FF54"
    )
        port map (
      I0 => txData_inferred_i_78_n_0,
      I1 => txData_inferred_i_79_n_0,
      I2 => txData_inferred_i_14_n_0,
      I3 => txData_inferred_i_42_n_0,
      I4 => txData_inferred_i_41_n_0,
      I5 => \byteNum_reg_n_0_[0][4]\,
      O => txData_inferred_i_44_n_0
    );
txData_inferred_i_45: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000E00"
    )
        port map (
      I0 => curState(0),
      I1 => curState(1),
      I2 => curState(2),
      I3 => curState(3),
      I4 => curState(4),
      O => txData_inferred_i_45_n_0
    );
txData_inferred_i_46: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => byte(7),
      I1 => byte(6),
      I2 => byte(5),
      O => txData_inferred_i_46_n_0
    );
txData_inferred_i_47: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => txData_inferred_i_40_n_0,
      I1 => txData_inferred_i_39_n_0,
      O => txData_inferred_i_47_n_0
    );
txData_inferred_i_48: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => txData_inferred_i_24_n_0,
      I1 => txData_inferred_i_36_n_0,
      I2 => txData_inferred_i_37_n_0,
      O => txData_inferred_i_48_n_0
    );
txData_inferred_i_49: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004040400"
    )
        port map (
      I0 => curState(4),
      I1 => curState(3),
      I2 => curState(2),
      I3 => curState(1),
      I4 => curState(0),
      I5 => txData_inferred_i_14_n_0,
      O => txData_inferred_i_49_n_0
    );
txData_inferred_i_5: unisim.vcomponents.MUXF7
     port map (
      I0 => txData_inferred_i_20_n_0,
      I1 => txData_inferred_i_21_n_0,
      O => txData(3),
      S => dataStarted_reg_n_0
    );
txData_inferred_i_50: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5101515151015101"
    )
        port map (
      I0 => txData_inferred_i_45_n_0,
      I1 => txData_inferred_i_80_n_0,
      I2 => txData_inferred_i_11_n_0,
      I3 => txData_inferred_i_81_n_0,
      I4 => txData_inferred_i_82_n_0,
      I5 => txData_inferred_i_60_n_0,
      O => txData_inferred_i_50_n_0
    );
txData_inferred_i_51: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[5]__0\(4),
      I1 => \reg_dataResults_reg[4]__0\(4),
      I2 => txData_inferred_i_52_n_0,
      I3 => \reg_dataResults_reg[6]__0\(4),
      I4 => txData_inferred_i_53_n_0,
      I5 => txData_inferred_i_83_n_0,
      O => txData_inferred_i_51_n_0
    );
txData_inferred_i_52: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \byteCount_reg_n_0_[1]\,
      I1 => \byteCount_reg_n_0_[2]\,
      O => txData_inferred_i_52_n_0
    );
txData_inferred_i_53: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => \byteCount_reg_n_0_[2]\,
      I1 => \byteCount_reg_n_0_[0]\,
      I2 => \byteCount_reg_n_0_[1]\,
      O => txData_inferred_i_53_n_0
    );
txData_inferred_i_54: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(6),
      I1 => \reg_dataResults_reg[1]__0\(6),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(6),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][6]\,
      O => txData_inferred_i_54_n_0
    );
txData_inferred_i_55: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100011111111"
    )
        port map (
      I0 => txData_inferred_i_14_n_0,
      I1 => dataStarted_reg_n_0,
      I2 => txData_inferred_i_84_n_0,
      I3 => byte(6),
      I4 => \nibbleCount_reg_n_0_[0]\,
      I5 => txData_inferred_i_85_n_0,
      O => txData_inferred_i_55_n_0
    );
txData_inferred_i_56: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DF55DFFFDFFFDFFF"
    )
        port map (
      I0 => txData_inferred_i_60_n_0,
      I1 => txData_inferred_i_86_n_0,
      I2 => \reg_dataResults_reg_n_0_[3][2]\,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_87_n_0,
      I5 => \reg_dataResults_reg_n_0_[3][6]\,
      O => txData_inferred_i_56_n_0
    );
txData_inferred_i_57: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0AFC0A0"
    )
        port map (
      I0 => \reg_maxIndex_reg[2]__0\(2),
      I1 => \reg_maxIndex_reg[1]__0\(2),
      I2 => \peakByteCount_reg_n_0_[1]\,
      I3 => \peakByteCount_reg_n_0_[0]\,
      I4 => \reg_maxIndex_reg[0]__0\(2),
      O => txData_inferred_i_57_n_0
    );
txData_inferred_i_58: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD030000FD03FFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[0]\,
      I1 => \ctrlByteCount_reg_n_0_[2]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      I3 => \ctrlByteCount_reg_n_0_[3]\,
      I4 => txData_inferred_i_10_n_0,
      I5 => \byteNum_reg_n_0_[0][2]\,
      O => txData_inferred_i_58_n_0
    );
txData_inferred_i_59: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF90000FFF9FFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[3]\,
      I1 => \ctrlByteCount_reg_n_0_[0]\,
      I2 => \ctrlByteCount_reg_n_0_[2]\,
      I3 => \ctrlByteCount_reg_n_0_[1]\,
      I4 => txData_inferred_i_10_n_0,
      I5 => \byteNum_reg_n_0_[0][1]\,
      O => txData_inferred_i_59_n_0
    );
txData_inferred_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55550010"
    )
        port map (
      I0 => txData_inferred_i_22_n_0,
      I1 => txData_inferred_i_23_n_0,
      I2 => txData_inferred_i_24_n_0,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_25_n_0,
      I5 => txData_inferred_i_26_n_0,
      O => txData(2)
    );
txData_inferred_i_60: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \peakByteCount_reg_n_0_[1]\,
      I1 => \peakByteCount_reg_n_0_[0]\,
      I2 => \peakByteCount_reg_n_0_[2]\,
      I3 => \nibbleCount_reg_n_0_[2]\,
      I4 => \nibbleCount_reg_n_0_[1]\,
      O => txData_inferred_i_60_n_0
    );
txData_inferred_i_61: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0330033322222222"
    )
        port map (
      I0 => txData_inferred_i_88_n_0,
      I1 => txData_inferred_i_89_n_0,
      I2 => txData_inferred_i_90_n_0,
      I3 => \reg_dataResults_reg_n_0_[3][1]\,
      I4 => \reg_dataResults_reg_n_0_[3][2]\,
      I5 => \nibbleCount_reg_n_0_[0]\,
      O => txData_inferred_i_61_n_0
    );
txData_inferred_i_62: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3F053FF5"
    )
        port map (
      I0 => \reg_maxIndex_reg[0]__0\(1),
      I1 => \reg_maxIndex_reg[1]__0\(1),
      I2 => \peakByteCount_reg_n_0_[1]\,
      I3 => \peakByteCount_reg_n_0_[0]\,
      I4 => \reg_maxIndex_reg[2]__0\(1),
      O => txData_inferred_i_62_n_0
    );
txData_inferred_i_63: unisim.vcomponents.LUT4
    generic map(
      INIT => X"595D"
    )
        port map (
      I0 => byte(5),
      I1 => byte(7),
      I2 => byte(4),
      I3 => byte(6),
      O => txData_inferred_i_63_n_0
    );
txData_inferred_i_64: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(0),
      I1 => \reg_dataResults_reg[1]__0\(0),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(0),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][0]\,
      O => txData_inferred_i_64_n_0
    );
txData_inferred_i_65: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0028AA28AA280028"
    )
        port map (
      I0 => txData_inferred_i_91_n_0,
      I1 => txData_inferred_i_69_n_0,
      I2 => byte(4),
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_43_n_0,
      I5 => byte(0),
      O => txData_inferred_i_65_n_0
    );
txData_inferred_i_66: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5F035FF3"
    )
        port map (
      I0 => \reg_maxIndex_reg[1]__0\(0),
      I1 => \reg_maxIndex_reg[0]__0\(0),
      I2 => \peakByteCount_reg_n_0_[1]\,
      I3 => \peakByteCount_reg_n_0_[0]\,
      I4 => \reg_maxIndex_reg[2]__0\(0),
      O => txData_inferred_i_66_n_0
    );
txData_inferred_i_67: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0028AA28AA280028"
    )
        port map (
      I0 => txData_inferred_i_60_n_0,
      I1 => txData_inferred_i_72_n_0,
      I2 => \reg_dataResults_reg_n_0_[3][4]\,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_71_n_0,
      I5 => \reg_dataResults_reg_n_0_[3][0]\,
      O => txData_inferred_i_67_n_0
    );
txData_inferred_i_68: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD030000FD03FFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[0]\,
      I1 => \ctrlByteCount_reg_n_0_[2]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      I3 => \ctrlByteCount_reg_n_0_[3]\,
      I4 => txData_inferred_i_10_n_0,
      I5 => \byteNum_reg_n_0_[0][0]\,
      O => txData_inferred_i_68_n_0
    );
txData_inferred_i_69: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => byte(7),
      I1 => byte(6),
      I2 => byte(5),
      O => txData_inferred_i_69_n_0
    );
txData_inferred_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F4F4F4F4F4F4FF"
    )
        port map (
      I0 => txData_inferred_i_27_n_0,
      I1 => txData_inferred_i_28_n_0,
      I2 => txData_inferred_i_29_n_0,
      I3 => txData_inferred_i_14_n_0,
      I4 => dataStarted_reg_n_0,
      I5 => txData_inferred_i_30_n_0,
      O => txData(1)
    );
txData_inferred_i_70: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \peakByteCount_reg_n_0_[2]\,
      I1 => \peakByteCount_reg_n_0_[0]\,
      I2 => \peakByteCount_reg_n_0_[1]\,
      O => txData_inferred_i_70_n_0
    );
txData_inferred_i_71: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][3]\,
      I1 => \reg_dataResults_reg_n_0_[3][2]\,
      I2 => \reg_dataResults_reg_n_0_[3][1]\,
      O => txData_inferred_i_71_n_0
    );
txData_inferred_i_72: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][7]\,
      I1 => \reg_dataResults_reg_n_0_[3][6]\,
      I2 => \reg_dataResults_reg_n_0_[3][5]\,
      O => txData_inferred_i_72_n_0
    );
txData_inferred_i_73: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(5),
      I1 => \reg_dataResults_reg[1]__0\(5),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(5),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][5]\,
      O => txData_inferred_i_73_n_0
    );
txData_inferred_i_74: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(7),
      I1 => \reg_dataResults_reg[1]__0\(7),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(7),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][7]\,
      O => txData_inferred_i_74_n_0
    );
txData_inferred_i_75: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \reg_dataResults_reg[2]__0\(3),
      I1 => \reg_dataResults_reg_n_0_[3][3]\,
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[0]__0\(3),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg[1]__0\(3),
      O => txData_inferred_i_75_n_0
    );
txData_inferred_i_76: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(2),
      I1 => \reg_dataResults_reg[1]__0\(2),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(2),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][2]\,
      O => txData_inferred_i_76_n_0
    );
txData_inferred_i_77: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(1),
      I1 => \reg_dataResults_reg[1]__0\(1),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(1),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][1]\,
      O => txData_inferred_i_77_n_0
    );
txData_inferred_i_78: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => txData_inferred_i_11_n_0,
      I1 => \peakByteCount_reg_n_0_[1]\,
      I2 => \peakByteCount_reg_n_0_[0]\,
      I3 => \peakByteCount_reg_n_0_[2]\,
      O => txData_inferred_i_78_n_0
    );
txData_inferred_i_79: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8FFA800"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][3]\,
      I1 => \reg_dataResults_reg_n_0_[3][2]\,
      I2 => \reg_dataResults_reg_n_0_[3][1]\,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_72_n_0,
      O => txData_inferred_i_79_n_0
    );
txData_inferred_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF41550000"
    )
        port map (
      I0 => txData_inferred_i_22_n_0,
      I1 => txData_inferred_i_16_n_0,
      I2 => txData_inferred_i_31_n_0,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => txData_inferred_i_32_n_0,
      I5 => txData_inferred_i_33_n_0,
      O => txData(0)
    );
txData_inferred_i_80: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC010000FC01FFFF"
    )
        port map (
      I0 => \ctrlByteCount_reg_n_0_[0]\,
      I1 => \ctrlByteCount_reg_n_0_[2]\,
      I2 => \ctrlByteCount_reg_n_0_[1]\,
      I3 => \ctrlByteCount_reg_n_0_[3]\,
      I4 => txData_inferred_i_10_n_0,
      I5 => \byteNum_reg_n_0_[0][3]\,
      O => txData_inferred_i_80_n_0
    );
txData_inferred_i_81: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0AFC0A0"
    )
        port map (
      I0 => \reg_maxIndex_reg[2]__0\(3),
      I1 => \reg_maxIndex_reg[1]__0\(3),
      I2 => \peakByteCount_reg_n_0_[1]\,
      I3 => \peakByteCount_reg_n_0_[0]\,
      I4 => \reg_maxIndex_reg[0]__0\(3),
      O => txData_inferred_i_81_n_0
    );
txData_inferred_i_82: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD00FDFFFDFFFDFF"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][3]\,
      I1 => \reg_dataResults_reg_n_0_[3][2]\,
      I2 => \reg_dataResults_reg_n_0_[3][1]\,
      I3 => \nibbleCount_reg_n_0_[0]\,
      I4 => \reg_dataResults_reg_n_0_[3][7]\,
      I5 => txData_inferred_i_92_n_0,
      O => txData_inferred_i_82_n_0
    );
txData_inferred_i_83: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_dataResults_reg[0]__0\(4),
      I1 => \reg_dataResults_reg[1]__0\(4),
      I2 => \byteCount_reg_n_0_[1]\,
      I3 => \reg_dataResults_reg[2]__0\(4),
      I4 => \byteCount_reg_n_0_[0]\,
      I5 => \reg_dataResults_reg_n_0_[3][4]\,
      O => txData_inferred_i_83_n_0
    );
txData_inferred_i_84: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => byte(5),
      I1 => byte(7),
      I2 => byte(4),
      O => txData_inferred_i_84_n_0
    );
txData_inferred_i_85: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04FFFFFF"
    )
        port map (
      I0 => byte(0),
      I1 => byte(3),
      I2 => byte(1),
      I3 => byte(2),
      I4 => \nibbleCount_reg_n_0_[0]\,
      O => txData_inferred_i_85_n_0
    );
txData_inferred_i_86: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][1]\,
      I1 => \reg_dataResults_reg_n_0_[3][3]\,
      I2 => \reg_dataResults_reg_n_0_[3][0]\,
      O => txData_inferred_i_86_n_0
    );
txData_inferred_i_87: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][5]\,
      I1 => \reg_dataResults_reg_n_0_[3][7]\,
      I2 => \reg_dataResults_reg_n_0_[3][4]\,
      O => txData_inferred_i_87_n_0
    );
txData_inferred_i_88: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][5]\,
      I1 => \reg_dataResults_reg_n_0_[3][7]\,
      I2 => \reg_dataResults_reg_n_0_[3][4]\,
      O => txData_inferred_i_88_n_0
    );
txData_inferred_i_89: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][4]\,
      I1 => \reg_dataResults_reg_n_0_[3][7]\,
      I2 => \reg_dataResults_reg_n_0_[3][5]\,
      I3 => \reg_dataResults_reg_n_0_[3][6]\,
      I4 => \nibbleCount_reg_n_0_[0]\,
      O => txData_inferred_i_89_n_0
    );
txData_inferred_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA8AAA8AAA8AAAAA"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => curState(4),
      I2 => curState(3),
      I3 => curState(2),
      I4 => curState(1),
      I5 => curState(0),
      O => txData_inferred_i_9_n_0
    );
txData_inferred_i_90: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][0]\,
      I1 => \reg_dataResults_reg_n_0_[3][3]\,
      O => txData_inferred_i_90_n_0
    );
txData_inferred_i_91: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => dataStarted_reg_n_0,
      I1 => \nibbleCount_reg_n_0_[2]\,
      I2 => \nibbleCount_reg_n_0_[1]\,
      O => txData_inferred_i_91_n_0
    );
txData_inferred_i_92: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \reg_dataResults_reg_n_0_[3][5]\,
      I1 => \reg_dataResults_reg_n_0_[3][6]\,
      O => txData_inferred_i_92_n_0
    );
txnow_inferred_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10044006"
    )
        port map (
      I0 => curState(4),
      I1 => curState(1),
      I2 => curState(2),
      I3 => curState(0),
      I4 => curState(3),
      O => txnow
    );
end STRUCTURE;
