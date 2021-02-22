-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Nov  3 13:18:44 2020
-- Host        : DESKTOP-SN0IEDA running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/OneDrive/CVUT/Semester5/PNO/cyclicshift/cyclicshift.sim/sim_1/synth/func/xsim/TB_COMPUTE_UNIT_func_synth.vhd
-- Design      : CYCLICSHIFTER
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CONTROLLER is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \OPERAND_OUT_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \VALUE_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \VALUE_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \LEN_OUT_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[0]_0\ : in STD_LOGIC;
    BTN0_IBUF : in STD_LOGIC;
    \SWITCH[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \VALUE_reg[2]\ : in STD_LOGIC;
    BTN1_IBUF : in STD_LOGIC;
    \VALUE_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end CONTROLLER;

architecture STRUCTURE of CONTROLLER is
  signal \FSM_sequential_CURRENT_STATE[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_CURRENT_STATE[1]_i_1_n_0\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \^out\ : signal is "yes";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_CURRENT_STATE_reg[0]\ : label is "regld:01,cntld:10,start:00";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_CURRENT_STATE_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_CURRENT_STATE_reg[1]\ : label is "regld:01,cntld:10,start:00";
  attribute KEEP of \FSM_sequential_CURRENT_STATE_reg[1]\ : label is "yes";
begin
  \out\(1 downto 0) <= \^out\(1 downto 0);
\FSM_sequential_CURRENT_STATE[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000454"
    )
        port map (
      I0 => \^out\(1),
      I1 => BTN0_IBUF,
      I2 => \^out\(0),
      I3 => BTN1_IBUF,
      I4 => SR(0),
      O => \FSM_sequential_CURRENT_STATE[0]_i_1_n_0\
    );
\FSM_sequential_CURRENT_STATE[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF40"
    )
        port map (
      I0 => \^out\(1),
      I1 => BTN1_IBUF,
      I2 => \^out\(0),
      I3 => \FSM_sequential_CURRENT_STATE_reg[0]_0\,
      I4 => SR(0),
      O => \FSM_sequential_CURRENT_STATE[1]_i_1_n_0\
    );
\FSM_sequential_CURRENT_STATE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_sequential_CURRENT_STATE[0]_i_1_n_0\,
      Q => \^out\(0),
      R => '0'
    );
\FSM_sequential_CURRENT_STATE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_sequential_CURRENT_STATE[1]_i_1_n_0\,
      Q => \^out\(1),
      R => '0'
    );
\LEN_OUT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => BTN1_IBUF,
      O => \LEN_OUT_reg[0]\(0)
    );
\OPERAND_OUT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => BTN0_IBUF,
      O => \OPERAND_OUT_reg[0]\(0)
    );
\VALUE[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(0),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(1),
      O => D(0)
    );
\VALUE[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2000EFFF"
    )
        port map (
      I0 => \SWITCH[7]\(0),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN1_IBUF,
      I4 => \VALUE_reg[0]_1\(0),
      O => \VALUE_reg[0]_0\(0)
    );
\VALUE[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(1),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(2),
      O => D(1)
    );
\VALUE[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(2),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(3),
      O => D(2)
    );
\VALUE[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(3),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(4),
      O => D(3)
    );
\VALUE[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0AC0"
    )
        port map (
      I0 => \VALUE_reg[2]\,
      I1 => BTN1_IBUF,
      I2 => \^out\(0),
      I3 => \^out\(1),
      O => \VALUE_reg[0]\(0)
    );
\VALUE[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(4),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(5),
      O => D(4)
    );
\VALUE[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(5),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(6),
      O => D(5)
    );
\VALUE[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(6),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(7),
      O => D(6)
    );
\VALUE[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAE"
    )
        port map (
      I0 => \FSM_sequential_CURRENT_STATE_reg[0]_0\,
      I1 => BTN0_IBUF,
      I2 => \^out\(0),
      I3 => \^out\(1),
      O => E(0)
    );
