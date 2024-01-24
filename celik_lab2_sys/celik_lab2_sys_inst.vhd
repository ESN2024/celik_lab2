	component celik_lab2_sys is
		port (
			clk_clk                         : in  std_logic                    := 'X'; -- clk
			reset_reset_n                   : in  std_logic                    := 'X'; -- reset_n
			seg1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			seg2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			seg3_external_connection_export : out std_logic_vector(3 downto 0)         -- export
		);
	end component celik_lab2_sys;

	u0 : component celik_lab2_sys
		port map (
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                      clk.clk
			reset_reset_n                   => CONNECTED_TO_reset_reset_n,                   --                    reset.reset_n
			seg1_external_connection_export => CONNECTED_TO_seg1_external_connection_export, -- seg1_external_connection.export
			seg2_external_connection_export => CONNECTED_TO_seg2_external_connection_export, -- seg2_external_connection.export
			seg3_external_connection_export => CONNECTED_TO_seg3_external_connection_export  -- seg3_external_connection.export
		);

