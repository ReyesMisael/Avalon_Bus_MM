	component qsys is
		port (
			clk_clk                                : in  std_logic                     := 'X';             -- clk
			custom_logic_0_conduit_end_user_flag_1 : out std_logic;                                        -- user_flag_1
			custom_logic_0_conduit_end_user_flag_0 : out std_logic;                                        -- user_flag_0
			custom_logic_0_conduit_end_user_wrreq  : in  std_logic                     := 'X';             -- user_wrreq
			custom_logic_0_conduit_end_user_data   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- user_data
			custom_logic_0_conduit_end_user_wrclk  : in  std_logic                     := 'X'              -- user_wrclk
		);
	end component qsys;

	u0 : component qsys
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                        clk.clk
			custom_logic_0_conduit_end_user_flag_1 => CONNECTED_TO_custom_logic_0_conduit_end_user_flag_1, -- custom_logic_0_conduit_end.user_flag_1
			custom_logic_0_conduit_end_user_flag_0 => CONNECTED_TO_custom_logic_0_conduit_end_user_flag_0, --                           .user_flag_0
			custom_logic_0_conduit_end_user_wrreq  => CONNECTED_TO_custom_logic_0_conduit_end_user_wrreq,  --                           .user_wrreq
			custom_logic_0_conduit_end_user_data   => CONNECTED_TO_custom_logic_0_conduit_end_user_data,   --                           .user_data
			custom_logic_0_conduit_end_user_wrclk  => CONNECTED_TO_custom_logic_0_conduit_end_user_wrclk   --                           .user_wrclk
		);

