README 

These files implement the data processor of the peak detector system using VHDL. The data processor is designed to retrieve a sequence of bytes and detect the greatest byte in the sequence. Each component of the data processor is implemented as a seperate VHDL module, with corresponding testbenches to verify functionality of each module through simulation.

-----------------------------------------------------------------

Files included in the data processor implementation:

1) dataConsume.vhd
The top-level module that controls and instantiates dataRetrieval.vhd and peakDetection.vhd.

2) dataRetrieval.vhd
A submodule of dataConsume that controls the retrieval of a defined number of data bytes from the data generator using a two-phase handshaking protocol.

3) peakDetection.vhd
A submodule of dataConsume that performs peak detection on the sequence of bytes retrieved by dataRetrieval.vhd. Following the processin of all bytes, the output sequence is formatted and output.

4) bcd_integer_conversion.vhd
A package that provides conversion function between integer values and BCD values.

5) tb_dataRetrieval.vhd
A testbench to verify the functionality of dataRetrieval.vhd through simulation.

6) tb_peakDetection.vhd
A testbench to verify the functionality of peakDetection.vhd through simulation.

7) tb_bcd_integer_conversion.vhd
A testbench to verify the functionality of bcd_integer_conversion.vhd through simulation.

-----------------------------------------------------------------

How to test the functionality of the system with testbenches:

To test dataRetrieval.vhd, required files:

	- dataRetrieval.vhd
	- common_pack.vhd			[supplied file]
	- tb_dataRetrieval.vhd
	
To test peakDetection.vhd, required files:

	- peakDetection.vhd
	- bcd_integer_conversion.vhd
	- common_pack.vhd			[supplied file]
	- tb_peakDetection.vhd
	
To test bcd_integer_conversion.vhd, required files:

	- bcd_integer_conversion.vhd
	- common_pack.vhd			[supplied file]
	- tb_bcd_integer_conversion.vhd
	
To test the entire data processor's functionality, required files:

	- dataConsume.vhd
	- dataRetrieval.vhd
	- peakDetection.vhd
	- bcd_integer_conversion.vhd
	- common_pack.vhd			[supplied file]
	- dataGen.vhd				[supplied file]
	- tb_dataConsume_signed.vhd	[supplied file]
	
To test the entire peak detector's functionality, required files:

	- dataConsume.vhd
	- dataRetrieval.vhd
	- peakDetection.vhd
	- bcd_integer_conversion.vhd
	- common_pack.vhd			[supplied file]
	- dataGen.vhd				[supplied file]
	- tb_dataConsume_signed.vhd	[supplied file]
	- UART_RX_CTRL.vhd			[supplied file]
	- UART_TX_CTRL.vhd			[supplied file]
	- cmdProc_wrapper.vhd		[supplied file]
	- cmdProv_synthesised.vhd	[supplied file]
	
-----------------------------------------------------------------

Synthesis: