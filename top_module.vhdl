library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity gcd is
    Port ( clk : in std_logic;
           buttongo: in std_logic;
           num1 : in STD_LOGIC_VECTOR (7 downto 0);
           num2 : in STD_LOGIC_VECTOR (7 downto 0);
           gcd : out STD_LOGIC_VECTOR (7 downto 0));
end gcd;

architecture Behavioral of gcd is

signal Q1: std_logic_vector (7 downto 0):="00000000";
signal Q2: std_logic_vector (7 downto 0):="00000000";
signal D1: std_logic_vector (7 downto 0):="00000000";
signal D2: std_logic_vector (7 downto 0):="00000000";
signal finish : std_logic:='0';
signal reset: std_logic:='0';
signal load: std_logic:='0';
signal flag: std_logic:='0';
signal control: std_logic_vector (1 downto 0):="00";
begin

D1 <= num1 when Q1 = "00000000" and Q2="00000000" else 
   Q1-Q2 when Q1>Q2 else
   Q1; 
D2 <= num2 when Q1 = "00000000" and Q2="00000000" else 
   Q2-Q1 when Q2>Q1 else
   Q2; 
finish <= '1' when Q1=Q2 and q1 /= "00000000" else '0';

process(buttongo)
begin 
if (buttongo ='1' and flag='0') then
load<='1';
reset<='0';
flag <= '1';
elsif (buttongo ='1' and flag='1') then
load<='0';
reset<='1';
flag <= '0';

end if;
end process;
process(clk)
begin
 if (rising_edge(clk)) then
 if (reset = '1') then
 Q1 <= "00000000";
 elsif (load = '1') then
 Q1 <= D1;
 end if;
 end if;
end process;
process(clk)
begin
 if (rising_edge(clk)) then
 if (reset = '1') then
 Q2 <= "00000000";
 elsif (load = '1') then
 Q2 <= D2;
 end if;
 end if;
end process;
gcd<=Q1 when finish = '1'else "00000000";

end Behavioral;
