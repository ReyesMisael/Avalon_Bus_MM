library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_avalon_master_read is
end entity tb_avalon_master_read;

architecture sim of tb_avalon_master_read is
    -- Component declaration
    component avalon_master_read
        port ( 
            -- inputs 
            clk                 : in    std_logic;
            reset_n             : in    std_logic;
            readdata            : in    std_logic_vector(31 downto 0);
            response            : in    std_logic_vector(1 downto 0);
            readresponsevalid   : in    std_logic;     
            -- outputs 
            byteenable          : out   std_logic_vector(3  downto 0);      
            address             : out   std_logic_vector(31 downto 0);     
            chipselect          : out   std_logic;
            read                : out   std_logic;
            -- User
            user_data           : out   std_logic_vector(31 downto 0);
            user_rdreq          : in    std_logic;
            user_rdclk          : in    std_logic;  
            user_rdempty        : out   std_logic;
            user_fifo_full      : out   std_logic
        );
    end component;
    
    -- Signals for connecting to the DUT
    signal clk                : std_logic := '0';
    signal reset_n            : std_logic := '0';
    signal readdata           : std_logic_vector(31 downto 0) := (others => '0');
    signal response           : std_logic_vector(1 downto 0) := (others => '0');
    signal readresponsevalid  : std_logic := '0';
    signal byteenable         : std_logic_vector(3 downto 0);
    signal address            : std_logic_vector(31 downto 0);
    signal chipselect         : std_logic;
    signal read               : std_logic;
    signal user_data          : std_logic_vector(31 downto 0);
    signal user_rdreq         : std_logic := '0';
    signal user_rdclk         : std_logic := '0';  
    signal user_rdempty       : std_logic;
    signal user_fifo_full     : std_logic;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Device Under Test (DUT)
    DUT: avalon_master_read
        port map (
            clk                 => clk,
            reset_n             => reset_n,
            readdata            => readdata,
            response            => response,
            readresponsevalid   => readresponsevalid,
            byteenable          => byteenable,      
            address             => address,     
            chipselect          => chipselect,
            read                => read,
            user_data           => user_data,
            user_rdreq          => user_rdreq,
            user_rdclk          => user_rdclk,  
            user_rdempty        => user_rdempty,
            user_fifo_full      => user_fifo_full
        );

    -- Clock generation process
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;
    
    -- Reset and stimulus process
    stim_process: process
    begin
        -- Initialize signals
        reset_n <= '0';
        wait for 20 ns;
        reset_n <= '1';
        
        -- Stimulate inputs as needed
        user_rdclk <= '1';
        wait for 20 ns;
        user_rdclk <= '0';
        
        -- Add further stimuli as needed
        
        -- End simulation
        wait;
    end process;
    
end architecture sim;
