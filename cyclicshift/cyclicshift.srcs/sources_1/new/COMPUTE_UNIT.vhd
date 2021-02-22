library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPUTE_UNIT is
  Port ( INPUT: in std_logic_vector(7 downto 0);
         BTN0, BTN1, CLK, RESET: in std_logic;
         OUTPUT, INPUT_CPY: out std_logic_vector(15 downto 0));
end COMPUTE_UNIT;

architecture COMPUTE_UNIT_BODY of COMPUTE_UNIT is

component DATAPATH is
  Port ( CLK, RESET, SHIFT, LOADCNT, LOADREG, EN : in std_logic;
         ZERO : out std_logic;
         LEN_OUT : out std_logic_vector(3 downto 0);
         INPUT : in std_logic_vector(7 downto 0);
         OPERAND_OUT: out std_logic_vector(7 downto 0);
         REG_OUT: out std_logic_vector(7 downto 0));
end component;

component CONTROLLER is
  Port ( LOADREG, LOADCNT, SHIFT, EN: out std_logic;
         BTN0, BTN1, CLK, RESET, ZERO: in std_logic);
end component;

    signal CU_ZERO, CU_SHIFT, CU_LOADCNT, CU_LOADREG, CU_EN: std_logic;
    
begin

    DATAPATH_INST: DATAPATH
    port map(
        CLK => CLK,
        RESET => RESET,
        SHIFT => CU_SHIFT,
        LOADCNT => CU_LOADCNT,
        LOADREG => CU_LOADREG,
        ZERO => CU_ZERO,
        LEN_OUT => INPUT_CPY(15 DOWNTO 12),
        INPUT => INPUT,
        OPERAND_OUT => INPUT_CPY(7 DOWNTO 0),
        REG_OUT => OUTPUT(7 DOWNTO 0),
        EN => CU_EN
    );
    
    CONTROLLER_INST: CONTROLLER
    port map(
        LOADREG => CU_LOADREG,
        LOADCNT => CU_LOADCNT,
        SHIFT => CU_SHIFT,
        BTN0 => BTN0,
        BTN1 => BTN1,
        CLK => CLK,
        RESET => RESET,
        ZERO => CU_ZERO,
        EN => CU_EN
    );
    
    OUTPUT(15 DOWNTO 8) <= "00000000";
    INPUT_CPY(11 DOWNTO 8) <= "0000";
     
end COMPUTE_UNIT_BODY;
