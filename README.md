# FIFO Design & Verification

## Overview
This project implements and verifies a FIFO (First In First Out) memory using Verilog and SystemVerilog.

## Features
- FIFO depth: 4
- Data width: 8-bit
- Write operation
- Read operation
- Full and Empty flag handling

## Design (RTL)
The FIFO is implemented using registers with write and read pointers. Data is stored in a memory array and accessed sequentially.

## Verification
A SystemVerilog testbench is used to:
- Apply write and read operations
- Verify data integrity
- Check full and empty conditions
- Generate waveform output

## Tools Used
- Verilog
- SystemVerilog
- EDA Playground
- EPWave (Waveform Viewer)

## Waveform
![Waveform](waveform.png)

## Simulation Output
- Data written: 10, 20, 30, 40
- Data read: 10, 20, 30, 40

## Skills Demonstrated
- RTL Design
- Testbench Development
- Functional Verification
- Debugging & Waveform Analysis

## Author
Subba Raju Sarikonda