\VALUE[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \SWITCH[7]\(7),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => BTN0_IBUF,
      I4 => Q(0),
      O => D(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity COUNTER is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \VALUE_reg[0]_0\ : out STD_LOGIC;
    \FSM_sequential_CURRENT_STATE_reg[1]\ : out STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BTN1_IBUF : in STD_LOGIC;
    \SWITCH[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end COUNTER;

architecture STRUCTURE of COUNTER is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \VALUE_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \VALUE[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \VALUE[3]_i_3\ : label is "soft_lutpair0";
begin
  Q(0) <= \^q\(0);
\FSM_sequential_CURRENT_STATE[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(1),
      I2 => \VALUE_reg__0\(3),
      I3 => \VALUE_reg__0\(1),
      I4 => \^q\(0),
      I5 => \VALUE_reg__0\(2),
      O => \FSM_sequential_CURRENT_STATE_reg[1]\
    );
\VALUE[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F99999990999999"
    )
        port map (
      I0 => \VALUE_reg__0\(1),
      I1 => \^q\(0),
      I2 => \out\(1),
      I3 => \out\(0),
      I4 => BTN1_IBUF,
      I5 => \SWITCH[2]\(0),
      O => p_0_in(1)
    );
\VALUE[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA900A9"
    )
        port map (
      I0 => \VALUE_reg__0\(2),
      I1 => \^q\(0),
      I2 => \VALUE_reg__0\(1),
      I3 => E(0),
      I4 => \SWITCH[2]\(1),
      O => p_0_in(2)
    );
\VALUE[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55540001"
    )
        port map (
      I0 => E(0),
      I1 => \VALUE_reg__0\(2),
      I2 => \^q\(0),
      I3 => \VALUE_reg__0\(1),
      I4 => \VALUE_reg__0\(3),
      O => p_0_in(3)
    );
\VALUE[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \VALUE_reg__0\(2),
      I1 => \^q\(0),
      I2 => \VALUE_reg__0\(1),
      I3 => \VALUE_reg__0\(3),
      O => \VALUE_reg[0]_0\
    );
\VALUE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => D(0),
      Q => \^q\(0),
      R => SR(0)
    );
\VALUE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => p_0_in(1),
      Q => \VALUE_reg__0\(1),
      R => SR(0)
    );
\VALUE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => p_0_in(2),
      Q => \VALUE_reg__0\(2),
      R => SR(0)
    );
\VALUE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => p_0_in(3),
      Q => \VALUE_reg__0\(3),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity HEX2SEG is
  port (
    SEL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIGIT_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC
  );
end HEX2SEG;

architecture STRUCTURE of HEX2SEG is
  signal \PRESCALER[0]_i_2_n_0\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \PRESCALER_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \PRESCALER_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \PRESCALER_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \PRESCALER_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[0]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[10]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[11]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[12]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[13]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[1]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[2]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[3]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[4]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[5]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[6]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[7]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[8]\ : STD_LOGIC;
  signal \PRESCALER_reg_n_0_[9]\ : STD_LOGIC;
  signal \^sel\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_PRESCALER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DIGIT_OBUF[0]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[1]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[2]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[3]_inst_i_1\ : label is "soft_lutpair4";
begin
  SEL(1 downto 0) <= \^sel\(1 downto 0);
\DIGIT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sel\(0),
      I1 => \^sel\(1),
      O => DIGIT_OBUF(0)
    );
\DIGIT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^sel\(1),
      I1 => \^sel\(0),
      O => DIGIT_OBUF(1)
    );
\DIGIT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^sel\(0),
      I1 => \^sel\(1),
      O => DIGIT_OBUF(2)
    );
\DIGIT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^sel\(0),
      I1 => \^sel\(1),
      O => DIGIT_OBUF(3)
    );
\PRESCALER[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \PRESCALER_reg_n_0_[0]\,
      O => \PRESCALER[0]_i_2_n_0\
    );
\PRESCALER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[0]_i_1_n_7\,
      Q => \PRESCALER_reg_n_0_[0]\,
      R => '0'
    );
