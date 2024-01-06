library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sim is
--  Port ( );
end sim;

architecture Behavioral of sim is
component gcd is
    Port ( clk : in std_logic;
           buttongo: in std_logic;
           num1 : in STD_LOGIC_VECTOR (7 downto 0);
           num2 : in STD_LOGIC_VECTOR (7 downto 0);
           gcd : out STD_LOGIc_VECTOR (7 downto 0));
end component;
signal clk: std_logic;
signal num1: std_logic_vector (7 downto 0):="00000000";
signal num2: std_logic_vector (7 downto 0):="00000000";
signal gcdo: std_logic_vector (7 downto 0):="00000000";
signal buttongo: std_logic:='0';
begin
uut : gcd port map(clk=>clk,num1=>num1,num2=>num2,gcd=>gcdo,buttongo=>buttongo);
clock: process
begin
clk<='0';
wait for 0.1 ns ;
clk <='1';
wait for 0.1 ns ;
end process;
test : process
begin
num1 <= "10001100";
num2 <= "00001100";
buttongo <='1';
wait for 0.01ns;
buttongo <='0';
wait for 50 ns;
buttongo <='1';
wait for 0.01ns;
buttongo <='0';
wait for 1ns;
buttongo <='1';
wait for 0.01ns;
buttongo <='0';

num1 <= "00001001";
num2 <= "00000011";
wait for 100 ns;
buttongo <='1';
wait for 0.01ns;
buttongo <='0';
wait for 1 ns;

end process;
end Behavioral;
