-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALl;

entity avalon_master_read is

	port (	
		--inputs 
		clk					: in 	std_logic;
		reset_n				: in 	std_logic;
		readdata				: in 	std_logic_vector(31 downto 0);
		response 			: in 	std_logic_vector(1 downto 0);
		readresponsevalid : in  STD_LOGIC;     
		-- outputs 
		byteenable  		: out STD_LOGIC_VECTOR(3  downto 0);  	
		address				: out STD_LOGIC_VECTOR(31 downto 0); 	
		chipselect  		: out STD_LOGIC;
		read					: out std_logic;
		--User
		 user_data			: out  std_logic_vector(31 downto 0);
		 user_rdreq			: in  std_logic;
		 user_rdclk			: in  std_logic;	
		 user_rdempty		: out std_logic;
		 user_fifo_full	: out std_logic
	);

end avalon_master_read;

architecture rtl of avalon_master_read is

		
	component user_dcfifo
		PORT
		(
			data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			rdclk			: IN STD_LOGIC ;
			rdreq			: IN STD_LOGIC ;
			wrclk			: IN STD_LOGIC ;
			wrreq			: IN STD_LOGIC ;
			q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			rdempty		: OUT STD_LOGIC;
			wrfull		: OUT STD_LOGIC 
		);
	end component;
	
	-- fifo signals
	signal wrclk_sig       : std_logic;                      	-- read clock (1 bit)
	signal wrreq_sig       : std_logic;                      	-- read request (1 bit)
	signal rdempty_sig     : std_logic;                      	-- Empty FIFO (1 bit)
	signal wrfull_sig      : std_logic;                      	-- Full FIFO (1 bit)
	
	-- Avalon MM signals
   signal addr_counter 		: integer range 0 to 100 := 0;  		-- counter for memory directions
   signal waitstate    		: boolean := false;              	-- wait cycle

begin
    
    process(clk, reset_n)
    begin
        if reset_n = '1' then
		  
            read 				<= '0';
            chipselect 		<= '0';
				wrclk_sig 		<= '0';
				wrreq_sig 		<= '0';
            address 			<= (others => '0');
            addr_counter 	<= 0;
			        
		  elsif rising_edge(clk) then
           
            if waitstate then
                -- if we detect a wait state do nothing 
					
            else
                
                if addr_counter < 100  then					-- write only when fifo is empty and we do not stands the direction limit
									
                    if (readresponsevalid = '1' and wrfull_sig = '0') then
									chipselect 			<= '1';					      -- Select device (on chip ram)
									read 					<= '1';	       				-- write signal 	
									byteenable 			<= "1111";
									
									wrreq_sig 			<= '1';
									address 				<= std_logic_vector(to_unsigned(addr_counter, 32));
                        case  response is 										-- to handle response valid is necesary  check documentation of the device with wich you expect the response 
									when  "00" => 
											
											addr_counter	<= addr_counter + 1;		-- contine with the data transmision and increment direction address
										
									when	others =>		-- fail transmision state
		
										address			<= (others => '0');
										wrreq_sig 		<= '0';
										read 				<= '0';
										byteenable 		<= "0000";
                        end case;
                    end if;
						  
                else
                    read 			<= '0';
                    chipselect 	<= '0';
						  wrreq_sig 	<= '0';
                end if;
            end if;
        end if;
		  
   end process;
	
	user_dcfifo_read : user_dcfifo 
		PORT MAP (
			data	 	=> readdata,
			rdclk	 	=> user_rdclk,							
			rdreq	 	=> user_rdreq,			
			wrclk	 	=> clk,		
			wrreq	 	=> wrreq_sig,
			q	 		=> user_data,			
			rdempty	=> rdempty_sig,	
			wrfull	=> wrfull_sig
	);
	
	user_rdempty	<= rdempty_sig;
	user_fifo_full <= wrfull_sig;

end rtl;
