library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OPERAND is
 Port (RESET, CLK, LOADOP : IN STD_LOGIC;
       OPERAND_IN : IN STD_LOGIC_VECTOR(7 downto 0);
       OPERAND_OUT: OUT STD_LOGIC_VECTOR(7 downto 0));
end OPERAND;

architecture OPERAND_BODY of OPERAND is

begin
    --Default operand process
    OPERAND_PROC : process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if RESET = '1' then --if reset then set to 0
                OPERAND_OUT <= (others => '0');
            else 
                if LOADOP = '1' then --if load is enabled store value on input
                    OPERAND_OUT <= OPERAND_IN;
                end if;
            end if;
        end if;
    end process OPERAND_PROC;
end OPERAND_BODY;
