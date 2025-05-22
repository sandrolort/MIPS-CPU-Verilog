# MIPS CPU Hardware Implementation

This repository contains the hardware implementation of a MIPS CPU and its peripherals, developed as part of bachelor's and capstone projects at Kutaisi International University.

## Main MIPS CPU Implementation + LPDDR2 RAM

**Authors:** Sandro Lortkipanidze, Giorgi Bakradze, Lado Turmanidze  
**Advisor:** Prof. Dr. Wolfgang J. Paul

### Overview
A complete MIPS CPU implementation in Verilog, designed for the Altera Cyclone V FPGA board. The design closely follows the MIPS ISA specification and includes:

### Key Components
- **Core CPU Modules:** ALU, Arithmetic Unit, Shifter, Branch Condition Evaluation
- **Memory Systems:** 
  - On-chip SRAM (8KB)
  - External LPDDR2 RAM (512MB)
  - Memory controller with dual-memory support
- **Instruction Processing:** Complete decode, execute, and writeback
- **Interrupt Support:** Hardware interrupt handling with special purpose registers (Not yet merged!)
- **Register File:** 32-register general-purpose register file

### Memory Architecture
- **SRAM:** Fast access for boot code and frequently used data (first 4KB)
- **LPDDR2:** Large capacity storage for main memory operations
- **Memory Mapping:** Automatic switching between memory types based on address

### Testing & Validation
The CPU has been extensively tested with:
- Multiplication and division algorithms
- Bubble sort implementation
- Signal Tap logic analyzer for hardware debugging
- Both simulation and on-board testing

## SD Card Disk Extension

**Author:** Demetre Lataria  
**Advisor:** Prof. Dr. Wolfgang J. Paul

### Overview
An extension to the main MIPS CPU that adds persistent storage capability using SD card flash memory.

### Features
- **SPI Protocol Interface:** Communication with micro SD cards
- **Page Memory System:** 8KB on-chip SRAM acting as disk buffer
- **Disk Driver:** Hardware abstraction layer matching MIPS disk specification
- **State Machine:** Handles read/write operations to SD card blocks
- **Register Interface:** SPAR (Swap Page Address Register) and CMSR (Command Status Register)

### Technical Details
- **Block Size:** 512 bytes per SD card block
- **Page Mapping:** 8 consecutive SD blocks map to one 4KB page
- **Interface:** Memory-mapped I/O following standard disk specification
- **Clock Requirements:** 50MHz with 90-degree phase shift for SD operations

## Getting Started

### Requirements
- Altera Quartus Prime
- Cyclone V FPGA development board
- Micro SD card (for disk extension)
- ModelSim (for simulation)

### Project Structure
```
hdl/
├── parts/
│   ├── decode/     # Instruction decoding
│   ├── execute/    # ALU and execution units  
│   ├── memory/     # Memory controllers
│   └── writeback/  # Register writeback
├── interfaces/     # Inter-stage communication
└── utility/        # Helper modules
```

## References
- [1] Wolfgang J. Paul et al. "System Architecture: An Ordinary Engineering Discipline" (Springer, 2016)
- [2] GitHub Repository: https://github.com/sandrolort/MIPS-CPU-Verilog

This implementation provides a solid foundation for computer architecture education and can be extended with additional features like memory management units and operating system support. These changes are in progress.
