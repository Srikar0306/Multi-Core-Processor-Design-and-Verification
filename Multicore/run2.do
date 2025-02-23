vlib work
vdel -all

vlib work
vlog -lint package.sv
vlog -lint alu.sv
vlog -lint cache.sv
vlog -lint processor.sv
<<<<<<< HEAD
<<<<<<< HEAD
=======
vlog -lint arbiter.sv
>>>>>>> c2e9ec6 (CacheDone)
=======
vlog -lint arbiter.sv
>>>>>>> 9a46d3a (Cache updated)

vlog -lint top.sv

vlog -lint tb.sv

vsim -c -voptargs=+acc work.tb_top

add wave -r *

run -all
