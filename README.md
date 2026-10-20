# Verilog Combinational and Sequential Circuits

A beginner-friendly collection of combinational and sequential digital circuits designed and simulated using **Verilog HDL**. Each circuit includes RTL design code, a testbench, and waveform evidence from simulation.

## Project Overview

This project explores basic digital logic design and sequential circuit behavior through RTL coding and simulation.

### Circuits Implemented

| Circuit | Type | Description | Verification |
|---|---|---|---|
| 4-bit Adder/Subtractor | Combinational | Performs 4-bit addition and subtraction using a mode control input. The 5-bit result accommodates carry-out and represents subtraction results in two's-complement form. | Tested addition and subtraction cases, including overflow/carry and negative results. |
| 4-to-1 Multiplexer | Combinational | Selects one of four 1-bit inputs based on a 2-bit select signal. | Verified all four select combinations. |
| 4-bit Synchronous Up-Counter | Sequential | Increments its 4-bit count on each rising clock edge, with an asynchronous active-high reset. | Verified reset behavior and counting through rollover. |
| 101 Sequence Detector | Sequential | Detects the serial bit pattern `101` in an input stream and supports overlapping detections. | Tested a serial input sequence and observed detection pulses in simulation. |

## Tools Used

- **Verilog HDL** — RTL design
- **EDA Playground** — writing and running simulations
- **Icarus Verilog** — Verilog simulator
- **EPWave** — viewing simulation waveforms

## Repository Structure

```text
.
├── README.md
├── combinational/
│   ├── adder_subtractor_4bit/
│   │   ├── design.v
│   │   ├── testbench.v
│   │   └── waveform.png
│   └── mux4to1/
│       ├── design.v
│       ├── testbench.v
│       └── waveform.png
└── sequential/
    ├── counter_4bit/
    │   ├── design.v
    │   ├── testbench.v
    │   └── waveform.png
    └── sequence_detector_101/
        ├── design.v
        ├── testbench.v
        └── waveform.png
```

## Simulation and Verification

Each circuit has a dedicated testbench to apply inputs and check its behavior. Simulation waveforms are included as visual evidence of the tested operation.

To run a circuit:

1. Open [EDA Playground](https://www.edaplayground.com/).
2. Copy the circuit's `design.v` into the design pane.
3. Copy its `testbench.v` into the testbench pane.
4. Select **Icarus Verilog** as the simulator.
5. Enable waveform dumping if needed, then run the simulation.
6. View the generated waveform in EPWave.

## Learning Outcomes

- Writing combinational RTL using Verilog
- Understanding clocked sequential logic and reset behavior
- Designing and testing counters and finite-state-machine-based sequence detectors
- Creating testbenches and inspecting simulation waveforms
- Practicing a basic RTL design and simulation workflow

> **Scope:** This repository demonstrates educational RTL design and simulation. It does not claim synthesis, FPGA implementation, ASIC tape-out, or silicon validation.
