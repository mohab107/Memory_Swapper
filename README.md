# Memory_Swapper
A simple memory swapper that swaps data between two memory locations using an FSM controller. The FSM handles reading, temporary storage, and writing to perform the swap operation. Useful for learning FSM-based memory control in digital design.

⚙️ FSM States

IDLE: Waits for swap signal

S0: Stores data from location A into memory[0]

S1: Copies data from location B to location A

S2: Copies data from memory[0] to location B


🔀 Control Signals

w: Selects between external data_w and internal data_r for memory input

sel: Controls two 4-to-1 MUXes for selecting read and write addresses


🧪 Testbench

Initializes memory[20:29] with values 20 to 29

Swaps contents of memory[22] and memory[28]

After swap: memory[22] = 28, memory[28] = 22

---

👨‍💻 Developed by: Mohab Elsayed
