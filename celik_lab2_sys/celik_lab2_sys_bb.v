
module celik_lab2_sys (
	clk_clk,
	reset_reset_n,
	seg1_external_connection_export,
	seg2_external_connection_export,
	seg3_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	seg1_external_connection_export;
	output	[7:0]	seg2_external_connection_export;
	output	[7:0]	seg3_external_connection_export;
endmodule
