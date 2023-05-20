library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timing_circuit is

  Port (clk : in std_logic; slow_clock_1 : out std_logic; slow_clock_2 : out std_logic; an0 : out std_logic; an1 : out std_logic; an2 : out std_logic; an3 : out std_logic);
  
end timing_circuit;

architecture Behavioral of timing_circuit is

signal counter_1 : integer := 1;
signal temp_1 : std_logic := '0';
signal counter_2 : integer := 1;
signal temp_2 : std_logic := '0';

begin

process(clk)
begin
if (clk'event and clk = '1') then 
counter_1 <= counter_1 + 1;
if (counter_1 = 200000) then 
temp_1 <= not temp_1;
counter_1 <= 1;
end if;
end if;
slow_clock_1 <= temp_1;
end process;

process(clk)
begin
if (clk'event and clk = '1') then 
counter_2 <= counter_2 + 1;
if (counter_2 = 400000) then 
temp_2 <= not temp_2;
counter_2 <= 1;
end if;
end if;
slow_clock_2 <= temp_2;
end process;

an0 <= temp_1 or temp_2;
an1 <= not temp_1 or temp_2;
an2 <= not temp_1 or not temp_2;
an3 <= temp_1 or not temp_2;

end Behavioral;