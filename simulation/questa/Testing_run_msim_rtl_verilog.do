transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/IDecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/memory_full.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/Delay.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/baseline_c5gx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/CPU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/Shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/IEU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/BCE.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/Splitter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sandro\ Lortkipanidze/Documents/Hardware/Quartus/CPU {C:/Users/Sandro Lortkipanidze/Documents/Hardware/Quartus/CPU/GPR.v}

