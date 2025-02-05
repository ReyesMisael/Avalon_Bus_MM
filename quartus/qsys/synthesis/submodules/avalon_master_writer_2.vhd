library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

												--Avalon Master write's RAM Avalon Slave
entity avalon_master_writer_2 is
    Port (
        clk              	: in  STD_LOGIC;                     	-- clock signal
        reset_n          	: in  STD_LOGIC;                     	-- reset
		  -- Avalon Master
        write            	: out STD_LOGIC;                     	-- write signal (1 to write)
        chipselect       	: out STD_LOGIC;                     	-- signal to select slave (memory)
        address          	: out STD_LOGIC_VECTOR(31 downto 0); 	-- memory direction
        byteenable         : out STD_LOGIC_VECTOR(3  downto 0);  	-- enable bytes
        writedata          : out STD_LOGIC_VECTOR(31 downto 0); 	-- data to write in memory
        writeresponsevalid : in  STD_LOGIC;       		            -- Response of slave device 
        response         	: in  STD_LOGIC_VECTOR(1 downto 0);  	-- Response of write operation 
        waitrequest      	: in  STD_LOGIC;                      	-- Wait signal, signal turn on when a slave requires a wait time
		  --User
		  user_data				: in  std_logic_vector(31 downto 0);
		  user_wrreq			: in  std_logic;
		  user_wrclk			: in  std_logic;	
		  user_rdempty			: out std_logic;
		  user_fifo_full		: out std_logic
		  
    );
end avalon_master_writer_2;

architecture Behavioral of avalon_master_writer_2 is
	
component user_dcfifo
		PORT
		(
			data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			rdclk			: IN STD_LOGIC ;
			rdreq			: IN STD_LOGIC ;
			wrclk			: IN STD_LOGIC ;
			wrreq			: IN STD_LOGIC ;
			q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			rdempty		: OUT STD_LOGIC ;
			wrfull		: OUT STD_LOGIC 
		);
	end component;
	
	-- fifo signals
	signal rdclk_sig       : std_logic;                      	-- read clock (1 bit)
	signal rdreq_sig       : std_logic;                      	-- read request (1 bit)
	signal q_sig           : std_logic_vector(31 downto 0);  	-- Output signal (32 bits)
	signal rdempty_sig     : std_logic;                      	-- Empty FIFO (1 bit)
	signal wrfull_sig      : std_logic;                      	-- Full FIFO (1 bit)
	
	-- Avalon MM signals
   signal addr_counter 		: integer range 0 to 100 := 0;  		-- counter for memory directions
   signal waitstate    		: boolean := false;              	-- wait cycle

begin
    
    process(clk, reset_n)
    begin
        if reset_n = '1' then
		  
            write 			<= '0';
            chipselect 		<= '0';
				rdclk_sig 		<= '0';
				rdreq_sig 		<= '0';
            address 			<= (others => '0');
            byteenable 		<= "1111";  			-- enable all bytes (32 bits)
            writedata 		<= (others => '0');
            addr_counter 	<= 0;
			        
		  elsif rising_edge(clk) then
           
            if waitstate then
                -- if we detect a wait state do nothing 
					
            else
                
                if addr_counter < 100  then					-- write only when fifo is empty and we do not stands the direction limit
									writedata 			<= q_sig;
                    if (writeresponsevalid = '1' and rdempty_sig = '0') then
									chipselect 			<= '1';					      -- Select device (on chip ram)
									write 				<= '1';	       				-- write signal 	
									byteenable 			<= "1111";
									writedata 			<= q_sig;
									rdreq_sig 			<= '1';
									address 				<= std_logic_vector(to_unsigned(addr_counter, 32));
                        case  response is 										-- to handle response valid is necesary  check documentation of the device with wich you expect the response 
									when  "00" => 
											
											addr_counter	<= addr_counter + 1;		-- contine with the data transmision and increment direction address
										
									when	others =>		-- fail transmision state
										writedata 		<= (others => '0');
										address			<= (others => '0');
										rdreq_sig 		<= '0';
										write 			<= '0';
										byteenable 		<= "0000";
                        end case;
                    end if;
						  
                else
                    write 			<= '0';
                    chipselect 	<= '0';
						  rdreq_sig 	<= '0';
                end if;
            end if;
        end if;
		  
   end process;
	
	
	
	user_dcfifo_inst : user_dcfifo 
		PORT MAP (
			data	 	=> user_data,
			rdclk	 	=> clk,				-- sycronous clock		
			rdreq	 	=> rdreq_sig,		-- source data sig
			wrclk	 	=> user_wrclk,		
			wrreq	 	=> user_wrreq,
			q	 		=> q_sig,			-- source data sig
			rdempty	=> rdempty_sig,	
			wrfull	=> wrfull_sig
	);
	
	user_rdempty	<= rdempty_sig;
	user_fifo_full <= wrfull_sig;
			
end Behavioral;