\PRESCALER_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \PRESCALER_reg[0]_i_1_n_0\,
      CO(2) => \PRESCALER_reg[0]_i_1_n_1\,
      CO(1) => \PRESCALER_reg[0]_i_1_n_2\,
      CO(0) => \PRESCALER_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \PRESCALER_reg[0]_i_1_n_4\,
      O(2) => \PRESCALER_reg[0]_i_1_n_5\,
      O(1) => \PRESCALER_reg[0]_i_1_n_6\,
      O(0) => \PRESCALER_reg[0]_i_1_n_7\,
      S(3) => \PRESCALER_reg_n_0_[3]\,
      S(2) => \PRESCALER_reg_n_0_[2]\,
      S(1) => \PRESCALER_reg_n_0_[1]\,
      S(0) => \PRESCALER[0]_i_2_n_0\
    );
\PRESCALER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[8]_i_1_n_5\,
      Q => \PRESCALER_reg_n_0_[10]\,
      R => '0'
    );
\PRESCALER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[8]_i_1_n_4\,
      Q => \PRESCALER_reg_n_0_[11]\,
      R => '0'
    );
\PRESCALER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[12]_i_1_n_7\,
      Q => \PRESCALER_reg_n_0_[12]\,
      R => '0'
    );
\PRESCALER_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PRESCALER_reg[8]_i_1_n_0\,
      CO(3) => \NLW_PRESCALER_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \PRESCALER_reg[12]_i_1_n_1\,
      CO(1) => \PRESCALER_reg[12]_i_1_n_2\,
      CO(0) => \PRESCALER_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \PRESCALER_reg[12]_i_1_n_4\,
      O(2) => \PRESCALER_reg[12]_i_1_n_5\,
      O(1) => \PRESCALER_reg[12]_i_1_n_6\,
      O(0) => \PRESCALER_reg[12]_i_1_n_7\,
      S(3 downto 2) => \^sel\(1 downto 0),
      S(1) => \PRESCALER_reg_n_0_[13]\,
      S(0) => \PRESCALER_reg_n_0_[12]\
    );
\PRESCALER_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[12]_i_1_n_6\,
      Q => \PRESCALER_reg_n_0_[13]\,
      R => '0'
    );
\PRESCALER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[12]_i_1_n_5\,
      Q => \^sel\(0),
      R => '0'
    );
\PRESCALER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[12]_i_1_n_4\,
      Q => \^sel\(1),
      R => '0'
    );
\PRESCALER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[0]_i_1_n_6\,
      Q => \PRESCALER_reg_n_0_[1]\,
      R => '0'
    );
\PRESCALER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[0]_i_1_n_5\,
      Q => \PRESCALER_reg_n_0_[2]\,
      R => '0'
    );
\PRESCALER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[0]_i_1_n_4\,
      Q => \PRESCALER_reg_n_0_[3]\,
      R => '0'
    );
\PRESCALER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[4]_i_1_n_7\,
      Q => \PRESCALER_reg_n_0_[4]\,
      R => '0'
    );
\PRESCALER_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PRESCALER_reg[0]_i_1_n_0\,
      CO(3) => \PRESCALER_reg[4]_i_1_n_0\,
      CO(2) => \PRESCALER_reg[4]_i_1_n_1\,
      CO(1) => \PRESCALER_reg[4]_i_1_n_2\,
      CO(0) => \PRESCALER_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \PRESCALER_reg[4]_i_1_n_4\,
      O(2) => \PRESCALER_reg[4]_i_1_n_5\,
      O(1) => \PRESCALER_reg[4]_i_1_n_6\,
      O(0) => \PRESCALER_reg[4]_i_1_n_7\,
      S(3) => \PRESCALER_reg_n_0_[7]\,
      S(2) => \PRESCALER_reg_n_0_[6]\,
      S(1) => \PRESCALER_reg_n_0_[5]\,
      S(0) => \PRESCALER_reg_n_0_[4]\
    );
