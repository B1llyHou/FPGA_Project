----------------------------------------------------------------------------
-- cmdProc.vhd
-- UART Command Processor Implementation
----------------------------------------------------------------------------
-- Brief: A command processor
----------------------------------------------------------------------------
-- Author: Billy Hou
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
-- Define ASCII character constants to make code easier to read.
entity cmdProc is
  port (
    clk       : in  std_logic;                     --system clock
    reset     : in  std_logic;                     --synchronous reset
    -- UART Rx interface
    rxNow     : in  std_logic;                     --new byte received flag
    rxData    : in  std_logic_vector(7 downto 0);  --received byte
    ovErr     : in  std_logic;                     --overflow error flag
    framErr   : in  std_logic;                     --framing error flag
    rxDone    : out std_logic;                     --notify Rx the byte has been read
    -- UART Tx interface
    txDone    : in  std_logic;                     --Tx module idle flag
    txNow     : out std_logic;                     --Initiate transmision signal (one clock cycle)
    txData    : out std_logic_vector(7 downto 0)   --Byte to be transmitted
  );
end cmdProc;

--------------------------------------------------------------------------------
-- Architecture: Synchronous FSM Implementation
--------------------------------------------------------------------------------
--
-- The FSM controled the operation step by step.
-- Each state represents the specific step in the command processing:
--   S_IDLE      - waiting for a new byte.
--   S_ECHO      - echo the received byte.
--   S_CHECK_CMD - determine if the byte is a valid command.
--   S_PRINT_L   - print the fixed string for the L command.
--   S_PRINT_P   - print the fixed string for the P command.
--   S_LINEFEED  - print a line feed character.
--   S_CARRIAGE  - print a carriage return character.
--   S_ERROR     - handle errors by printing "ERR"(Error).
--   S_DONE      - return to idle after printing.

--ASCII character constant definitions
    constant ASCII_L_UP : std_logic_vector(7 downto 0) := x"4C"; --'L'
    constant ASCII_L_LO : std_logic_vector(7 downto 0) := x"6C"; --'l'
    constant ASCII_P_UP : std_logic_vector(7 downto 0) := x"50"; --'P'
    constant ASCII_P_LO : std_logic_vector(7 downto 0) := x"70"; --'p'
    constant ASCII_LF   : std_logic_vector(7 downto 0) := x"0A"; --LF(Line Feed)
    constant ASCII_CR   : std_logic_vector(7 downto 0) := x"0D"; --CR(Carriage Return)

--Error message "ERR"(Error)
    constant ERR_MSG  : std_logic_vector(7 downto 0) := x"45"; --'E'
    constant ERR_MSG2 : std_logic_vector(7 downto 0) := x"52"; --'R'
    constant ERR_MSG3 : std_logic_vector(7 downto 0) := x"52"; --'R'

--store the fixed string for the L command in an array
    type ascii_array is array (natural range <>) of std_logic_vector(7 downto 0);
    constant L_TEXT : ascii_array := (
    x"30", x"39", x"20",  --"09 "
    x"46", x"41", x"20",  --"FA "
    x"41", x"30", x"20",  --"A0 "
    x"46", x"44", x"20",  --"FD "
    x"42", x"43", x"20",  --"BC "
    x"31", x"30", x"20",  --"10 "
    x"44", x"45"         --"DE"
  );
    constant L_LEN : natural := L_TEXT'length;  --21 bytes
--Store fixed string for the P command in the array
    constant P_TEXT : ascii_array := (
    x"46", x"44", x"20",  --"FD "
    x"31", x"39", x"37"   --"197"
  );
    constant P_LEN : natural := P_TEXT'length;  --6 bytes
--Define all states for the state machine
 type state_type is (
    S_IDLE,          --Idle, waiting for input
    S_ECHO,          --echo the received character
    S_CHECK_CMD,     --Check if the character is a valid command
    S_PRINT_L,       --Print L command string (output L_TEXT from ROM)
    S_PRINT_P,       --Print P command string (output P_TEXT from ROM)
    S_LINEFEED,      --Print line feed (LF, 0x0A)
    S_CARRIAGE,      --Print carriage return (CR, 0x0D)
    S_ERROR,         --Error state, output "ERR"(Error)
    S_DONE           --Finished printing, return to idle
  );

                               --Internal state registers
    signal curState, nextState : state_type := S_IDLE;

--Internal registers for output signals
    signal rxDone_reg, txNow_reg : std_logic := '0';
    signal txData_reg : std_logic_vector(7 downto 0) := (others => '0');

--ROM output counter (used in L and P states, not concurrently)
    signal rom_index : integer range 0 to 21 := 0;

begin

--Drive internal signals to ports
    rxDone <= rxDone_reg;
    txNow  <= txNow_reg;
    txData <= txData_reg;
----------------------------------------------------------------------------
--State Register Update Process (Sequential Logic)
----------------------------------------------------------------------------
    stateRegister: process(clk)
begin
    if rising_edge(clk) then
      if reset = '1' then
        curState  <= S_IDLE;
        rom_index <= 0;
      else
        curState <= nextState;
------- Reset the counter when entering a printing state
        if (curState /= nextState) then
          if (nextState = S_PRINT_L) or (nextState = S_PRINT_P) or (nextState = S_ERROR) then
            rom_index <= 0;
          end if;
        end if;
      end if;
    end if;
  end process stateRegister;

----------------------------------------------------------------------------
-- Combinational Process: Use to determine nextState and output signals
----------------------------------------------------------------------------
    nextStateLogic: process(curState, rxNow, rxData, txDone, ovErr, framErr, rom_index)
begin
--默认设置
    nextState    <= curState;
    rxDone_reg   <= '0';
    txNow_reg    <= '0';
    txData_reg   <= (others => '0');

--如果UART出现错误，进入错误处理状态
    if (ovErr = '1') or (framErr = '1') then
      nextState <= S_ERROR;
    else
      case curState is
----------------------------------------------------------------------------
--S_IDLE：等待新字节
----------------------------------------------------------------------------
        when S_IDLE =>
          if rxNow = '1' then
            nextState <= S_ECHO;
          end if;

----------------------------------------------------------------------------
--S_ECHO：get收到的字节
----------------------------------------------------------------------------
        when S_ECHO =>
          if txDone = '1' then
            txData_reg <= rxData;  --回显原始数据
            txNow_reg  <= '1';
          end if;
          rxDone_reg <= '1';       --通知Rx已读
          nextState  <= S_CHECK_CMD;  --进入命令检查
...
