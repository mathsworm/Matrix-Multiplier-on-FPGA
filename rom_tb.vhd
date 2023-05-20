----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11/11/2022 12:22:05 PM
-- Design Name:
-- Module Name: rom_tb - Behavioral
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

entity rom_tb is

end rom_tb;

architecture Behavioral of rom_tb is
component dist_mem_gen_0
port (a : in std_logic_vector(13 downto 0);
       clk : in std_logic;
       spo : out std_logic_vector(7 downto 0));
end component;
signal add : std_logic_vector(13 downto 0):=(others=>'0');
signal outp : std_logic_vector(7 downto 0);
signal clk : std_logic;
begin
add<="00000000000101" after 20 ns;

DUT : dist_mem_gen_0 port map(a=>add,clk=>clk,spo=>outp);
clock_process : process
begin
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;

end process;
end Behavioral;