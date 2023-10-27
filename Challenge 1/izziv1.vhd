----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2023 06:21:54 PM
-- Design Name: 
-- Module Name: izziv1 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity izziv1 is
        Port ( 
               NUM1 : in STD_LOGIC_VECTOR(3 downto 0);
               NUM2 : in STD_LOGIC_VECTOR(3 downto 0);
               LED : out STD_LOGIC_VECTOR(1 downto 0)
               );
end izziv1;

architecture Behavioral of izziv1 is

begin

LED <= "10" when NUM1 > NUM2 else
       "01" when NUM2 > NUM1 else
       "00";
    

end Behavioral;
