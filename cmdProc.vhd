----------------------------------------------------------------------------
-- cmdProc.vhd
-- (submission version 1.0)
----------------------------------------------------------------------------
-- Author: Billy Hou
-- Date: 2025-03-27
----------------------------------------------------------------------------
-- README:
--   This command processor module handles UART communication:
--   1. Receive and echo the characters entered by the keyboard
--
--   2. Processing commands:
--       - "L" or "l" command: Output byte sequence "09 FA A0 FD BC 10 DE"
--       - "P" or "p" command: Output byte sequence "FD 197"
--
--   3. Handles UART errors and outputs an error message ("ERR").
--
--   This module includes interfaces for future integration with DataProcessor module.
--   These DataProcessor interfaces are not currently used (assigned default values),
--   as the current assignment only focuses on command processor UART communication.
--   They are reserved for future system expansion.
----------------------------------------------------------------------------

library IEEE;                -- Standard IEEE library    
use IEEE.STD_LOGIC_1164.ALL; -- Standard STD_LOGIC_1164 to define Boolean/logical types
use IEEE.NUMERIC_STD.ALL;    -- Standard NUMERIC_STD to define integer/vector conversions
use work.common_pack.all;    -- Common package for common types and functions

--------------------------------------------------------------------------------
-- Entity Declaration
--------------------------------------------------------------------------------
entity cmdProc is
  port (
    clk           : in  std_logic;                    -- System clock
    reset         : in  std_logic;                    -- Synchronous reset signal
    
    rxnow         : in  std_logic;                    -- New byte arrival flag (UART Rx)
    rxData        : in  std_logic_vector(7 downto 0); -- Received bytes of data
    rxdone        : out std_logic;                    -- Tell UART Rx that, this byte has been processed
    ovErr         : in  std_logic;                    -- UART Overflow error flag
    framErr       : in  std_logic;                    -- UART Indicates a frame error
    
    txnow         : out std_logic;                    -- Initiating and sending a single cycle signal (UART Tx)
    txdone        : in  std_logic;                    -- Whether the transmitter is idle
    txData        : out std_logic_vector(7 downto 0); -- Bytes to be sent out

    --------------------------------------------------------------------------------
    -- Note:
    --   The following ports are reserved for integrating with the DataProcessor module
    --   Due to limited time and because I (Billy) am the only person on the command processor side.
    --   This cmdProc implementation currently focuses on the UART tasks that
    --   Professor Dinesh Pamunuwa assigned: handling the "L"/"l" and "P"/"p" commands.
    --   Kristian and Yihyun are working on the DataProcessor side in parallel.
    --   After the submission deadline, I will continue enhancing this cmdProc,
    --   until the full functionality can be integrated seamlessly with the DataProcessor.
    --------------------------------------------------------------------------------
    start         : out std_logic;                               -- Trigger the DataProcessor to start (future extension)
    numWords_bcd  : out BCD_ARRAY_TYPE(2 downto 0);              -- Number of bytes to process (BCD) (future extension)
    dataReady     : in  std_logic;                               -- Indicates the DataProcessor has data ready (future extension)
    byte          : in  std_logic_vector(7 downto 0);            -- Single byte from the DataProcessor (future extension)
    maxIndex      : in  BCD_ARRAY_TYPE(2 downto 0);              -- Maximum index in BCD (future extension)
    dataResults   : in  CHAR_ARRAY_TYPE(0 to RESULT_BYTE_NUM-1); -- Processed data block (future extension)
    seqDone       : in  std_logic                                -- Indicates DataProcessor has completed (future extension)
  );
end cmdProc;

