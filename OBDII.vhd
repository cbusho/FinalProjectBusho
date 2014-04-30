----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:28 04/24/2014 
-- Design Name: 
-- Module Name:    OBDII - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OBDII is
    Port ( Identifier_IN : in  STD_LOGIC_VECTOR (10 downto 0);
           Identifier_OUT : out  STD_LOGIC_VECTOR (10 downto 0);
           DLC_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           DLC_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           --Data_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Data_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
			  JB : inout STD_LOGIC_VECTOR (7 downto 0);
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  button: in STD_LOGIC;		  
			  led: out STD_LOGIC_VECTOR (7 downto 0));
end OBDII;

architecture Behavioral of OBDII is

signal id : std_logic_vector(10 downto 0);
signal dlc : std_logic_vector(3 downto 0);
signal data, data_in: std_logic_vector(7 downto 0);
signal jb_sig : std_logic_vector(22 downto 0);
signal count_reg, count_next : unsigned(5 downto 0);

begin
	id <= "111" & X"DF";
	dlc <= X"1";
	data <= "0000" & X"A";
	
	Identifier_OUT <= id;
	DLC_OUT <= dlc;
	DATA_OUT <= data;
	
	jb_sig <= id & dlc & data;
	
	--JB(0) <= jb_sig(count_reg) when (count_reg >= 0) and (count_reg <= 22) else '-';
	--data_in(count_reg - 23) <= JB(1) when (count_reg <= 30) and (count_reg >= 23);
	
	
--JB controls
	process(count_reg, jb_sig, reset)
	begin
		if reset = '1' then
			JB(0) <= '1';
		elsif count_reg = 22 then
			JB(0) <= jb_sig(22);
		elsif count_reg = 21 then
			JB(0) <= jb_sig(21);
		elsif count_reg = 20 then
			JB(0) <= jb_sig(20);
		elsif count_reg = 19 then
			JB(0) <= jb_sig(19);
		elsif count_reg = 18 then
			JB(0) <= jb_sig(18);
		elsif count_reg = 17 then
			JB(0) <= jb_sig(17);
		elsif count_reg = 16 then
			JB(0) <= jb_sig(16);
		elsif count_reg = 15 then
			JB(0) <= jb_sig(15);
		elsif count_reg = 14 then
			JB(0) <= jb_sig(14);
		elsif count_reg = 13 then
			JB(0) <= jb_sig(13);
		elsif count_reg = 12 then
			JB(0) <= jb_sig(12);
		elsif count_reg = 11 then
			JB(0) <= jb_sig(11);
		elsif count_reg = 10 then
			JB(0) <= jb_sig(10);
		elsif count_reg = 9 then
			JB(0) <= jb_sig(9);
		elsif count_reg = 8 then
			JB(0) <= jb_sig(8);
		elsif count_reg = 7 then
			JB(0) <= jb_sig(7);
		elsif count_reg = 6 then
			JB(0) <= jb_sig(6);
		elsif count_reg = 5 then
			JB(0) <= jb_sig(5);
		elsif count_reg = 4 then
			JB(0) <= jb_sig(4);	
		elsif count_reg = 3 then
			JB(0) <= jb_sig(3);	
		elsif count_reg = 2 then
			JB(0) <= jb_sig(2);	
		elsif count_reg = 1 then
			JB(0) <= jb_sig(1);	
		elsif count_reg = 0 then
			JB(0) <= jb_sig(0);				
		else
			JB(0) <= '0';
		end if;
	end process;

	process(count_reg, JB, reset)
	begin
		data_in <= "00000000";
		if(count_reg = 30) then
			data_in(7) <= JB(1);
		elsif(count_reg = 29) then
			data_in(6) <= JB(1);
		elsif(count_reg = 28) then
			data_in(5) <= JB(1);
		elsif(count_reg = 27) then
			data_in(4) <= JB(1);
		elsif(count_reg = 26) then
			data_in(3) <= JB(1);
		elsif(count_reg = 25) then
			data_in(2) <= JB(1);
		elsif(count_reg = 24) then
			data_in(1) <= JB(1);
		elsif(count_reg = 23) then
			data_in(0) <= JB(1);
		end if;	
	end process;	
	
--count register
	process(clk, reset, data_in)
	begin 
		if (reset = '1') then
			count_reg <= to_unsigned(45,6);
			led <= "00000000";
		elsif (rising_edge(clk)) then
			count_reg <= count_next;
			led <= data_in;
		end if;
	end process;

-- count logic

		count_next <= count_reg - 1 when (count_reg >= 0) and (count_reg < 46) else
						  to_unsigned(45,6);	
	


end Behavioral;

