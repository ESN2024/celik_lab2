library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity celik_lab2 is 
		port (
			clk : in std_logic := '0';
			reset_n : in std_logic :='0';
			SEG1 : out std_logic_vector(7 downto 0);
			SEG2 : out std_logic_vector(7 downto 0);
			SEG3 : out std_logic_vector(7 downto 0)
		);
end entity;


architecture arch of celik_lab2 is 
    
	component celik_lab2_sys is
			port (
				clk_clk                         : in  std_logic                    := 'X'; -- clk
				reset_reset_n                   : in  std_logic                    := 'X'; -- reset_n
				seg1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
				seg2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
				seg3_external_connection_export : out std_logic_vector(3 downto 0)         -- export
			);
	end component celik_lab2_sys;
	 
	 
	component BCD_7_SEG is -- BCD_7_SEG.vhd
			port (
					e : in std_logic_vector(3 downto 0) := (others => 'X'); 
					s : out std_logic_vector(7 downto 0)
			);
	end component BCD_7_SEG;

	
signal seg_1 : std_logic_vector(3 downto 0);
signal seg_2 : std_logic_vector(3 downto 0);
signal seg_3 : std_logic_vector(3 downto 0);


begin
		u0 : component celik_lab2_sys
        port map (
            clk_clk                         => clk,                         				-- clk.clk
            reset_reset_n                   => Reset_n,                   					-- reset.reset_n
            seg1_external_connection_export => seg_1, 											-- seg1_external_connection.export
            seg2_external_connection_export => seg_2, 											-- seg2_external_connection.export
            seg3_external_connection_export => seg_3  											-- seg3_external_connection.export
        );
		  
		u1 : component BCD_7_SEG
			port map (
				e => seg_1,
				s => SEG1
			);
			
		u2 : component BCD_7_SEG
			port map (
				e => seg_2,
				s => SEG2
			);

		u3 : component BCD_7_SEG
			port map (
				e => seg_3,
				s => SEG3
			);
			
end architecture;



