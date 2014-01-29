# 281 Lab 1 Repo

## Truth Table

Step 1 in the process, start with a 3-bit number ABC and take the 2's compliment of that number to get the output XYZ. 

A | B | C | X | Y | Z
--- | --- | --- | --- | --- | ---
0 | 0 | 0 | 0 | 0 | 0
0 | 0 | 1 | 1 | 1 | 1
0 | 1 | 0 | 1 | 1 | 0
0 | 1 | 1 | 1 | 0 | 1
1 | 0 | 0 | 1 | 0 | 0
1 | 0 | 1 | 0 | 1 | 1
1 | 1 | 0 | 0 | 1 | 0
1 | 1 | 1 | 0 | 0 | 1

## Algebra
From the truth table it's much easier to create a Karnaugh Map (K-map). A picture of the three maps (on for each output) is shown below. 

![alt text](http://imgur.com/WO5yap6.jpg "Please ignore the mess in the lower right corner. Bonus algebra included in this picture.")

From the K-maps the algebra was very simple using the technique of circling ones on the chart. The simplified algebra equation for the 3-bit table is 

- X = A'B + A'C + AB'C'
- Y = BC' + B'C
- Z = C

## Circuit Implementation
Based on the derivation of the algebra, the circuit would require 6 AND gates and 2 OR gates (even though there are 3 OR signs in the algebra, one OR gate can have more than 2 inputs, as is the case in the equation for X). There is at least one NOT signal for each input signal, so the best starting point is to split each signal and NOT them. From there, the correct signals can be routed to their respective AND gates relatively easily. The outputs of the AND gates were then routed to their respective OR gates, the outputs of which were the outputs X and Y of the circuit. The only remaining step was to redirect a wire directly from C to output Z, which completed the circuit. The final design of the circuit is shown below. 

![alt text](http://i.imgur.com/UBpbdmX.jpg "Final circuit design for 3-bit.")

I took the liberty at this step to go ahead and write all of the extra signals that would be needed and keep track of how they would be assigned later. That way, I wouldn't lose track of any of the internal signals.

## Coding
Without taking the time to explain the code line-by-line, I'll breifly go through the three blocks of code that's used in VHDL editing.

#### Entity
This is the basic start point for the logic in VHDL. With Entity we create the "box" of the circuit, declaring inputs and outputs. The code for this section looks like this.
`entity Lab1_Kiernan is / Port ( A : in  STD_LOGIC;`
Here I declared A as an input under standard logic. The rest of the inputs and outputs follow the same format. 
#### Architecture
This is where any internal signals (not inputs or outputs) are declared. The code for this section looks like this.
`architecture Behavioral of Lab1_ Kiernan is / signal A_ N: STD_ LOGIC;`
Here I declared A_N as an internal signal, and I will define that signal later.
#### Program
This is where we actually assign and define signals using logic gates. I used the circuit shown above, with the signal declarations that were written on the side in order to define the circuit. The code for this section looks like this.
`A_N <= not A;`
Here I actually defined the signal A_N as A'. This is the format the rest of the code would take as well.

## Testbench
The next step was to create a testbench. This was a fairly simple process, especially given its almost identical circumstances to the testbench created in CE1. The best method to create the testbench was to copy-paste a lot of the code from CE1 into the testbench for Lab 1. The purpose of the code in the testbench was to simulate the circuit, giving inputs for A, B, and C, and watching the program for the outputs X, Y, and Z. If the circuit was correct, the waveform should correlate exactly to the truth table. 

The testbench lined up perfectly with the truth table I created for 2's compliment.
I also checked the table against itself: if I did the math right, the table should simply reverse itself at -4.

## 8-bit
The simpler of the ways to take the 2's complement of a number has 2 steps: invert every bit of the number, and add one to the inverted number. This was the better way to implement the circuit than the "copy until one" method. In order to create a circuit for this, 8 inputs and 8 outputs were needed. The coding followed much the same method as the 3-bit circuit, except it was impractical to create a truth table or testbench for an input that would have 256 possible numerical combinations. Instead, I jumped straight to the coding. The first step was to run every input through a NOT gate, effectively the same as inverting all the inputs, as is the first step of taking the 2's compliment. The next step was to add one to the number. For this step I used a simple adder logic gate setup extrapolated to 8 bits. I first declared an extra signal to be the value of '1'. Then I used an XOR gate with that value and the LSB of the inputs to return the LSB of the outputs. I then used an AND gate with the '1' value and the LSB of the inputs to create a carry value. From there I moved to the next bit, where I used the next bit in line (from LSB to MSB) and the carry value and ran the same 2 logic gates. I did this for all 8 bits, where the carry from the MSB was irrelevant and not addressed (can't output 9 bits with 8 LEDs). The output of this circuit should return the 8-bit 2's compliment of the 8-bit number input. After programming the circuit, the design worked in the in-class tested demo.

## FPGA Implementation
To implement the design on an FPGA, I created a .ucf file. The .ucf file assigns logic inputs to hard inputs. The codde for the .ucf file looks like this.
`NET "A" LOC = "G18"`
Here I assigned the logic input A to the switch G18 on the board. After the .ucf file was complete, all it took was a few instructor-directed clicks (I'll be honest, I don't know what I did here) to set up the board and send the code to the board. 

## Demos/Results
In-class demo of 3-bit lab completed and checked on 23 Jan.
In-class demo of 8-bit extra functionality completed and checked on 27 Jan.
