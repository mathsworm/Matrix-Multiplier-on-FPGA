----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 03:58:29 PM
-- Design Name: 
-- Module Name: register_8_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_8_tb is
--  Port ( );
end register_8_tb;

architecture Behavioral of register_8_tb is


component register_8
  Port (din : in std_logic_vector(0 to 7); clk,we,re : in std_logic; dout : out std_logic_vector(0 to 7));
end component;

signal clk,we,re : std_logic;
signal din,dout : std_logic_vector(0 to 7);

begin

clk <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns;
din <= "00000001", "00000010" after 12 ns;
we <= '0', '1' after 3 ns;
re <= '0', '1' after 17 ns;

end Behavioral;
