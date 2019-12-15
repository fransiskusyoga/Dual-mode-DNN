project compileoutofdate;
vsim -default_radix unsigned work.tb_F;
add wave sim:/tb_F/*;
add wave sim:/tb_F/CE/*;
run 100000; 