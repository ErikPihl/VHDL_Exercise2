-----------------------------------------------------------------------------------------
-- Modulen Exercise2 används för att realisera ett system, där mest signifikant hög 
-- insignal av slide-switchar switch[3:0] avgör utsignalerna på lysdioder led[3:0]
-- enligt nedanstående sanningstabell, där x utgör don't care-värden:
--
-- switch[3:0]       led[3:0]
--    0000             0000
--    0001             1000
--    001x             0100
--    01xx             0010
--    1xxx             0001
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
 
entity Exercise2 is
   port
   (
         switch : in std_logic_vector(3 downto 0); -- Insignaler från slide-switchar.
         led    : out std_logic_vector(3 downto 0) -- Utsignaler till lysdioder.
   );
end entity;
 
architecture Behaviour of Exercise2 is
begin
 
   ---------------------------------------------------------------------------------
   -- Tilldelar utsignalerna i enlighet med ovanstående sanningstabell via
   -- implementering av if-else satser.
   ---------------------------------------------------------------------------------
   process (switch) is
   begin
      if (switch(3) = '1') then
         led <= "1000";
      elsif (switch(2) = '1') then
         led <= "0100";
      elsif (switch(1) = '1') then
         led <= "0010";
      elsif (switch(0) = '1') then
         led <= "0001";
      else
         led <= "0000";
      end if;
   end process;
 
end architecture;
