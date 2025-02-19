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
-- Constant definitions
--------------------------------------------------------------------------------
-- TODO: Define the ASCII constants and message arrays here
-- Example: constant ASCII_L : std_logic_vector(7 downto 0) := x"4C";  -- 'L'

--------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------
entity cmdProc is
    port (
        -- Clock and reset
        clk     : in  std_logic;
        rst     : in  std_logic;  -- Synchronous reset
        
        -- UART Rx interface
        rxNow   : in  std_logic;  -- New byte received
        rxData  : in  std_logic_vector(7 downto 0);
        rxDone  : out std_logic;  -- Byte processed
        
        -- UART Tx interface
        txDone  : in  std_logic;  -- Transmitter ready
        txNow   : out std_logic;  -- Start transmission
        txData  : out std_logic_vector(7 downto 0)
    );
end cmdProc;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture Behavioral of cmdProc is
    -- FSM state definition
    type state_type is (
        S_IDLE,     -- Wait for input
        -- TODO: Add the states here
        S_DONE      -- Return to idle
    );
    
    -- Internal signals
    signal current_state, next_state : state_type;
    -- TODO: Add the internal signals here

begin
    --------------------------------------------------------
    -- State Register (Sequential)
    --------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= S_IDLE;
                -- TODO: Reset the internal registers
            else
                current_state <= next_state;
                -- TODO: Update the internal registers
            end if;
        end if;
    end process;

    --------------------------------------------------------
    -- Next State Logic (Combinational)
    --------------------------------------------------------
    process(current_state, rxNow, rxData, txDone)
    begin
        -- Default assignments
        next_state <= current_state;
        rxDone <= '0';
        txNow <= '0';
        txData <= (others => '0');

        case current_state is
            when S_IDLE =>
                -- TODO: Implement idle state logic
                
            -- TODO: Implement the state machine logic
                
            when S_DONE =>
                next_state <= S_IDLE;
                
            when others =>
                next_state <= S_IDLE;
        end case;
    end process;

end Behavioral;
