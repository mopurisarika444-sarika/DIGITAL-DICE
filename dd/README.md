# Digital Dice using Verilog HDL

## 📌 Project Overview

This project implements a **Digital Dice** using Verilog HDL.

A digital dice is an electronic version of a conventional six-sided dice. Instead of using physical dice, the system generates a value from **1 to 6** using digital logic.

When the `roll` input is activated, the internal counter rapidly cycles through the six possible dice values. After a short rolling period, one value is selected and stored as the dice result.

The project includes the RTL design, testbench, simulation waveform, and documentation.

---

## 🎯 Objectives

The objectives of this project are:

* To design a digital dice using Verilog HDL.
* To generate valid dice values from 1 to 6.
* To implement a rolling mechanism using a digital counter.
* To provide a reset function.
* To verify the design using a testbench.
* To generate and analyze simulation waveforms.
* To demonstrate the project using GitHub.

---

## ⚙️ Features

* Six possible dice values: **1–6**
* Roll input
* Reset input
* Internal counter
* Automatic rolling period
* Digital output
* Verilog RTL implementation
* Testbench included
* VCD waveform generation
* GTKWave simulation support

---

## 🧩 Block Diagram

```text
                     ┌──────────────────┐
                     │                  │
       CLK ─────────>|                  │
                     │                  │
     RESET ─────────>|  Digital Dice    │
                     │                  │
      ROLL ─────────>|    Controller    │
                     │                  │
                     └────────┬─────────┘
                              │
                              ▼
                     ┌──────────────────┐
                     │  Counter 1 to 6  │
                     └────────┬─────────┘
                              │
                              ▼
                     ┌──────────────────┐
                     │  Dice Value      │
                     │     1 to 6       │
                     └──────────────────┘
```

---

## 🧠 Working Principle

The digital dice uses a counter that continuously cycles through six values:

```text
1 → 2 → 3 → 4 → 5 → 6 → 1 → ...
```

When the `roll` input is activated, the system enters the rolling state.

During the rolling period, the counter continues to change. At the end of the rolling period, the current counter value is stored as the dice result.

Therefore, the output can only contain one of the following values:

```text
1
2
3
4
5
6
```

Values `0` and `7` are not valid dice results.

---

## 🎲 Dice Value Encoding

The output is a 3-bit binary value.

| Dice Value | Binary Output |
| ---------: | ------------: |
|          1 |         `001` |
|          2 |         `010` |
|          3 |         `011` |
|          4 |         `100` |
|          5 |         `101` |
|          6 |         `110` |

---

## 🔌 Module Interface

### `digital_dice`

| Signal       | Direction |  Width | Description             |
| ------------ | --------- | -----: | ----------------------- |
| `clk`        | Input     |  1 bit | System clock            |
| `reset`      | Input     |  1 bit | Active-high reset       |
| `roll`       | Input     |  1 bit | Starts dice rolling     |
| `dice_value` | Output    | 3 bits | Dice result from 1 to 6 |

---

## 📁 Project Structure

```text
digital-dice/
│
├── README.md
│
├── rtl/
│   └── digital_dice.v
│
├── tb/
│   └── digital_dice_tb.v
│
├── simulation/
│   ├── digital_dice.vcd
│   └── waveform.png
│
└── docs/
    └── block_diagram.png
```

---

## 🛠️ Tools Used

* **Verilog HDL**
* **Icarus Verilog**
* **GTKWave**
* **Git**
* **GitHub**

---

## 🧪 Verification

The design is verified using a Verilog testbench.

The testbench performs multiple dice rolls and monitors:

* Clock
* Reset
* Roll input
* Internal counter
* Rolling state
* Dice output

Several roll operations are performed to demonstrate that the output remains within the valid range of **1 to 6**.

---

## ▶️ Simulation

### Step 1 — Compile

From the project root:

```bash
iverilog -o dice_sim rtl/digital_dice.v tb/digital_dice_tb.v
```

### Step 2 — Run

```bash
vvp dice_sim
```

The simulation generates:

```text
digital_dice.vcd
```

### Step 3 — Open the waveform

```bash
gtkwave digital_dice.vcd
```

Add the following signals:

```text
clk
reset
roll
uut.counter
uut.rolling
dice_value
```

Take a screenshot of the waveform and save it as:

```text
simulation/waveform.png
```

---

## 📊 Expected Simulation Result

After reset, the dice value is initialized to:

```text
1
```

When the roll signal is activated, the internal counter cycles through:

```text
1 → 2 → 3 → 4 → 5 → 6 → ...
```

After the rolling period, the selected value is stored in `dice_value`.

Example simulation results could be:

```text
Roll 1 → 3
Roll 2 → 6
Roll 3 → 2
Roll 4 → 5
```

The exact sequence depends on the counter timing.

---

## 📈 Simulation Waveform

The waveform should demonstrate:

```text
CLK       ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
          └─┘ └─┘ └─┘ └─┘ └─┘

ROLL      ____████________________

COUNTER   1 2 3 4 5 6 1 2 3 4 5 6

ROLLING   ____██████████__________

DICE      001──────────────────011
```

During rolling, the internal counter changes continuously. Once rolling finishes, the final value is held in the dice output.

---

## 🔄 Reset Behavior

When `reset = 1`:

```text
counter    = 1
rolling    = 0
dice_value = 1
```

This initializes the system to a known state.

---

## 🎯 Applications

The concept can be used in:

* Digital games
* FPGA-based games
* Electronic dice
* Random number demonstrations
* Digital logic laboratories
* Educational FPGA projects
* Embedded gaming systems

---

## 🔮 Future Improvements

The project can be extended with:

* Seven-segment display output
* LED dice display
* Push-button debouncing
* Better pseudo-random number generation
* FPGA board implementation
* Multiple dice
* Dice rolling animation
* Seven-segment display for values 1–6
* Randomness based on an asynchronous event or timer
* Sound or buzzer indication

---

## ⚠️ Note on Randomness

This basic implementation uses a continuously cycling counter rather than a cryptographically random-number generator.

The changing counter value provides a simple demonstration of electronic dice behavior. For a more realistic random dice implementation, an **LFSR or another pseudo-random number generator** can be used.

---

## 👨‍💻 Author

**Your Name**

### Project Title

**Digital Dice using Verilog HDL**

This project demonstrates RTL design, sequential logic, testbench-based verification, and digital simulation using Verilog HDL.

---

## 📜 License

This project is intended for **educational and academic purposes**.
