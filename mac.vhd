----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2022 03:27:18 PM
-- Design Name: 
-- Module Name: mac - Behavioral
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

entity mac is
  Port (n1, n2 : in std_logic_vector (7 downto 0); output : out std_logic_vector (15 downto 0); clk : in std_logic; add : in std_logic; cntrl : in std_logic);
end mac;

architecture Behavioral of mac is

signal sum : std_logic_vector (15 downto 0);

begin

process(clk)
begin 
if rising_edge(clk) then 
if cntrl = '1' then
    sum <= "0000000000000000";
elsif add = '1' then
    sum <= std_logic_vector((unsigned(n1) * unsigned(n2)) + unsigned(sum));
--    add <= '0';
end if;
end if;
end process; 

output <= sum;

end Behavioral;