architecture Behavioral of cmdProc is

    --------------------------------------------------------------------------------
    -- Constant definition: Identify ASCII values such as 'L'/'l','P'/'p', and carriage returns and newlines
    --------------------------------------------------------------------------------
    constant ASCII_L_UP : std_logic_vector(7 downto 0) := x"4C"; -- 'L'
    constant ASCII_L_LO : std_logic_vector(7 downto 0) := x"6C"; -- 'l'
    constant ASCII_P_UP : std_logic_vector(7 downto 0) := x"50"; -- 'P'
    constant ASCII_P_LO : std_logic_vector(7 downto 0) := x"70"; -- 'p'
    constant ASCII_LF   : std_logic_vector(7 downto 0) := x"0A"; -- Line Feed
    constant ASCII_CR   : std_logic_vector(7 downto 0) := x"0D"; -- Carriage Return

    --------------------------------------------------------------------------------
    -- Error Message Constants: "ERR" characters
    --------------------------------------------------------------------------------
    constant ERR_MSG  : std_logic_vector(7 downto 0) := x"45"; -- 'E'
    constant ERR_MSG2 : std_logic_vector(7 downto 0) := x"52"; -- 'R'
    constant ERR_MSG3 : std_logic_vector(7 downto 0) := x"52"; -- 'R'

    --------------------------------------------------------------------------------
    -- Custom type for storing ASCII sequences (simple "ROM")
    --------------------------------------------------------------------------------
    type ascii_array is array (natural range <>) of std_logic_vector(7 downto 0);
    --------------------------------------------------------------------------------
    -- 'L'/'l' command output: "09 FA A0 FD BC 10 DE" (with spaces)
    --------------------------------------------------------------------------------
    constant L_TEXT : ascii_array := (
      x"30", x"39", x"20",  -- "09 "
      x"46", x"41", x"20",  -- "FA "
      x"41", x"30", x"20",  -- "A0 "
      x"46", x"44", x"20",  -- "FD "
      x"42", x"43", x"20",  -- "BC "
      x"31", x"30", x"20",  -- "10 "
      x"44", x"45"          -- "DE"
    );
    constant L_LEN : natural := L_TEXT'length; --L Total bytes of the command string

    --------------------------------------------------------------------------------
    -- 'P'/'p' command output: "FD 197"
    --------------------------------------------------------------------------------
    constant P_TEXT : ascii_array := (
      x"46", x"44", x"20",  -- "FD"
      x"31", x"39", x"37"   -- "197"
    );
    constant P_LEN : natural := P_TEXT'length; -- Total length of P command string

    --------------------------------------------------------------------------------
    -- State machine: Processes idle, echo, and print commands handling
    --------------------------------------------------------------------------------
    type state_type is (
       S_IDLE,      -- Wait for new byte from UART
       S_ECHO,      -- Echo the received byte
       S_CHECK_CMD, -- See if input char ('L','l','P','p')
       S_PRINT_L,   -- Send L_TEXT
       S_PRINT_P,   -- Send P_TEXT
       S_LINEFEED,  -- Send ASCII_LF
       S_CARRIAGE,  -- Send ASCII_CR
       S_ERROR,     -- Process error: Send "ERR" if error
       S_DONE       -- Output done, return to idle
    );

    --------------------------------------------------------------------------------
    -- Internal Signals: Hold the current/next state signal, plus the internal register
    --------------------------------------------------------------------------------
    signal curState, nextState : state_type := S_IDLE;  -- Current and next state registers
    signal rxDone_reg : std_logic := '0';               -- Internal rxdone signal
    signal txNow_reg  : std_logic := '0';               -- Internal txnow signal
    signal txData_reg : std_logic_vector(7 downto 0) := (others => '0'); -- Internal txdata

    --------------------------------------------------------------------------------
    -- Index for iterating through ASCII arrays (L_TEXT, P_TEXT, or Error message)
    --------------------------------------------------------------------------------
    signal rom_index : integer range 0 to 21 := 0;

