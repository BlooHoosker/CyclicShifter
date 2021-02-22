library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RIGHT_SHIFT_REG is
    Port ( CLK, RESET, SHIFT, LOADREG : in STD_LOGIC;
            REG_IN: in STD_LOGIC_VECTOR(7 downto 0);
            REG_OUT: out STD_LOGIC_VECTOR(7 downto 0));
end RIGHT_SHIFT_REG;

architecture RIGHT_SHIFT_REG_BODY of RIGHT_SHIFT_REG is
    signal VALUE : std_logic_vector(7 downto 0);
begin

    --Default right shift register process
    RIGHT_SHIFT_REG_PROC: process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if RESET = '1' then --if reset signal, sets zero
                VALUE <= (others => '0');
            else 
                if LOADREG = '1' then --if load signal, loads value from input
                    VALUE <= REG_IN;
                else
                    if SHIFT = '1' then --if shift signal, shifts value to the right cycle like
                        VALUE <= (VALUE(0) & VALUE(7 downto 1));
                    end if;
                end if;
            end if;
        end if;
    end process RIGHT_SHIFT_REG_PROC;
    
    --Sets output when value changes
    RIGHT_SHIFT_REG_OUTPROC: process (VALUE)
    begin
        REG_OUT <= VALUE;
    end process RIGHT_SHIFT_REG_OUTPROC;
    
end RIGHT_SHIFT_REG_BODY;
