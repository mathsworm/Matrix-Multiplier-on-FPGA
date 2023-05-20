library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
port(s_1 : in std_logic; s_2 : in std_logic; d0 : in std_logic_vector (0 to 3); d1 : in std_logic_vector (0 to 3);d2 : in std_logic_vector (0 to 3);d3 : in std_logic_vector (0 to 3); d: out std_logic_vector (0 to 3));
end mux;

architecture Behavioral of mux is

begin

d(0) <= (not s_1 and not s_2 and d0(0)) or (s_1 and not s_2 and d1(0)) or (s_1 and s_2 and d2(0)) or (not s_1 and s_2 and d3(0));
d(1) <= (not s_1 and not s_2 and d0(1)) or (s_1 and not s_2 and d1(1)) or (s_1 and s_2 and d2(1)) or (not s_1 and s_2 and d3(1));
d(2) <= (not s_1 and not s_2 and d0(2)) or (s_1 and not s_2 and d1(2)) or (s_1 and s_2 and d2(2)) or (not s_1 and s_2 and d3(2));
d(3) <= (not s_1 and not s_2 and d0(3)) or (s_1 and not s_2 and d1(3)) or (s_1 and s_2 and d2(3)) or (not s_1 and s_2 and d3(3));


end Behavioral;