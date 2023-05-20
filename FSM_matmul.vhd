library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM_matmul is
  Port (clk : in std_logic; cathodes_7 : out std_logic_vector(6 downto 0); anodes_4 : out std_logic_vector(3 downto 0); switches : in std_logic_vector(13 downto 0));
end FSM_matmul;

architecture Behavioral of FSM_matmul is

type state_type is (COMPUTE , READ );
signal current_state : state_type := COMPUTE;
signal next_state : state_type := READ;


COMPONENT dist_mem_gen_0
PORT(clk : IN STD_LOGIC; a : IN STD_LOGIC_VECTOR(13 DOWNTO 0); spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

COMPONENT dist_mem_gen_1
PORT(clk : IN STD_LOGIC; a : IN STD_LOGIC_VECTOR(13 DOWNTO 0); spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

COMPONENT dist_mem_gen_2
PORT(clk : IN STD_LOGIC; a : IN STD_LOGIC_VECTOR(13 DOWNTO 0); d : IN STD_LOGIC_VECTOR(15 DOWNTO 0); spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); we : in std_logic);
END COMPONENT;

COMPONENT display
Port(clk : in std_logic; an0 : out std_logic; an1 : out std_logic; an2 : out std_logic; an3 : out std_logic; c : out std_logic_vector (0 to 6); d0 : in std_logic_vector(0 to 3); d1 : in std_logic_vector(0 to 3); d2 : in std_logic_vector(0 to 3); d3 : in std_logic_vector(0 to 3));
end component ;


signal accumulator : std_logic_vector(15 downto 0) ;
signal num1 : std_logic_vector(7 downto 0);
signal num2 : std_logic_vector(7 downto 0);
signal we : std_logic := '0' ;
signal FSM_variable : integer:=0 ;
signal ad2:std_logic_vector(13 downto 0);
signal stop : std_logic:='0' ;

signal clock_counter : std_logic_vector(12 downto 0) ;
signal final_output : std_logic_vector(15 downto 0);
signal address : std_logic_vector(13 downto 0) ;
signal rom_address1 : std_logic_vector(13 downto 0) ;
signal rom_address2 : std_logic_vector(13 downto 0);

begin

disp1 : display port map( clk => clk , c(0)=> cathodes_7(0),c(1)=> cathodes_7(1),c(2)=> cathodes_7(2),c(3)=> cathodes_7(3),c(4)=> cathodes_7(4),c(5)=> cathodes_7(5),c(6)=> cathodes_7(6), an0 => anodes_4(0) , an1 => anodes_4(1) , an2 => anodes_4(2) , an3 => anodes_4(3) , d0 => final_output(3 downto 0) , d1 => final_output(7 downto 4) , d2 => final_output(11 downto 8) , d3 => final_output(15 downto 12) ) ; 

rom1 : dist_mem_gen_0 port map (clk => clk ,a => rom_address1, spo => num1) ;
rom2 : dist_mem_gen_1 port map (clk => clk ,a => rom_address2, spo => num2) ;
ram : dist_mem_gen_2 port map (clk => clk ,a => ad2, we=> we , d=> accumulator ,spo => final_output) ;


process(clk)
begin
if rising_edge(clk) then
   clock_counter <= clock_counter+'1';
end if;

end process;

process(clk)
begin
if rising_edge(clk) then
if stop = '0' then
ad2 <= address;
else
ad2 <= switches;
end if;
end if;
end process;


process(clock_counter(3))
begin
if rising_edge(clock_counter(3)) then
if stop = '0' then
if FSM_variable = 255 then
we <=  '1' ;
FSM_variable <= FSM_variable  + 1 ;

elsif FSM_variable = 256 then
we <='0' ;
FSM_variable <= FSM_variable + 1 ;

elsif FSM_variable = 257 then
if address ="11111111111111" then
stop <= '1'  ;
rom_address1<="00000000000000";
rom_address2<="00000000000000";
FSM_variable<=0;
accumulator<="0000000000000000";
address<="00000000000000";
end if ;
FSM_variable <= FSM_variable + 1 ;

elsif FSM_variable = 258 then
accumulator<="0000000000000000";
address <= address + '1' ;
FSM_variable <= FSM_variable + 1 ;

elsif FSM_variable = 259 then
rom_address1(0)<='0';
rom_address1(1)<='0';
rom_address1(2)<='0';
rom_address1(3)<='0';
rom_address1(4)<='0';
rom_address1(5)<='0';
rom_address1(6)<='0';
rom_address1(7) <= address(7) ;
rom_address1(8) <= address(8) ;
rom_address1(9) <= address(9) ;
rom_address1(10) <= address(10) ;
rom_address1(11) <= address(11) ;
rom_address1(12) <= address(12) ;
rom_address1(13) <= address(13) ;


rom_address2(0) <= address(0) ;
rom_address2(1) <= address(1) ;
rom_address2(2) <= address(2) ;
rom_address2(3) <= address(3) ;
rom_address2(4) <= address(4) ;
rom_address2(5) <= address(5) ;
rom_address2(6) <= address(6) ;
rom_address2(7)<='0';
rom_address2(8)<='0';
rom_address2(9)<='0';
rom_address2(10)<='0';
rom_address2(11)<='0';
rom_address2(12)<='0';
rom_address2(13)<='0';

FSM_variable <=0  ;
elsif (FSM_variable rem 2) = 0 then
accumulator <= accumulator + std_logic_vector(unsigned(num1)*unsigned(num2)) ;
current_state <= COMPUTE ;
next_state <= READ ;
FSM_variable <= FSM_variable + 1 ;
elsif (FSM_variable rem 2) = 1 then
current_state <= READ ; 
next_state <= COMPUTE ;
rom_address1 <= rom_address1 + '1';
rom_address2 <= rom_address2 + "00000010000000";
FSM_variable <= FSM_variable + 1 ;
end if ;
end if ;
end if ;
end process ;

end Behavioral;