\PRESCALER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[4]_i_1_n_6\,
      Q => \PRESCALER_reg_n_0_[5]\,
      R => '0'
    );
\PRESCALER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[4]_i_1_n_5\,
      Q => \PRESCALER_reg_n_0_[6]\,
      R => '0'
    );
\PRESCALER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[4]_i_1_n_4\,
      Q => \PRESCALER_reg_n_0_[7]\,
      R => '0'
    );
\PRESCALER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[8]_i_1_n_7\,
      Q => \PRESCALER_reg_n_0_[8]\,
      R => '0'
    );
\PRESCALER_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PRESCALER_reg[4]_i_1_n_0\,
      CO(3) => \PRESCALER_reg[8]_i_1_n_0\,
      CO(2) => \PRESCALER_reg[8]_i_1_n_1\,
      CO(1) => \PRESCALER_reg[8]_i_1_n_2\,
      CO(0) => \PRESCALER_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \PRESCALER_reg[8]_i_1_n_4\,
      O(2) => \PRESCALER_reg[8]_i_1_n_5\,
      O(1) => \PRESCALER_reg[8]_i_1_n_6\,
      O(0) => \PRESCALER_reg[8]_i_1_n_7\,
      S(3) => \PRESCALER_reg_n_0_[11]\,
      S(2) => \PRESCALER_reg_n_0_[10]\,
      S(1) => \PRESCALER_reg_n_0_[9]\,
      S(0) => \PRESCALER_reg_n_0_[8]\
    );
\PRESCALER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \PRESCALER_reg[8]_i_1_n_6\,
      Q => \PRESCALER_reg_n_0_[9]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity OPERAND is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \SWITCH[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC
  );
end OPERAND;

architecture STRUCTURE of OPERAND is
begin
\OPERAND_OUT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(0),
      Q => Q(0),
      R => SR(0)
    );
\OPERAND_OUT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(1),
      Q => Q(1),
      R => SR(0)
    );
\OPERAND_OUT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(2),
      Q => Q(2),
      R => SR(0)
    );
\OPERAND_OUT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(3),
      Q => Q(3),
      R => SR(0)
    );
\OPERAND_OUT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(4),
      Q => Q(4),
      R => SR(0)
    );
\OPERAND_OUT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(5),
      Q => Q(5),
      R => SR(0)
    );
\OPERAND_OUT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(6),
      Q => Q(6),
      R => SR(0)
    );
\OPERAND_OUT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      D => \SWITCH[7]\(7),
      Q => Q(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RIGHT_SHIFT_REG is
  port (
    SEGMENT_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \VALUE_reg[6]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BTN3_IBUF : in STD_LOGIC;
    SEL : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \LEN_OUT_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[1]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC
  );
end RIGHT_SHIFT_REG;

architecture STRUCTURE of RIGHT_SHIFT_REG is
  signal \HEX2SEG_INST/HEX__23\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \SEGMENT_OBUF[6]_inst_i_6_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_7_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_8_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_9_n_0\ : STD_LOGIC;
  signal \^value_reg[6]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[0]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[1]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[2]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[4]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_1\ : label is "soft_lutpair3";
begin
  \VALUE_reg[6]_0\(7 downto 0) <= \^value_reg[6]_0\(7 downto 0);
\SEGMENT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4109"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(3),
      I1 => \HEX2SEG_INST/HEX__23\(2),
      I2 => \HEX2SEG_INST/HEX__23\(1),
      I3 => \HEX2SEG_INST/HEX__23\(0),
      O => SEGMENT_OBUF(0)
    );
\SEGMENT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"480E"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(1),
      I1 => \HEX2SEG_INST/HEX__23\(0),
      I2 => \HEX2SEG_INST/HEX__23\(3),
      I3 => \HEX2SEG_INST/HEX__23\(2),
      O => SEGMENT_OBUF(1)
    );
\SEGMENT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5704"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(3),
      I1 => \HEX2SEG_INST/HEX__23\(2),
      I2 => \HEX2SEG_INST/HEX__23\(1),
      I3 => \HEX2SEG_INST/HEX__23\(0),
      O => SEGMENT_OBUF(2)
    );
