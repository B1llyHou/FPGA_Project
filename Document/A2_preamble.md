# 1.0 Preamble
## 1.1 Introduction
In Assignment, you will work in a group of five members and implement a design in a Field-Programmable Gate Array (FPGA). The documentation for Assignment has three parts; the first, Introduction to Assignment covers the specifications of the system in detail and technical details of the communication protocol to be adopted between the different blocks within the design and between the design and the outside world. The second, Architecture, Design, Simulation and Synthesis gives details of the top-level architecture, and describes how to simulate the full system and the Command and Data Processors separately, including the use of "black-box" functional models to test your implementation of the Command Processor with a reference implementation of the Data Processor, and vice versa. It also describes how to synthesise the system and get it working on the CMOD A7 board you will use for this assignment. It also includes an introduction to Vivado, the software you will use in this assignment. Finally, Part 3, How to Approach the Design describes how to approach the design working as a group and what strategy you should adopt to divide the work equally amongst your group members.

## 1.2 How to Read this Document
You should scan Part 1 Introduction to get an overview of what you need to do. After reading Section 2 Functional Specifications, make sure to download the supplied bit file and check your understanding of the specifications. You can skip the details of the protocols in Section 3 Communication Protocols in a first read and come back to it when you need to implement that particular component.

Next, read Section 4 Design in Part 2 to understand the prescribed interfaces of the different components. Go on to Section 5.1 Testing the UART Demonstrator and synthesise the UART demonstrator. Then synthesise the peak detector by using the supplied edn files and the rest of the sources as described in detail in that section. Programme the FPGA with the generated bit file and see if the behaviour is the same as with the supplied bit file. Finally, to conclude this part run a full functional simulation as described. Aim to complete all of this in the first two hours of the first scheduled session.

Once you have completed the above, go on to read Part 3, How to Approach the Design - Methodology. You should not start work on the design until all members of the group have read Part 3 and have agreed on the division of work, and how to manage information sharing, record details of meetings and keeping track of each individuals responsibilities and their contributions.

#### Note: Please do not start coding your designs until you have read Section 6 in its entirety, and fully understand it. This section highlights common mistakes made in the past.
## 1.3 Learning Outcomes of Assignment
The learning objectives of Assignment are:

To enable the student to gain experience in digital logic design using VHDL
To introduce the student to prototyping digital logic in FPGAs
To familiarise the student with good practice in design management and effective collaboration in a shared group project
By the end of this lab students should be able to::

interpret a specification to design a digital system;
structure a design into modules and define module interfaces;
approach the testing and simulation of a design in a systematic manner;
use VHDL design entry to produce complex working systems;
use the Xilinx Vivado simulator to simulate and verify their work;
use Xilinx Vivado to prototype designs in FPGAs;
assess the performance of partners through peer assessment.
