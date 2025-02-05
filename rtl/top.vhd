library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	
	port
	(
		clk						: 	in std_logic;
		rst						: 	in std_logic
	
	);
end top;

architecture top_arch of top is

	
   component qsys is
		port (
			clk_clk                                : in  std_logic                     := 'X';             -- clk
			custom_logic_0_conduit_end_user_flag_1 : out std_logic;                                        -- user_flag_1
			custom_logic_0_conduit_end_user_flag_0 : out std_logic;                                        -- user_flag_0
         custom_logic_0_conduit_end_user_wrreq  : in  std_logic                     := 'X';             -- user_wrreq
         custom_logic_0_conduit_end_user_data   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- user_data
         custom_logic_0_conduit_end_user_wrclk  : in  std_logic                                            			-- user_wrclk
       );	
   end component qsys;
		
	 signal cnt 		: integer range 0 to 100 := 0;  		-- counter for memory directions
	 signal wrreq			: std_logic;
	 signal fifo_full		: std_logic;
	 signal fifo_empty	: std_logic;
	 
	
begin

		u0 : component qsys
        port map (
            clk_clk                                      => clk,                                      						--		clk.clk
            custom_logic_0_conduit_end_user_flag_1       => fifo_empty,       														-- 	fifo full
            custom_logic_0_conduit_end_user_flag_0       => fifo_full,       															--    fifo empty
            custom_logic_0_conduit_end_user_wrreq        => wrreq,        																--    .user_wrreq
            custom_logic_0_conduit_end_user_data 			=> std_logic_vector(to_unsigned(cnt, 32)), 							--    .writebyteenable_n
            custom_logic_0_conduit_end_user_wrclk        => clk         																--    .user_wrclk
        );
		    
		count : process(clk,rst) 	
		begin
			if rst = '1' then
			
				cnt <= 0;
				
			elsif rising_edge(clk) then
				
				cnt <= cnt + 1;
				
			end if;
			
		end process; 	
		
		wrreq <= '1';
		
end top_arch;