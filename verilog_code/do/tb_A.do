project compileoutofdate;
vsim work.tb_A;
add wave sim:/tb_A/*;
radix signal tb_A/in unsigned;
radix signal tb_A/out hexadecimal;
run 1000; 