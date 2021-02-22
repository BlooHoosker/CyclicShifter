library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH is
  Port ( CLK, RESET, SHIFT, LOADCNT, LOADREG, EN : in std_logic;
         ZERO : out std_logic;
         LEN_OUT : out std_logic_vector(3 downto 0);
         INPUT : in std_logic_vector(7 downto 0);
         OPERAND_OUT: out std_logic_vector(7 downto 0);
         REG_OUT: out std_logic_vector(7 downto 0));
end DATAPATH;

architecture DATAPATH_BODY of DATAPATH is

component OPERAND is
 Port (RESET, CLK, LOADOP : IN STD_LOGIC;
       OPERAND_IN : IN STD_LOGIC_VECTOR(7 downto 0);
       OPERAND_OUT: OUT STD_LOGIC_VECTOR(7 downto 0));
end component;

component SHIFT_LEN is
    Port ( CLK, RESET, LOADLEN : IN STD_LOGIC;
           LEN_IN: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           LEN_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

component RIGHT_SHIFT_REG is
    Port ( CLK, RESET, SHIFT, LOADREG : in STD_LOGIC;
            REG_IN: in STD_LOGIC_VECTOR(7 downto 0);
            REG_OUT: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component COUNTER is
  Port ( CLK, RESET, LOADCNT, EN : in std_logic;
        ZERO : out std_logic;
        COUNTER_IN: in std_logic_vector(3 downto 0));
end component;

begin

    OPERAND_INST: OPERAND
    port map(
        RESET => RESET,
        CLK => CLK,
        LOADOP => LOADREG,
        OPERAND_IN => INPUT,
        OPERAND_OUT => OPERAND_OUT
        );
        
    SHIFT_LEN_INST: SHIFT_LEN
        port map(
            RESET => RESET,
            CLK => CLK,
            LOADLEN => LOADCNT,
            LEN_IN => INPUT(3 downto 0),
            LEN_OUT => LEN_OUT
            );
            
    RIGHT_SHIFT_REG_INST: RIGHT_SHIFT_REG
        port map(
           RESET => RESET,
           CLK => CLK, 
           SHIFT => SHIFT,
           LOADREG => LOADREG,
           REG_IN => INPUT,
           REG_OUT => REG_OUT
           );
           
    COUNTER_INST: COUNTER
        port map(
            RESET => RESET,
            CLK => CLK,
            LOADCNT => LOADCNT,
            ZERO => ZERO,
            COUNTER_IN => INPUT(3 downto 0),
            EN => EN
            );         
end DATAPATH_BODY;
