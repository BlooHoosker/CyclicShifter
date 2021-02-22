library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CYCLICSHIFTER is
   Port ( SWITCH: in std_logic_vector(7 downto 0);
          BTN0, BTN1, BTN3, CLK, RESET: in std_logic  ;
          SEGMENT  : out STD_LOGIC_VECTOR (6 downto 0);    -- 7 segmentu displeje
          DP       : out STD_LOGIC;                        -- desetinna tecka
          DIGIT    : out STD_LOGIC_VECTOR (3 downto 0)
   );
end CYCLICSHIFTER;

architecture CYCLICSHIFTER_BODY of CYCLICSHIFTER is

    component COMPUTE_UNIT is
      Port ( INPUT: in std_logic_vector(7 downto 0);
             BTN0, BTN1, CLK, RESET: in std_logic;
             OUTPUT, INPUT_CPY: out std_logic_vector(15 downto 0)
             );
    end component;
    
    
    component MUX is
     Port ( INPUT1, INPUT2: in std_logic_vector(15 downto 0);
            OUTPUT: out std_logic_vector(15 downto 0);
            BTN: in std_logic
      );
    end component;
    
    component HEX2SEG is
       port (
          DATA     : in  STD_LOGIC_VECTOR (15 downto 0);   -- vstupni data k zobrazeni (4 sestnactkove cislice)
          CLK      : in  STD_LOGIC;
          SEGMENT  : out STD_LOGIC_VECTOR (6 downto 0);    -- 7 segmentu displeje
          DP       : out STD_LOGIC;                        -- desetinna tecka
          DIGIT    : out STD_LOGIC_VECTOR (3 downto 0)     -- 4 cifry displeje
       );
    end component;

    signal CS_MUX, CS_CU_OUTPUT, CS_CU_INPUT_CPY: std_logic_vector (15 downto 0);
begin

    COMPUTE_UNIT_INST: COMPUTE_UNIT
    port map(
        INPUT => SWITCH,
        BTN0 => BTN0,
        BTN1 => BTN1,
        CLK => CLK,
        RESET => RESET,
        OUTPUT => CS_CU_OUTPUT,
        INPUT_CPY => CS_CU_INPUT_CPY
    );
    
    MUX_INST: MUX
    port map(
        INPUT1 => CS_CU_OUTPUT,
        INPUT2 => CS_CU_INPUT_CPY,
        BTN => BTN3,
        OUTPUT => CS_MUX
    );
    
    HEX2SEG_INST: HEX2SEG
    port map(
        DATA => CS_MUX,
        CLK => CLK,
        SEGMENT => SEGMENT,
        DP => DP,
        DIGIT => DIGIT
    );
end CYCLICSHIFTER_BODY;
