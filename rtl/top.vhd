library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
	
	port
	(
		clk						: 	in std_logic;
		RstAll					: 	in std_logic;
		finish					: 	out std_logic;
		--avalon interface
		write						:	out STD_LOGIC;
		chipselect				:	out STD_LOGIC;
		address					:	out STD_LOGIC_VECTOR(31 DOWNTO 0);
		byteenable				:	out STD_LOGIC_VECTOR(3 DOWNTO 0);
		writedata				:	out STD_LOGIC_VECTOR(31 DOWNTO 0);
		writeresponsevalid	:	in STD_LOGIC;
		response					:	in STD_LOGIC_VECTOR(1 DOWNTO 0);
		waitrequest				:	in STD_LOGIC
	);
end top;


architecture top_arch of top is

	
	COMPONENT avalon_master_writer_2
		PORT
		(
			clk						:	 IN STD_LOGIC;
			reset_n					:	 IN STD_LOGIC;
			write						:	 OUT STD_LOGIC;
			chipselect				:	 OUT STD_LOGIC;
			address					:	 OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			byteenable				:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			writedata				:	 OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			writeresponsevalid	:	 IN STD_LOGIC;
			response					:	 IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			waitrequest				:	 IN STD_LOGIC;
			user_data				:	 IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			user_wrreq				:	 IN STD_LOGIC;
			user_wrclk				:	 IN STD_LOGIC;
			user_rdempty			:	 OUT STD_LOGIC;
			user_fifo_full			:	 OUT STD_LOGIC
		);
	END COMPONENT;
	
	
	
	

begin




	

	

end top_arch;
