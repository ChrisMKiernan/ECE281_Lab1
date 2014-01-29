----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Chris Kiernan
-- 
-- Create Date:    22:43:00 01/22/2014 
-- Design Name: 
-- Module Name:    Lab1_Kiernan - Behavioral 
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

entity Lab1_Kiernan is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end Lab1_Kiernan;

architecture Behavioral of Lab1_Kiernan is

signal A_N, B_N, C_N, D, E, F, G, H, I: STD_Logic;

begin

A_N <= not A;
B_N <= not B;
C_N <= not C;
D <= A_N and B;
E <= A_N and C;
F <= A and B_N;
G <= F and C_N;
H <= B and C_N;
I <= C and B_N;
X <= D or E or G;
Y <= H or I;
Z <= C;

end Behavioral;

