library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SHIFT_LEN is
    Port ( CLK, RESET, LOADLEN : IN STD_LOGIC;
           LEN_IN: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           LEN_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end SHIFT_LEN;

architecture SHIFT_LEN_BODY of SHIFT_LEN is

begin
    --Default shift length process
    SHIFT_LEN_PROC: process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if RESET = '1' then --if reset signal, sets 0
                LEN_OUT <= (others => '0');
            else 
                if LOADLEN = '1' then --if load signal, sets value
                    LEN_OUT <= LEN_IN;
                end if;
            end if;
        end if;
    end process SHIFT_LEN_PROC;

end SHIFT_LEN_BODY;
