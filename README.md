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
X = A'B + A'C + AB'C'
Y = BC' + B'C
Z = C

## Circuit Implementation
Based on the derivation of the algebra, the circuit would require 6 AND gates and 2 OR gates (even though there are 3 OR signs in the algebra, one OR gate can have more than 2 inputs, as is the case in the equation for X). There is at least one NOT signal for each input signal, so the best starting point is to split each signal and NOT them. From there, the correct signals can be routed to their respective AND gates relatively easily. The outputs of the AND gates were then routed to their respective OR gates, the outputs of which were the outputs X and Y of the circuit. The only remaining step was to redirect a wire directly from C to output Z, which completed the circuit. The final design of the circuit is shown below. 
![alt text](http://i.imgur.com/UBpbdmX.jpg "Final circuit design for 3-bit.")

I took the liberty at this step to go ahead and write all of the extra signals that would be needed and keep track of how they would be assigned later. That way, I wouldn't lose track of any of the internal signals.

## Coding
Will edit this after a quick commit test.__

## Results
The testbench lined up perfectly with the truth table I created for 2's compliment.
I also checked the table against itself: if I did the math right, the table should simply reverse itself at -4.

## Demo
In-class demo of 3-bit lab completed and checked on 23 Jan.
In-class demo of 8-bit extra functionality completed and checked on 27 Jan.