\SEGMENT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8294"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(1),
      I1 => \HEX2SEG_INST/HEX__23\(2),
      I2 => \HEX2SEG_INST/HEX__23\(0),
      I3 => \HEX2SEG_INST/HEX__23\(3),
      O => SEGMENT_OBUF(3)
    );
\SEGMENT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80C2"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(1),
      I1 => \HEX2SEG_INST/HEX__23\(2),
      I2 => \HEX2SEG_INST/HEX__23\(3),
      I3 => \HEX2SEG_INST/HEX__23\(0),
      O => SEGMENT_OBUF(4)
    );
\SEGMENT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D860"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(0),
      I1 => \HEX2SEG_INST/HEX__23\(1),
      I2 => \HEX2SEG_INST/HEX__23\(2),
      I3 => \HEX2SEG_INST/HEX__23\(3),
      O => SEGMENT_OBUF(5)
    );
\SEGMENT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4092"
    )
        port map (
      I0 => \HEX2SEG_INST/HEX__23\(2),
      I1 => \HEX2SEG_INST/HEX__23\(3),
      I2 => \HEX2SEG_INST/HEX__23\(0),
      I3 => \HEX2SEG_INST/HEX__23\(1),
      O => SEGMENT_OBUF(6)
    );
\SEGMENT_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAAEAAABAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_6_n_0\,
      I1 => BTN3_IBUF,
      I2 => SEL(1),
      I3 => SEL(0),
      I4 => \^value_reg[6]_0\(6),
      I5 => Q(6),
      O => \HEX2SEG_INST/HEX__23\(2)
    );
\SEGMENT_OBUF[6]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAAEAAABAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_7_n_0\,
      I1 => BTN3_IBUF,
      I2 => SEL(1),
      I3 => SEL(0),
      I4 => \^value_reg[6]_0\(7),
      I5 => Q(7),
      O => \HEX2SEG_INST/HEX__23\(3)
    );
\SEGMENT_OBUF[6]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAAEAAABAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_8_n_0\,
      I1 => BTN3_IBUF,
      I2 => SEL(1),
      I3 => SEL(0),
      I4 => \^value_reg[6]_0\(4),
      I5 => Q(4),
      O => \HEX2SEG_INST/HEX__23\(0)
    );
\SEGMENT_OBUF[6]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAAEAAABAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_9_n_0\,
      I1 => BTN3_IBUF,
      I2 => SEL(1),
      I3 => SEL(0),
      I4 => \^value_reg[6]_0\(5),
      I5 => Q(5),
      O => \HEX2SEG_INST/HEX__23\(1)
    );
\SEGMENT_OBUF[6]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00000000000CCAA"
    )
        port map (
      I0 => \^value_reg[6]_0\(2),
      I1 => Q(2),
      I2 => \LEN_OUT_reg[3]\(2),
      I3 => BTN3_IBUF,
      I4 => SEL(1),
      I5 => SEL(0),
      O => \SEGMENT_OBUF[6]_inst_i_6_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00000000000CCAA"
    )
        port map (
      I0 => \^value_reg[6]_0\(3),
      I1 => Q(3),
      I2 => \LEN_OUT_reg[3]\(3),
      I3 => BTN3_IBUF,
      I4 => SEL(1),
      I5 => SEL(0),
      O => \SEGMENT_OBUF[6]_inst_i_7_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00000000000CCAA"
    )
        port map (
      I0 => \^value_reg[6]_0\(0),
      I1 => Q(0),
      I2 => \LEN_OUT_reg[3]\(0),
      I3 => BTN3_IBUF,
      I4 => SEL(1),
      I5 => SEL(0),
      O => \SEGMENT_OBUF[6]_inst_i_8_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00000000000CCAA"
    )
        port map (
      I0 => \^value_reg[6]_0\(1),
      I1 => Q(1),
      I2 => \LEN_OUT_reg[3]\(1),
      I3 => BTN3_IBUF,
      I4 => SEL(1),
      I5 => SEL(0),
      O => \SEGMENT_OBUF[6]_inst_i_9_n_0\
    );
