library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROLLER is
  Port ( LOADREG, LOADCNT, SHIFT, EN: out std_logic;
         BTN0, BTN1, CLK, RESET, ZERO: in std_logic);
end CONTROLLER;

architecture CONTROLLER_BODY of CONTROLLER is

   type T_STATE is (START, REGLD, CNTLD);
   signal CURRENT_STATE, NEXT_STATE : T_STATE; 

begin

    -- process that changes states
    STATE_PROC: process(CLK) 
    begin
        if CLK = '1' and CLK'event then
            if RESET = '1' then
                CURRENT_STATE <= START;
            else 
                CURRENT_STATE <= NEXT_STATE;
            end if;
        end if;
    end process STATE_PROC;
    
    -- computes next state based on input
    STATE_LOGIC: process(CURRENT_STATE, NEXT_STATE, ZERO, BTN0, BTN1)
    begin
        case CURRENT_STATE is
            when START => if BTN0 = '1' then
                NEXT_STATE <= REGLD;
                else 
                NEXT_STATE <= START;
            end if;
            when REGLD => if BTN1 = '1' then 
                NEXT_STATE <= CNTLD;
                else 
                NEXT_STATE <= REGLD;
            end if;
            when CNTLD => if ZERO = '1' then
                NEXT_STATE <= START;
                else 
                NEXT_STATE <= CNTLD;
            end if;
        end case;   
    end process STATE_LOGIC;
    
    -- computes output signals based on state and input = mealy 
    OUTPUT_SIGNALS: process(CURRENT_STATE, BTN0, BTN1, ZERO)
    begin
        LOADREG <= '0';
        LOADCNT <= '0';
        SHIFT <= '0';
        EN <= '0';
        case CURRENT_STATE is 
            when START => if BTN0 = '1' then
                LOADREG <= '1';
                end if;
            when REGLD => if BTN1 = '1' then
                LOADCNT <= '1';
                end if;
            when CNTLD => if ZERO = '0' then
                SHIFT <= '1';
                EN <= '1';
                end if;
        end case;
    end process OUTPUT_SIGNALS;
   
end CONTROLLER_BODY;
