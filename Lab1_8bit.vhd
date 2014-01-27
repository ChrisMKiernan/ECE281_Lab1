----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Chris Kiernan
-- 
-- Create Date:    10:39:43 01/27/2014 
-- Design Name: Lab1_8bit
-- Module Name:    Lab1_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab1_8bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           F : in  STD_LOGIC;
           G : in  STD_LOGIC;
           H : in  STD_LOGIC;
           A_O : out  STD_LOGIC;
           B_O : out  STD_LOGIC;
           C_O : out  STD_LOGIC;
           D_O : out  STD_LOGIC;
           E_O : out  STD_LOGIC;
           F_O : out  STD_LOGIC;
           G_O : out  STD_LOGIC;
           H_O : out  STD_LOGIC);
end Lab1_8bit;

architecture Behavioral of Lab1_8bit is

signal A_N, B_N, C_N, D_N, E_N, F_N, G_N, H_N, C1, C2, C3, C4, C5, C6, C7, X: STD_LOGIC;

begin

X <= '1';
A_N <= not A;
B_N <= not B;
C_N <= not C;
D_N <= not D;
E_N <= not E;
F_N <= not F;
G_N <= not G;
H_N <= not H;
H_O <= X xor H_N;
C1 <= X and H_N;
G_O <= C1 xor G_N;
C2 <= C1 and G_N;
F_O <= C2 xor F_N;
C3 <= C2 and F_N;
E_O <= C3 xor E_N;
C4 <= C3 and E_N;
D_O <= C4 xor D_N;
C5 <= C4 and D_N;
C_O <= C5 xor C_N;
C6 <= C5 and C_N;
B_O <= C6 xor B_N;
C7 <= C6 and B_N;
A_O <= C7 xor A_N;

end Behavioral;

