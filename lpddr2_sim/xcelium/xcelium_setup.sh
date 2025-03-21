
# (C) 2001-2024 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 23.1 993 linux 2024.12.15.15:28:53

# ----------------------------------------
# xcelium - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     lpddr2
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# Xcelium Simulation Script.
# To write a top-level shell script that compiles Intel simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "xcelium_sim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/xcelium/xcelium_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# xmvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/xcelium/xcelium_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If lpddr2 is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 23.1 993 linux 2024.12.15.15:28:53
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="lpddr2"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="/home/sandro/intelFPGA_lite/23.1std/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `xmsim -version` != *"xmsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/dll0/
mkdir -p ./libraries/oct0/
mkdir -p ./libraries/c0/
mkdir -p ./libraries/s0/
mkdir -p ./libraries/p0/
mkdir -p ./libraries/pll0/
mkdir -p ./libraries/lpddr2/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cyclonev_ver/
mkdir -p ./libraries/cyclonev_hssi_ver/
mkdir -p ./libraries/cyclonev_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/lpddr2/lpddr2_s0_AC_ROM.hex ./
  cp -f $QSYS_SIMDIR/lpddr2/lpddr2_s0_inst_ROM.hex ./
  cp -f $QSYS_SIMDIR/lpddr2/lpddr2_s0_sequencer_mem.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim_ver     
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                         -work cyclonev_ver         
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                    -work cyclonev_hssi_ver    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"                -work cyclonev_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_dll_cyclonev.sv"                                    -work dll0   -cdslib ./cds_libs/dll0.cds.lib  
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_oct_cyclonev.sv"                                    -work oct0   -cdslib ./cds_libs/oct0.cds.lib  
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_hard_memory_controller_top_cyclonev.sv"             -work c0     -cdslib ./cds_libs/c0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_s0.v"                                                      -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_sequencer_rst.sv"                                   -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/altera_mem_if_sequencer_cpu_cv_sim_cpu_inst.v"                    -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/altera_mem_if_sequencer_cpu_cv_sim_cpu_inst_test_bench.v"         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_scc_mgr.sv"                                             -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_scc_siii_wrapper.sv"                                    -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/sequencer_scc_siii_phase_decode.v"                                -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_scc_sv_wrapper.sv"                                      -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/sequencer_scc_sv_phase_decode.v"                                  -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_scc_acv_wrapper.sv"                                     -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/sequencer_scc_acv_phase_decode.v"                                 -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/sequencer_scc_reg_file.v"                                         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_reg_file.sv"                                            -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/altera_avalon_mm_bridge.v"                                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_simple_avalon_mm_bridge.sv"                         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/sequencer_trk_mgr.sv"                                             -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_mem_if_sequencer_mem_no_ifdef_params.sv"                   -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0.v"                                    -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1.v"                                    -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_irq_mapper.sv"                                          -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_master_translator.sv"                               -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_slave_translator.sv"                                -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_master_agent.sv"                                    -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_slave_agent.sv"                                     -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_burst_uncompressor.sv"                              -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/altera_avalon_sc_fifo.v"                                          -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router.sv"                            -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router_001.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router_002.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router_003.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router_005.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_router_006.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_cmd_demux.sv"                         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_cmd_demux_001.sv"                     -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_cmd_demux_002.sv"                     -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_cmd_mux.sv"                           -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_arbitrator.sv"                                      -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_cmd_mux_003.sv"                       -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_rsp_mux.sv"                           -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_rsp_mux_001.sv"                       -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_rsp_mux_002.sv"                       -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_avalon_st_adapter.v"                  -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_router.sv"                            -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_router_001.sv"                        -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_traffic_limiter.sv"                                 -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altera_merlin_reorder_memory.sv"                                  -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/altera_avalon_st_pipeline_base.v"                                 -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_cmd_demux.sv"                         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_cmd_mux.sv"                           -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_rsp_demux.sv"                         -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_1_rsp_mux.sv"                           -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_s0_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work s0     -cdslib ./cds_libs/s0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_clock_pair_generator.v"                                 -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_acv_hard_addr_cmd_pads.v"                               -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_acv_hard_memphy.v"                                      -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_acv_ldc.v"                                              -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_acv_hard_io_pads.v"                                     -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_generic_ddio.v"                                         -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_reset.v"                                                -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_reset_sync.v"                                           -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_p0_phy_csr.sv"                                             -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_iss_probe.v"                                            -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_p0.sv"                                                     -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_p0_altdqdqs.v"                                             -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/altdq_dqs2_acv_connect_to_hard_phy_cyclonev_lpddr2.sv"            -work p0     -cdslib ./cds_libs/p0.cds.lib    
  xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/lpddr2/lpddr2_pll0.sv"                                                   -work pll0   -cdslib ./cds_libs/pll0.cds.lib  
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2/lpddr2_0002.v"                                                    -work lpddr2 -cdslib ./cds_libs/lpddr2.cds.lib
  xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lpddr2.v"                                                                                                              
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  xmelab -update -access +w+r+c -namemap_mixgen +DISABLEGENCHK $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval xmsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
