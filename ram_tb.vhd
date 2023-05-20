LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY tb_ROM_block IS
END tb_ROM_block;
ARCHITECTURE behavior OF tb_ROM_block IS


COMPONENT blk_mem_gen_2
PORT(
clka : IN STD_LOGIC;
addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
dina : in std_logic_vector(7 downto0);
ena : in std_logic;
wea : in std_logic_vector(0 downto 0);
);
END COMPONENT;


--Inputs
signal clock : std_logic := '0';
signal rdaddress : std_logic_vector(13 downto 0) := (others => '0');
--Outputs
signal data : std_logic_vector(7 downto 0) := (others => '0');
-- Clock period definitions
constant clock_period : time := 10 ns;
signal i: integer;
signal ena : std_logic_vector (0 downto 0) := "0";
signal wea : std_logic := '0';
signal wea :
BEGIN
-- Read image in VHDL
uut: blk_mem_gen_2 PORT MAP (
clka => clock,
douta => data,
addra => rdaddress, 
dina => dina, 
ena => ena, 
wea => wea
);
-- Clock process definitions
clock_process :process
begin
clock <= '0';
wait for clock_period/2;
clock <= '1';
wait for clock_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
for i in 0 to 16383 loop
rdaddress <= std_logic_vector(to_unsigned(i, 14));
wait for 20 ns;
end loop;
wait;
end process;
END;