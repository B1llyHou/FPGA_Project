# Digital Design Group Project  
## Team Members
### Command Processor - UART Communication  
- **Billy Hou** (vx21242@bristol.ac.uk)
### Data Processor - Full Specification  
- **Yihyun Kwon** (wu23001@bristol.ac.uk)  
- **Kristian Norris** (qe23270@bristol.ac.uk)  
## Objective

As per Professor Dinesh Pamunuwa's instructions, due to reduction of our team size , the group responsibilities were adjusted.  
Billy was assigned to:
1. Receive and **echo characters** typed into the PuTTY terminal.
2. Respond to command `'L'` or `'l'` by printing:  
   `09 FA A0 FD BC 10 DE`
3. Respond to command `'P'` or `'p'` by printing:  
   `FD 197`
4. The VHDL implementation must be **synthesizable**.

## Command Processor Overview
The simplified `cmdProc` module handles basic UART communication and command detection. It is built using a state machine (FSM) and connects to UART RX and TX modules to receive, and transmit characters.

### Key Components

- **FSM Controller**: Manages command parsing and response sending.
- **UART RX Interface**: Handles input from keyboard via PuTTY.
- **UART TX Interface**: Sends output back to the terminal.
- **Predefined Constants**:  
  - `'L'` → `09 FA A0 FD BC 10 DE`  
  - `'P'` → `FD 197`


## State Machine Explanation

| **State**      | **What it does**                                                                 | **What Next**                                                  |
|----------------|----------------------------------------------------------------------------------|-------------------------------------------------|
| `S_IDLE`       | Waits for a new character from UART RX                                          | → `S_ECHO` when `rxnow = '1'` |
| `S_ECHO`       | Echoes the received character back to terminal                                  | → `S_CHECK_CMD` when `txdone = '1'`|
| `S_CHECK_CMD`  | Checks if input is `'L'`, `'l'`, `'P'`, or `'p'`                                 | → `S_PRINT_L`, `S_PRINT_P`, or `S_IDLE`|
| `S_PRINT_L`    | Sends bytes `09 FA A0 FD BC 10 DE` one at a time                                | → Stay if bytes remain, else → `S_LINEFEED`|
| `S_PRINT_P`    | Sends bytes `FD 197` one at a time                                               | → Stay if bytes remain, else → `S_LINEFEED`|
| `S_LINEFEED`   | Sends line feed (`0x0A`)                                                         | → `S_CARRIAGE` when `txdone = '1'` |
| `S_CARRIAGE`   | Sends carriage return (`0x0D`)                                                   | → `S_DONE` when `txdone = '1'`|
| `S_DONE`       | Returns to idle, ready for next character                                        | → `S_IDLE`|
| `S_ERROR`      | If UART error occurs, sends `"ERR"`                                              | → `S_LINEFEED` after printing error|


## I/O Interface

| **Signal**     | **Direction** | **Width** | **Description**                                                |
|----------------|---------------|-----------|----------------------------------------------------------------|
| `clk`          | input         | 1 bit     | 100 MHz system clock                                           |
| `reset`        | input         | 1 bit     | Synchronous reset                                              |
| `rxData`       | input         | 8 bits    | Received UART byte                                             |
| `rxnow`        | input         | 1 bit     | High when a new byte is available                              |
| `rxdone`       | output        | 1 bit     | Pulse high when byte has been processed                        |
| `ovErr`        | input         | 1 bit     | UART overflow error                                            |
| `framErr`      | input         | 1 bit     | UART frame error                                               |
| `txData`       | output        | 8 bits    | Byte to be sent to UART TX                                     |
| `txnow`        | output        | 1 bit     | Pulse high to start UART TX                                    |
| `txdone`       | input         | 1 bit     | High when UART TX is ready for next byte                       |


## ✅ Simulation Results

### `L` / `l` Command
![List Command Output](https://github.com/user-attachments/assets/8330f5be-33df-4bf6-a7a3-a154c641f943)  
*（Output shows correct response: `09 FA A0 FD BC 10 DE）*

---

### `P` / `p` Command
![Peak Command Output](https://github.com/user-attachments/assets/d864a233-fe10-4f7b-9f58-75dda05b7626)  
*（Output shows correct response: `FD 197`）*

---

## Conclusion

The simplified `cmdProc` satisfies all requirements given by Professor Pamunuwa for the reduced range assignment.  
- All specified UART commands are supported.  
- Implementation is **synthesizable**.  
- Testing through simulation confirms correctness.
---
## Main Assignment

### Introduction to Assignment
- **[Preamble](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/preamble.htm)**
  - [Introduction](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/preamble.htm)
  - [How to Read this Document](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/preamble.htm)
  - [Learning Outcomes](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/preamble.htm)
- **[Functional Specifications]([Document/A2_specs.md](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_specs.htm))**
  - [Overview](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_specs.htm)
  - [Commands](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_specs.htm)
  - [Printing Output](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_specs.htm)
  - [Check Understanding](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_specs.htm)
- **[Communication Protocols](Document/A2_coms.md)**
  - [Serial Communication](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)
    - [UART Protocol](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)
    - [PC Implementation](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)
    - [ASCII Control Sequences](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)
  - [Asynchronous Signalling](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)
    - [Two-Phase Protocol](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_coms.htm)

---

### Architecture, Design & Synthesis
- **[System Design](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design.htm)**
  - [UART Transmitter](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design.htm)
  - [UART Receiver](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design.htm)
  - [Command Processor](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design.htm)
  - [Data Processor](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design.htm)
- **[Vivado Guide](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)**
  - [Testing UART](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)
  - [Peak Detector](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)
    - [System Synthesis](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)
    - [Full Simulation](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)
    - [Data Processor Sim](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)
    - [Command Processor Sim](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_vivado.htm)

---

### Methodology
- **[Group Work](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)**
  - [Work Division](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
    - [Team Structure](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
    - [Task Allocation](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
    - [Common Pitfalls](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
  - [Effective Collaboration](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
  - [Conflict Resolution](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_group.htm)
- **[Deliverables](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)**
  - [Interim Goals](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)
    - [Command Processor](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)
    - [Data Processor](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)
    - [Progress Report](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)
  - [Final Deadline](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_deliverables.htm)
- **[Design Approach](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)**
  - [Modular Design](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)
  - [Development Workflow](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)
  - [Coding Style](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)
  - [Version Control](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)

---

## References
- [All References](https://seis.bristol.ac.uk/~sy13201/digital_design/ECAD/A2_design_approach.htm)

---