\VALUE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(0),
      Q => \^value_reg[6]_0\(0),
      R => SR(0)
    );
\VALUE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(1),
      Q => \^value_reg[6]_0\(1),
      R => SR(0)
    );
\VALUE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(2),
      Q => \^value_reg[6]_0\(2),
      R => SR(0)
    );
\VALUE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(3),
      Q => \^value_reg[6]_0\(3),
      R => SR(0)
    );
\VALUE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(4),
      Q => \^value_reg[6]_0\(4),
      R => SR(0)
    );
\VALUE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(5),
      Q => \^value_reg[6]_0\(5),
      R => SR(0)
    );
\VALUE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(6),
      Q => \^value_reg[6]_0\(6),
      R => SR(0)
    );
\VALUE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      D => \FSM_sequential_CURRENT_STATE_reg[1]\(7),
      Q => \^value_reg[6]_0\(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SHIFT_LEN is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \SWITCH[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC
  );
end SHIFT_LEN;

architecture STRUCTURE of SHIFT_LEN is
begin
\LEN_OUT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \SWITCH[3]\(0),
      Q => Q(0),
      R => SR(0)
    );
\LEN_OUT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \SWITCH[3]\(1),
      Q => Q(1),
      R => SR(0)
    );
\LEN_OUT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \SWITCH[3]\(2),
      Q => Q(2),
      R => SR(0)
    );
