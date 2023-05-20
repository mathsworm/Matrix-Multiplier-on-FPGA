----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2022 03:46:26 PM
-- Design Name: 
-- Module Name: mac_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac_tb is
--  Port ( );
end mac_tb;

architecture Behavioral of mac_tb is

component mac
  Port (n1, n2 : in std_logic_vector (0 to 7); output : out std_logic_vector (0 to 15); cntrl, clk : in std_logic; add : in std_logic);
end component;

signal n1,n2 : std_logic_vector (0 to 7);
signal output : std_logic_vector (0 to 15);
signal clk, cntrl, add : std_logic;

begin

clock_process : process
begin 
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;

UUT: mac port map (n1 => n1, n2 => n2, output => output, add => add, cntrl => cntrl, clk => clk);

n1 <= "00000001", "00000010" after 14 ns,"00001000" after 16 ns;
n2 <= "00000001", "00000010" after 8 ns;
cntrl <= '1', '0' after 11 ns;
add <= '1','0' after 50 ns;

end Behavioral;
