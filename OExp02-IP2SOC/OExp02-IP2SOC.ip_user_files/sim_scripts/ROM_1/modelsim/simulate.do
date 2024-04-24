onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ROM_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ROM_1.udo}

run 1000ns

quit -force