begin

    --------------------------------------------------------------------------------
    -- Output Tasks
    --------------------------------------------------------------------------------
    rxdone <= rxDone_reg;      -- Signal byte has been processed
    txnow  <= txNow_reg;       -- Trigger byte transmission
    txData <= txData_reg;      -- Byte to be transmitted

    --------------------------------------------------------------------------------
    -- For DataProcessor ports, which are not used here, set to default (future enhancement)
    --------------------------------------------------------------------------------
    start        <= '0';
    numWords_bcd <= (others => (others => '0'));

    --------------------------------------------------------------------------------
    -- Status register: Updates status at clk(clock) rising edge
    --------------------------------------------------------------------------------
    process(clk)
    begin
     if rising_edge(clk) then
       if reset = '1' then
         curState <= S_IDLE;  -- Reset to idle state
       else
        curState <= nextState; -- Advance to next state
       end if;
     end if;
    end process;

    --------------------------------------------------------------------------------
    -- ROM Index Counter: Tracks progress through text sequences
    --------------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
          if reset = '1' then
            rom_index <= 0;      -- Reset index on reset
        else
          case curState is
            when S_PRINT_L | S_PRINT_P | S_ERROR =>
              -- Increment index only when current transmission is complete
              if txdone = '1' then
                rom_index <= rom_index + 1;
              end if;
            when S_IDLE | S_DONE =>
              -- Reset index when returning to idle or completing output
              rom_index <= 0;
            when others =>
              -- Maintain current index in other states
              rom_index <= rom_index;
          end case;
        end if;
      end if;
    end process;

    --------------------------------------------------------------------------------
    -- Next State Logic: combinatorial logic that determines the next state 
    -- based on the current state/input and controls the output
    --------------------------------------------------------------------------------
    process(curState, rxnow, rxData, txdone, ovErr, framErr, rom_index)
    begin
    -- Default assignments to prevent latches
    nextState  <= curState;
    rxDone_reg <= '0';
    txNow_reg  <= '0';
    txData_reg <= (others => '0');

    -- UART error handling takes precedence
    if (ovErr = '1') or (framErr = '1') then
      nextState  <= S_ERROR;
      rxDone_reg <= '1';  -- Consume the error byte
    else                  -- Otherwise, follow normal states
      case curState is

        -----------------------------------------------------------------------------
        -- S_IDLE: Wait for a new incoming byte from UART
        ------------------------------------------------------------------
        when S_IDLE =>
          if rxnow = '1' then
            rxDone_reg <= '1';    -- Acknowledge byte received
            nextState  <= S_ECHO; -- Proceed to echo the character
          end if;
          
        -----------------------------------------------------------------------------
        -- S_ECHO: Echo received character back to terminal
        -----------------------------------------------------------------------------
        when S_ECHO =>
          rxDone_reg <= '1';          -- Mark the byte has been used 
          if txdone = '1' then        -- When transmitter is available
            txData_reg <= rxData;     -- Echo the received byte
            txNow_reg  <= '1';        -- Trigger transmission
            nextState  <= S_CHECK_CMD;-- Check if it's L/l or P/p
          end if;

        -----------------------------------------------------------------------------
        -- S_CHECK_CMD: Identify and process command character(check received L/l or P/p)
        -----------------------------------------------------------------------------
        when S_CHECK_CMD =>
          if (rxData = ASCII_L_UP) or (rxData = ASCII_L_LO) then
            nextState <= S_PRINT_L;     -- Handle 'L' or 'l' command
          elsif (rxData = ASCII_P_UP) or (rxData = ASCII_P_LO) then
            nextState <= S_PRINT_P;     -- Handle 'P' or 'p' command
          else
            nextState <= S_IDLE;        -- Unrecognized input, return to idle
          end if;

        -----------------------------------------------------------------------------
        -- S_PRINT_L: Output L command response sequence
        -----------------------------------------------------------------------------
        when S_PRINT_L =>
          if txdone = '1' then                 -- When transmitter is idle
            txData_reg <= L_TEXT(rom_index);   -- Retrieves the next character
            txNow_reg  <= '1';                 -- Single-cycle send signal is activated
            if rom_index = L_LEN - 1 then      -- If it is the last character
              nextState <= S_LINEFEED;         -- Fill a new line
            else
              nextState <= S_PRINT_L;          -- Otherwise, continue printing
            end if;
          end if;

        -----------------------------------------------------------------------------
        -- S_PRINT_P: Output P command response sequence
        -----------------------------------------------------------------------------
        when S_PRINT_P =>
          if txdone = '1' then
            txData_reg <= P_TEXT(rom_index);  -- Get current character
            txNow_reg  <= '1';                -- Trigger transmission
            if rom_index = P_LEN - 1 then     -- Check if at the end of sequence
              nextState <= S_LINEFEED;        -- Proceed to line termination
            else
              nextState <= S_PRINT_P;         -- Continue with sequence
            end if;
          end if;

        -----------------------------------------------------------------------------
        -- S_LINEFEED: Send Line Feed character
        -----------------------------------------------------------------------------
        when S_LINEFEED =>
          if txdone = '1' then
            txData_reg <= ASCII_LF;     -- Send the line feed
            txNow_reg  <= '1';          -- Trigger the transmission
            nextState  <= S_CARRIAGE;   -- Proceed to the carriage return
          end if;

        ----------------------------------------------------------------------------- 
        -- S_CARRIAGE: Send Carriage Return character
        -----------------------------------------------------------------------------
        when S_CARRIAGE =>
          if txdone = '1' then
            txData_reg <= ASCII_CR;     -- Send carriage return
            txNow_reg  <= '1';          -- Trigger the transmission
            nextState  <= S_DONE;       -- Sequence complete
          end if;

        -----------------------------------------------------------------------------
        -- S_DONE: Sequence complete, return to idle
        -----------------------------------------------------------------------------
        when S_DONE =>
          nextState <= S_IDLE;

        -----------------------------------------------------------------------------
        -- S_ERROR: Send "ERR" if we encountered ovErr or framErr
        -----------------------------------------------------------------------------
        when S_ERROR =>
          if txdone = '1' then
            case rom_index is
              when 0 =>
                txData_reg <= ERR_MSG;    -- Send 'E'
                txNow_reg  <= '1';        -- Trigger the transmission
                nextState  <= S_ERROR;    -- Continue error sequence
              when 1 =>
                txData_reg <= ERR_MSG2;   -- Send 'R'
                txNow_reg  <= '1';        -- Trigger the transmission
                nextState  <= S_ERROR;    -- Continue error sequence
              when 2 =>
                txData_reg <= ERR_MSG3;   -- Send 'R'
                txNow_reg  <= '1';        -- Trigger the transmission
                nextState  <= S_LINEFEED; -- Proceed to line termination
              when others =>
                nextState <= S_LINEFEED;  -- Error sequence complete
            end case;
          end if;

        -----------------------------------------------------------------------------
        -- Default case (safety): Return to idle
        -----------------------------------------------------------------------------
        when others =>
          nextState <= S_IDLE;          -- Return to idle on invalid state
      end case;
    end if;
  end process;
end Behavioral;
