library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
  Port (d : in std_logic_vector(0 to 3); c : out std_logic_vector (0 to 6));
end decoder;

architecture Behavioral of decoder is

begin


c(0) <=  ((not (d(0)) and not (d(1)) and not (d(2)) and d(3)) or (not (d(0)) and d(1) and not (d(2)) and not (d(3))) or (d(0) and not (d(1)) and d(2) and d(3)) or (d(0) and d(1) and not (d(2)) and d(3)));
c(1) <=  ((not (d(0)) and d(1) and not (d(2)) and d(3)) or (d(1) and d(2) and not (d(3))) or (d(0) and d(2) and d(3)) or (d(0) and d(1) and not (d(3))));
c(2) <=  ((not (d(0)) and not (d(1)) and d(2) and not (d(3))) or (d(0) and d(1) and not (d(3))) or (d(0) and d(1) and d(2)));
c(3) <=  ((not (d(0)) and not (d(1)) and not (d(2)) and d(3)) or (not (d(0)) and d(1) and not (d(2)) and not (d(3))) or (d(1) and d(2) and d(3)) or (d(0) and not (d(1)) and d(2) and not (d(3))));
c(4) <=  ((not (d(0)) and d(3)) or (not (d(0)) and d(1) and not (d(2))) or (not (d(1)) and not (d(2)) and d(3)));
c(5) <=  ((not (d(0)) and not (d(1)) and d(3)) or (not (d(0)) and not (d(1)) and d(2)) or (not (d(0)) and d(2) and d(3)) or (d(0) and d(1) and not (d(2)) and d(3)));
c(6) <=  ((not (d(0)) and not (d(1)) and not (d(2))) or (not (d(0)) and d(1) and d(2) and d(3)) or (d(0) and d(1) and not (d(2)) and not (d(3))));
end Behavioral;