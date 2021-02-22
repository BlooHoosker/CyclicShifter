library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity COUNTER is
  Port ( CLK, RESET, LOADCNT, EN: in std_logic;
        ZERO : out std_logic;
        COUNTER_IN: in std_logic_vector(3 downto 0));
end COUNTER;

architecture COUNTER_BODY of COUNTER is
    signal VALUE: std_logic_vector(3 downto 0);
begin

    --Default counter process
    COUNTER_PROC: process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if RESET = '1' then --if reset comes then it has highest priority
                VALUE <= (others => '0');
            else
                if LOADCNT = '1' then --loading input has second priority
                    VALUE <= ('0' & COUNTER_IN(2 downto 0));
                else 
                    if VALUE /= (VALUE'range => '0') and EN = '1' then --Prevent underoverflow
                        VALUE <= VALUE - 1; -- Actual counting
                    end if;
                end if;
            end if;
        end if;
    end process COUNTER_PROC;
    
    --Sets zero out flag
    ZERO_PROC: process(VALUE) 
    begin
        if VALUE = (VALUE'range => '0') then
            ZERO <= '1';
        else 
            ZERO <= '0';
        end if;
    end process ZERO_PROC; 
end COUNTER_BODY;