\LEN_OUT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => \SWITCH[3]\(3),
      Q => Q(3),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DATAPATH is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \VALUE_reg[0]\ : out STD_LOGIC;
    SEGMENT_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \VALUE_reg[6]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \FSM_sequential_CURRENT_STATE_reg[1]\ : out STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BTN1_IBUF : in STD_LOGIC;
    \SWITCH[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    BTN3_IBUF : in STD_LOGIC;
    SEL : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \FSM_sequential_CURRENT_STATE_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_CURRENT_STATE_reg[1]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \FSM_sequential_CURRENT_STATE_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end DATAPATH;

architecture STRUCTURE of DATAPATH is
  signal LEN_OUT : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal OPERAND_OUT : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
COUNTER_INST: entity work.COUNTER
     port map (
      BTN1_IBUF => BTN1_IBUF,
      CLK => CLK,
      D(0) => D(0),
      E(0) => E(0),
      \FSM_sequential_CURRENT_STATE_reg[0]\(0) => \FSM_sequential_CURRENT_STATE_reg[0]_0\(0),
      \FSM_sequential_CURRENT_STATE_reg[1]\ => \FSM_sequential_CURRENT_STATE_reg[1]\,
      Q(0) => Q(0),
      SR(0) => SR(0),
      \SWITCH[2]\(1 downto 0) => \SWITCH[7]\(2 downto 1),
      \VALUE_reg[0]_0\ => \VALUE_reg[0]\,
      \out\(1 downto 0) => \out\(1 downto 0)
    );
OPERAND_INST: entity work.OPERAND
     port map (
      CLK => CLK,
      \FSM_sequential_CURRENT_STATE_reg[1]\(0) => \FSM_sequential_CURRENT_STATE_reg[1]_0\(0),
      Q(7 downto 0) => OPERAND_OUT(7 downto 0),
      SR(0) => SR(0),
      \SWITCH[7]\(7 downto 0) => \SWITCH[7]\(7 downto 0)
    );
RIGHT_SHIFT_REG_INST: entity work.RIGHT_SHIFT_REG
     port map (
      BTN3_IBUF => BTN3_IBUF,
      CLK => CLK,
      \FSM_sequential_CURRENT_STATE_reg[0]\(0) => \FSM_sequential_CURRENT_STATE_reg[0]\(0),
      \FSM_sequential_CURRENT_STATE_reg[1]\(7 downto 0) => \FSM_sequential_CURRENT_STATE_reg[1]_1\(7 downto 0),
      \LEN_OUT_reg[3]\(3 downto 0) => LEN_OUT(3 downto 0),
      Q(7 downto 0) => OPERAND_OUT(7 downto 0),
      SEGMENT_OBUF(6 downto 0) => SEGMENT_OBUF(6 downto 0),
      SEL(1 downto 0) => SEL(1 downto 0),
      SR(0) => SR(0),
      \VALUE_reg[6]_0\(7 downto 0) => \VALUE_reg[6]\(7 downto 0)
    );
SHIFT_LEN_INST: entity work.SHIFT_LEN
     port map (
      CLK => CLK,
      E(0) => E(0),
      Q(3 downto 0) => LEN_OUT(3 downto 0),
      SR(0) => SR(0),
      \SWITCH[3]\(3 downto 0) => \SWITCH[7]\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity COMPUTE_UNIT is
  port (
    SEGMENT_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    BTN0_IBUF : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    BTN1_IBUF : in STD_LOGIC;
    BTN3_IBUF : in STD_LOGIC;
    SEL : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end COMPUTE_UNIT;

architecture STRUCTURE of COMPUTE_UNIT is
  signal CONTROLLER_INST_n_0 : STD_LOGIC;
  signal CONTROLLER_INST_n_1 : STD_LOGIC;
  signal CONTROLLER_INST_n_12 : STD_LOGIC;
  signal CONTROLLER_INST_n_2 : STD_LOGIC;
  signal \COUNTER_INST/VALUE_reg__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal CU_LOADCNT : STD_LOGIC;
  signal CU_LOADREG : STD_LOGIC;
  signal DATAPATH_INST_n_1 : STD_LOGIC;
  signal DATAPATH_INST_n_17 : STD_LOGIC;
  signal VALUE : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
CONTROLLER_INST: entity work.CONTROLLER
     port map (
      BTN0_IBUF => BTN0_IBUF,
      BTN1_IBUF => BTN1_IBUF,
      CLK => CLK,
      D(7 downto 0) => p_1_in(7 downto 0),
      E(0) => CONTROLLER_INST_n_2,
      \FSM_sequential_CURRENT_STATE_reg[0]_0\ => DATAPATH_INST_n_17,
      \LEN_OUT_reg[0]\(0) => CU_LOADCNT,
      \OPERAND_OUT_reg[0]\(0) => CU_LOADREG,
      Q(7 downto 0) => VALUE(7 downto 0),
      SR(0) => SR(0),
      \SWITCH[7]\(7 downto 0) => D(7 downto 0),
      \VALUE_reg[0]\(0) => CONTROLLER_INST_n_12,
      \VALUE_reg[0]_0\(0) => p_0_in(0),
      \VALUE_reg[0]_1\(0) => \COUNTER_INST/VALUE_reg__0\(0),
      \VALUE_reg[2]\ => DATAPATH_INST_n_1,
      \out\(1) => CONTROLLER_INST_n_0,
      \out\(0) => CONTROLLER_INST_n_1
    );
DATAPATH_INST: entity work.DATAPATH
     port map (
      BTN1_IBUF => BTN1_IBUF,
      BTN3_IBUF => BTN3_IBUF,
      CLK => CLK,
      D(0) => p_0_in(0),
      E(0) => CU_LOADCNT,
      \FSM_sequential_CURRENT_STATE_reg[0]\(0) => CONTROLLER_INST_n_2,
      \FSM_sequential_CURRENT_STATE_reg[0]_0\(0) => CONTROLLER_INST_n_12,
      \FSM_sequential_CURRENT_STATE_reg[1]\ => DATAPATH_INST_n_17,
      \FSM_sequential_CURRENT_STATE_reg[1]_0\(0) => CU_LOADREG,
      \FSM_sequential_CURRENT_STATE_reg[1]_1\(7 downto 0) => p_1_in(7 downto 0),
      Q(0) => \COUNTER_INST/VALUE_reg__0\(0),
      SEGMENT_OBUF(6 downto 0) => SEGMENT_OBUF(6 downto 0),
      SEL(1 downto 0) => SEL(1 downto 0),
      SR(0) => SR(0),
      \SWITCH[7]\(7 downto 0) => D(7 downto 0),
      \VALUE_reg[0]\ => DATAPATH_INST_n_1,
      \VALUE_reg[6]\(7 downto 0) => VALUE(7 downto 0),
      \out\(1) => CONTROLLER_INST_n_0,
      \out\(0) => CONTROLLER_INST_n_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CYCLICSHIFTER is
  port (
    SWITCH : in STD_LOGIC_VECTOR ( 7 downto 0 );
    BTN0 : in STD_LOGIC;
    BTN1 : in STD_LOGIC;
    BTN3 : in STD_LOGIC;
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    SEGMENT : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DP : out STD_LOGIC;
    DIGIT : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of CYCLICSHIFTER : entity is true;
end CYCLICSHIFTER;

architecture STRUCTURE of CYCLICSHIFTER is
  signal BTN0_IBUF : STD_LOGIC;
  signal BTN1_IBUF : STD_LOGIC;
  signal BTN3_IBUF : STD_LOGIC;
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal DIGIT_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal RESET_IBUF : STD_LOGIC;
  signal SEGMENT_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal SEL : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal SWITCH_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
BTN0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTN0,
      O => BTN0_IBUF
    );
BTN1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTN1,
      O => BTN1_IBUF
    );
BTN3_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTN3,
      O => BTN3_IBUF
    );
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
COMPUTE_UNIT_INST: entity work.COMPUTE_UNIT
     port map (
      BTN0_IBUF => BTN0_IBUF,
      BTN1_IBUF => BTN1_IBUF,
      BTN3_IBUF => BTN3_IBUF,
      CLK => CLK_IBUF_BUFG,
      D(7 downto 0) => SWITCH_IBUF(7 downto 0),
      SEGMENT_OBUF(6 downto 0) => SEGMENT_OBUF(6 downto 0),
      SEL(1 downto 0) => SEL(1 downto 0),
      SR(0) => RESET_IBUF
    );
\DIGIT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(0),
      O => DIGIT(0)
    );
\DIGIT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(1),
      O => DIGIT(1)
    );
