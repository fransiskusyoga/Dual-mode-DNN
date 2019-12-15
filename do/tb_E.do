#compile pproject
project compileoutofdate

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix unsigned work.tb_E;

#add main wave
#add wave sim:/tb_E/*;
add wave -r /*

#run program
run 1000000;
