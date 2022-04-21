-----------------------------------------------------------------------------------------
-- Modulen Exercise2_tb används som testbänk för modulen Exercise2_tb, som består av 
-- fyra insignaler switch[3:0] samt fyra utsignaler led[3:0]. Sanningstabellen för 
-- modulen Exercise2 visas nedan:
--
-- switch[3:0]       led[3:0]
--    0000             0000
--    0001             1000
--    001x             0100
--    01xx             0010
--    1xxx             0001
--
-- I denna testbänk deklareras signaler med samma namn som toppmodulens I/O-portar. 
-- Varje kombination av insignaler switch[3:0] testas en efter en under 10 ns, där 
-- utsignaler led[3:0] kontrolleras via simulering i ModelSim.
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity Exercise2_tb is
end entity;
 
architecture Behaviour of Exercise2_tb is
 
---------------------------------------------------------------------------------
-- Deklarerar toppmodulen Exercise2 för att kunna skapa en instans av denna,
-- vilket möjliggör sammankoppling av dess I/O-portar med simulerade signaler 
-- med samma namn för simulering.
---------------------------------------------------------------------------------
component Exercise2 is
   port
   (
       switch : in std_logic_vector(3 downto 0);
       led    : out std_logic_vector(3 downto 0)
   );
end component;
 
signal switch : std_logic_vector(3 downto 0); -- Simulerade insignaler.
signal led    : std_logic_vector(3 downto 0); -- Simulerade utsignaler.
 
begin
 
   ---------------------------------------------------------------------------------
   -- Sammankopplar toppmodulens I/O-portar med signaler med samma namn i testbänken
   -- för simulering via port mapping. En instans av toppmdolen Exercise2 döpt
   -- Exercise2_instance deklareras för att möjliggöra sammankopplingen.
   ---------------------------------------------------------------------------------
   Exercise2_instance: Exercise2 port map
   (
       switch => switch,
       led    => led
   );
   
   ---------------------------------------------------------------------------------
   -- Genomför simulering av samtliga kombinationer 0000 - 1111 av insignaler 
 -- switch[3:0] var 10:e ns via en process. Simulering genomförs under 160 ns.
   ---------------------------------------------------------------------------------
   process is
   begin
      for i in 0 to 15 loop
         switch <= std_logic_vector(to_unsigned(i, 4));
         wait for 10 ns;
      end loop;
      wait;
   end process;
 
end architecture;
