project compileoutofdate;

vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix hexadecimal work.tb_K;

add wave sim:/tb_K/*;
add wave sim:/*;

run 100000;