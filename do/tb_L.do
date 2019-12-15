project compileoutofdate;

vsim work.tb_L;

add wave sim:/tb_L/*;
#add wave sim:/tb_L/sram_interface/*;

run 10000;