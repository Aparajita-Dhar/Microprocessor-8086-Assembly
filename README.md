# 8086 Microprocessor Architecture & Assembly Language

This repository houses low-level academic programming implementations for the Intel 8086 processor architecture utilizing the EMU8086 simulator. Code modules focus on explicit CPU register utilization, instruction pipeline tracking, segmented memory routing, and hardware interrupt management.

##  Laboratory Module Index

### Phase 1: Register Interconnectivity & Arithmetic Logic
* **`01_data_transfer.asm`**
  * Evaluates system memory mapping through standard data transfer executions, exploring Immediate, Register, Direct, and Indirect Addressing modes.
* **`02_basic_arithmetic.asm`**
  * Tracks 8-bit and 16-bit basic math loops (Addition and Subtraction), monitoring data status updates via the CPU Flag Register.
* **`03_advanced_arithmetic.asm`**
  * Implements multi-byte Unsigned Multiplication (`MUL`) and Division (`DIV`), detailing accumulator data widening configurations across register links.
* **`04_logical_operations.asm`**
  * Demonstrates low-level bitwise bit manipulation masks (`AND`, `OR`, `XOR`) combined with geometric multiplication/division tracks via bit shifts (`SHL`, `SHR`).
    ### Phase 2: Flow Configurations & Hardware Interrupt Handling
* **`05_loops_and_conditionals.asm`**
  * Evaluates iterative code looping pipelines using the explicit `LOOP` instruction alongside flag-dependent conditional branching jumps (`JE`, `JNZ`).
* **`06_array_manipulation.asm`**
  * Processes block data arrays in system memory by incrementing index pointers (`SI`) to traverse and aggregate data elements directly.
* **`07_stack_and_procedures.asm`**
  * Employs structured code layouts via isolated functions (`PROC`), while tracking LIFO memory mechanics via system `PUSH` and `POP` hardware frames.
* **`08_hardware_interrupts.asm`**
  * Configures native terminal I/O communication maps, handling active string rendering, keyboard intercept routines, and character echo feeds via the DOS `INT 21H` system vector.