\DIGIT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(2),
      O => DIGIT(2)
    );
\DIGIT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(3),
      O => DIGIT(3)
    );
DP_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => DP
    );
HEX2SEG_INST: entity work.HEX2SEG
     port map (
      CLK => CLK_IBUF_BUFG,
      DIGIT_OBUF(3 downto 0) => DIGIT_OBUF(3 downto 0),
      SEL(1 downto 0) => SEL(1 downto 0)
    );
RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RESET,
      O => RESET_IBUF
    );
\SEGMENT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(0),
      O => SEGMENT(0)
    );
\SEGMENT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(1),
      O => SEGMENT(1)
    );
\SEGMENT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(2),
      O => SEGMENT(2)
    );
\SEGMENT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(3),
      O => SEGMENT(3)
    );
\SEGMENT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(4),
      O => SEGMENT(4)
    );
\SEGMENT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(5),
      O => SEGMENT(5)
    );
\SEGMENT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(6),
      O => SEGMENT(6)
    );
\SWITCH_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(0),
      O => SWITCH_IBUF(0)
    );
\SWITCH_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(1),
      O => SWITCH_IBUF(1)
    );
\SWITCH_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(2),
      O => SWITCH_IBUF(2)
    );
\SWITCH_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(3),
      O => SWITCH_IBUF(3)
    );
\SWITCH_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(4),
      O => SWITCH_IBUF(4)
    );
\SWITCH_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(5),
      O => SWITCH_IBUF(5)
    );
\SWITCH_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(6),
      O => SWITCH_IBUF(6)
    );
\SWITCH_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SWITCH(7),
      O => SWITCH_IBUF(7)
    );
end STRUCTURE;
