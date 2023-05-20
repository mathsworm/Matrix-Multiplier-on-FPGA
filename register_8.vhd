----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11/06/2022 10:01:06 PM
-- Design Name:
-- Module Name: register_8 - Behavioral
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

entity register_8 is
  Port (din : in std_logic_vector(0 to 7); clk,we,re : in std_logic; dout : out std_logic_vector(0 to 7));
end register_8;

architecture Behavioral of register_8 is

--signal temp : std_logic_vector (0 to 7);

begin
process(clk)
begin

if rising_edge(clk) then
    if re = '1' then
    dout <= "00000000";
    
    elsif we = '1' then
    dout <= din;
    end if;
end if;
end process;


end Behavioral;