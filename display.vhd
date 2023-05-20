library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
  Port(clk : in std_logic; an0 : out std_logic; an1 : out std_logic; an2 : out std_logic; an3 : out std_logic; c : out std_logic_vector (0 to 6); d0 : in std_logic_vector(0 to 3); d1 : in std_logic_vector(0 to 3); d2 : in std_logic_vector(0 to 3); d3 : in std_logic_vector(0 to 3));
end display;

architecture Behavioral of display is

component mux
    port(s_1 : in std_logic; s_2 : in std_logic; d0 : in std_logic_vector (0 to 3); d1 : in std_logic_vector (0 to 3);d2 : in std_logic_vector (0 to 3);d3 : in std_logic_vector (0 to 3); d: out std_logic_vector (0 to 3));
end component;

component decoder
  Port (d : in std_logic_vector(0 to 3); c : out std_logic_vector (0 to 6));
end component;
 
component timing_circuit
  Port (clk : in std_logic; slow_clock_1 : out std_logic; slow_clock_2 : out std_logic; an0 : out std_logic; an1 : out std_logic; an2 : out std_logic; an3 : out std_logic);
end component;

signal s_1 , s_2 : std_logic;
signal d : std_logic_vector (0 to 3);

begin

timing : timing_circuit port map (clk => clk, slow_clock_1 => s_1, slow_clock_2 => s_2, an0 => an0, an1 => an1, an2 => an2, an3 => an3);
m : mux port map (s_1 => s_1, s_2 => s_2, d0 => d0, d1 => d1, d2 => d2, d3 => d3, d => d);
dec : decoder port map (d => d, c => c);


end Behavioral;