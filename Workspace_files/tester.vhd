LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY am29f400b_tester IS
   PORT( 
     clk	   : OUT std_logic;
	 nRst      : OUT std_logic := 'U';
	 S_Addr	   : OUT std_logic_vector(17 downto 0) := (others => 'U');
     S_DIn     : OUT std_logic_vector(15 downto 0) := (others => 'U');
	 S_DOut	   : IN std_logic_vector(15 downto 0) := (others => 'U');
     nCE       : OUT std_logic := 'U';
     nWE       : OUT std_logic := 'U';
     NReady	   : IN    std_logic := 'U';
	 BYTE_FRONT : OUT std_logic := 'U' --1 WORD
   );
-- Declarations
END am29f400b_tester  ;


ARCHITECTURE flow OF am29f400b_tester   IS
BEGIN
   -- Clock process definitions
clock_process :process
begin
     clk <= '0';
     wait for 5 ns;
     clk <= '1';
     wait for 5 ns;
end process;

adr_process :process
begin
     S_Addr <="101010001010101010";
     wait for 130 ns;
     S_Addr <="001000101010101010";
     wait for 100 ns;
end process;

-- Stimulus process
stim_proc: process
begin        
   -- hold reset state for 10 ns.
	BYTE_FRONT <='1';
    nRst <='0';
    wait for 10 ns;
    nRst <='1';
	nCE <='1';
	nWE <= '0';   
    wait for 10 ns;
	
	nCE <='0';
	nWE <= '1';
	wait for 20 ns;
	nCE <='0';
	nWE <= '1';
	
    wait for 160 ns; 	
       	nCE <='1';
	nWE <= '0';
	wait for 10 ns;
	nCE <='0';
	nWE <= '1';
    wait for 50 ns; 	
    nCE <='1';
	nWE <= '0';
	wait for 10 ns;
	nCE <= '0';
	nWE <= '0';
	S_DIn <= "1101101000010010";
	wait for 420 ns;
	BYTE_FRONT <='0';
	S_DIn <= "0000000010010000";
	
	
	
   -- wait for 7000 ns;
   -- reset <= '1';
   -- wait for 10 ns;    
    -- reset <= '0';
    wait;
end process;

END flow;










