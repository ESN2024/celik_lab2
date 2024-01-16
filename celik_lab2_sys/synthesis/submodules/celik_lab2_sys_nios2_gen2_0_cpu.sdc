# Legal Notice: (C)2024 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	celik_lab2_sys_nios2_gen2_0_cpu 	celik_lab2_sys_nios2_gen2_0_cpu:*
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci 	celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci:the_celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci_break 	celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci_break:the_celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci_break
set 	celik_lab2_sys_nios2_gen2_0_cpu_ocimem 	celik_lab2_sys_nios2_gen2_0_cpu_nios2_ocimem:the_celik_lab2_sys_nios2_gen2_0_cpu_nios2_ocimem
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci_debug 	celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci_debug:the_celik_lab2_sys_nios2_gen2_0_cpu_nios2_oci_debug
set 	celik_lab2_sys_nios2_gen2_0_cpu_wrapper 	celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_wrapper:the_celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_wrapper
set 	celik_lab2_sys_nios2_gen2_0_cpu_jtag_tck 	celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_tck:the_celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_tck
set 	celik_lab2_sys_nios2_gen2_0_cpu_jtag_sysclk 	celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_sysclk:the_celik_lab2_sys_nios2_gen2_0_cpu_debug_slave_sysclk
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci_path 	 [format "%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu $celik_lab2_sys_nios2_gen2_0_cpu_oci]
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci_break_path 	 [format "%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu_oci_path $celik_lab2_sys_nios2_gen2_0_cpu_oci_break]
set 	celik_lab2_sys_nios2_gen2_0_cpu_ocimem_path 	 [format "%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu_oci_path $celik_lab2_sys_nios2_gen2_0_cpu_ocimem]
set 	celik_lab2_sys_nios2_gen2_0_cpu_oci_debug_path 	 [format "%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu_oci_path $celik_lab2_sys_nios2_gen2_0_cpu_oci_debug]
set 	celik_lab2_sys_nios2_gen2_0_cpu_jtag_tck_path 	 [format "%s|%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu_oci_path $celik_lab2_sys_nios2_gen2_0_cpu_wrapper $celik_lab2_sys_nios2_gen2_0_cpu_jtag_tck]
set 	celik_lab2_sys_nios2_gen2_0_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $celik_lab2_sys_nios2_gen2_0_cpu_oci_path $celik_lab2_sys_nios2_gen2_0_cpu_wrapper $celik_lab2_sys_nios2_gen2_0_cpu_jtag_sysclk]
set 	celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr 	 [format "%s|*sr" $celik_lab2_sys_nios2_gen2_0_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_oci_break_path|break_readreg*] -to [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sr*    -to *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$celik_lab2_sys_nios2_gen2_0_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$celik_lab2_sys_nios2_gen2_0_cpu_oci_debug_path|monitor_go
