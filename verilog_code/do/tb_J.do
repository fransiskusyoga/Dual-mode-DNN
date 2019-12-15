project compileoutofdate;

vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix hexadecimal work.tb_J;

add wave sim:/tb_J/*;
add wave sim:/tb_J/SW/*;
add wave sim:/tb_J/SW/SC/*;

run 100000;