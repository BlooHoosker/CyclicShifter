library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.all;     

entity TB_COMPUTE_UNIT is
end TB_COMPUTE_UNIT;

architecture TB_COMPUTE_UNIT_BODY of TB_COMPUTE_UNIT is

SIGNAL TB_OUTPUT, TB_INPUT_CPY : std_logic_vector(15 downto 0);
SIGNAL TB_INPUT: std_logic_vector(7 downto 0);
signal TB_BTN0, TB_BTN1, TB_CLK, TB_RESET: std_logic;

component COMPUTE_UNIT is
  Port ( INPUT: in std_logic_vector(7 downto 0);
         BTN0, BTN1, CLK, RESET: in std_logic;
         OUTPUT, INPUT_CPY: out std_logic_vector(15 downto 0));
end component;

begin

    DUT: COMPUTE_UNIT
    port map(
        BTN0 => TB_BTN0,
        BTN1 => TB_BTN1,
        CLK => TB_CLK,
        RESET => TB_RESET,
        INPUT => TB_INPUT,
        OUTPUT => TB_OUTPUT,
        INPUT_CPY => TB_INPUT_CPY  
    );
    
    CLK_GEN : process
    begin
        TB_CLK <= '0';
        wait for 5 ns;
        TB_CLK <= '1';
        wait for 5 ns;
    end process;
       
    RESET_GEN : process
    begin
        wait for 25 ns;
        TB_RESET <= '0';   
        wait for 25 ns;
        TB_RESET <= '1';   
        wait for 25 ns;
        TB_RESET <= '0';
        wait;
    end process;  
       
    SIM_GEN : process
        file SIMDATA : TEXT is in "D:\OneDrive\CVUT\Semester5\PNO\Cyklicky posouvac\simdata.txt";
        variable L_SIMDATA : LINE;
        variable BV_OP, BV_LEN : BIT_VECTOR ( 7 downto 0);
        variable BV_OUTPUT : BIT_VECTOR (15 downto 0);
        variable OP, LEN :STD_LOGIC_VECTOR ( 7 downto 0);
        variable OUTPUT_VAR : STD_LOGIC_VECTOR (15 downto 0);
    begin
        wait until TB_RESET = '1';
        TB_BTN0 <= '0';
        TB_BTN1 <= '0';
        wait until TB_RESET = '0';
        wait for 50 ns;
        
        wait until TB_CLK = '1';
          
        while not ENDFILE(SIMDATA) loop
        
            wait until TB_CLK = '1';
            
            readline(SIMDATA, L_SIMDATA);             
            read(L_SIMDATA, BV_OP);
            read(L_SIMDATA, BV_LEN);
            read(L_SIMDATA, BV_OUTPUT);
            OP := To_StdLogicVector(BV_OP);
            LEN := To_StdLogicVector(BV_LEN);
            OUTPUT_VAR := To_StdLogicVector(BV_OUTPUT);

            TB_INPUT <= OP;  -- input operand from variable
            wait for 50 ns;
            TB_BTN0 <= '1';
            wait for 50 ns;
            TB_BTN0 <= '0';
            
            wait for 100 ns;
            
            TB_INPUT <= LEN;  -- input length from variable
            wait for 50 ns;
            TB_BTN1 <= '1';
            wait for 50 ns;
            TB_BTN1 <= '0';
            
            wait for 100 ns; 
            
            assert TB_OUTPUT = OUTPUT_VAR
            report "Chyba vysledku " & integer'image(TO_INTEGER(UNSIGNED(TB_OUTPUT))) & " ocekavano " & integer'image(TO_INTEGER(UNSIGNED(OUTPUT_VAR)))
            severity error;
        end loop;
       
        report "KONEC SIMULACE" severity failure;
        
        end process;                        
           
end TB_COMPUTE_UNIT_BODY;
