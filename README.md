
# Avalon Bus Integration with ModelSim Simulations and Static Timing Analysis

## Project Overview
This project provides a comprehensive guide and implementation code for integrating the Avalon bus in FPGA designs, utilizing ModelSim for simulations and performing static timing analysis (STA). The project also demonstrates how to use this integration as a custom component within Platform Designer (formerly Qsys) in Intel Quartus Prime software.

## Features
- **Avalon Bus Implementation:** Detailed code and instructions for integrating the Avalon bus interface in your FPGA design.
- **ModelSim Simulations:** Scripts and configurations for simulating the design using ModelSim, ensuring correct functionality and performance.
- **Static Timing Analysis (STA):** Guidelines and scripts for performing static timing analysis to verify timing constraints and optimize the design.
- **Platform Designer Integration:** Steps to create a custom component that can be used within Platform Designer, allowing for easy reuse and integration into larger systems.

## About the project
Aavalon Bus is a comunication protocol necesary to interact with diferents integrate on internal chip, this project burn by the necesity of implement own custom
logic on quartus platform designer, and tranfer data in syncronous way from FPGA custom logic desing to FPGA resources such as NIOS II procesor, On chip RAM
external ddr3 RAM etc. 


## Getting Started
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/ReyesMisael/Avalon_Bus_MM.git
