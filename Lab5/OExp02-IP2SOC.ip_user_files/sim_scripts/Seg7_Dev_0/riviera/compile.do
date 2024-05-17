vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"D:/Vivado/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"D:/Vivado/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../OExp02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/DisplaySync.v" \
"../../../../OExp02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/MC_14495.v" \
"../../../../OExp02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/Seg7_Dev.v" \
"../../../../OExp02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/sim/Seg7_Dev_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

