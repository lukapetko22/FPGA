----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2023 03:35:22 PM
-- Design Name: 
-- Module Name: izziv02 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity izziv02 is
  Port 
  (
    CLK : in std_logic;
    LED : out std_logic_vector(15 downto 0);
    SW : in std_logic_vector(1 downto 0);
    RESET_BUTTON : in std_logic
  );
end izziv02;

architecture Behavioral of izziv02 is
    constant CLK_FREQ : integer := 10e6;
    signal CLK_COUNT : integer := 0;
    signal INTERVAL : integer := CLK_FREQ;
    
    signal LED_VECT : unsigned(15 downto 0) := "0000000000001111";
    
    signal DIRECTION : std_logic := '0'; --0 means left, 1 means right
begin

process(CLK, SW, RESET_BUTTON)
    begin
        if SW(0)='1' or SW(1)='1' then
            DIRECTION <= SW(0);
            if SW(1)='0' then
                INTERVAL <= CLK_FREQ;
            else
                INTERVAL <= CLK_FREQ/2;
            end if;
        end if;

        if RESET_BUTTON='1' then
            CLK_COUNT <= 0;
            LED_VECT <= "0000000000001111";
        end if;
    
        if rising_edge(CLK) then
            if CLK_COUNT=INTERVAL then
                CLK_COUNT <= 0;
                
                LED <= std_logic_vector(LED_VECT);
                
                if DIRECTION='0' then
                    LED_VECT <= rotate_left(LED_VECT, 1);
                else
                    LED_VECT <= rotate_right(LED_VECT, 1);
                end if;
                
            else
                CLK_COUNT <= CLK_COUNT + 1;    
            end if;
        end if;
end process;

--process(SW)
--    begin
--        DIRECTION <= SW(0);
--        if SW(1)='0' then
--            INTERVAL <= CLK_FREQ;
--        else
--            INTERVAL <= CLK_FREQ/2;
--        end if;
--end process;

--process(RESET_BUTTON)
--    begin
--        DIRECTION <= '0';
--        INTERVAL <= CLK_FREQ;
--        CLK_COUNT <= 0;
--        LED_VECT <= "0000000000001111";
--end process;

end Behavioral;
