--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:22:43 04/27/2014
-- Design Name:   
-- Module Name:   C:/Users/C15Colin.Busho/Documents/ECE383/FinalProjectBusho/OBDII_tb.vhd
-- Project Name:  FinalProjectBusho
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OBDII
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY OBDII_tb IS
END OBDII_tb;
 
ARCHITECTURE behavior OF OBDII_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OBDII
    PORT(
         Identifier_IN : IN  std_logic_vector(10 downto 0);
         Identifier_OUT : OUT  std_logic_vector(10 downto 0);
         DLC_IN : IN  std_logic_vector(3 downto 0);
         DLC_OUT : OUT  std_logic_vector(3 downto 0);
         Data_OUT : OUT  std_logic_vector(7 downto 0);
         JB : INOUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         button : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Identifier_IN : std_logic_vector(10 downto 0) := (others => '0');
   signal DLC_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal button : std_logic := '0';

	--BiDirs
   signal JB : std_logic_vector(7 downto 0);

 	--Outputs
   signal Identifier_OUT : std_logic_vector(10 downto 0);
   signal DLC_OUT : std_logic_vector(3 downto 0);
   signal Data_OUT : std_logic_vector(7 downto 0);
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OBDII PORT MAP (
          Identifier_IN => Identifier_IN,
          Identifier_OUT => Identifier_OUT,
          DLC_IN => DLC_IN,
          DLC_OUT => DLC_OUT,
          Data_OUT => Data_OUT,
          JB => JB,
          clk => clk,
          reset => reset,
          button => button,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;
		reset <= '0';
		
      -- insert stimulus here 
		
		
      wait;
   end process;

END;
