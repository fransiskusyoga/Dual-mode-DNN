project compileoutofdate;
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix unsigned work.tb_H;
add wave sim:/tb_H/*;
add wave sim:/tb_H/MEMZ/*;
run 100000; 