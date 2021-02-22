library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
 Port ( INPUT1, INPUT2: in std_logic_vector(15 downto 0);
        OUTPUT: out std_logic_vector(15 downto 0);
        BTN: in std_logic
  );
end MUX;

architecture MUX_BODY of MUX is

begin

    MUX_PROC: process(INPUT1, INPUT2, BTN)
    begin
        if BTN = '1' then
            OUTPUT <= INPUT2;
        else 
            OUTPUT <= INPUT1;
        end if;
    end process MUX_PROC;
    
end MUX_BODY;
