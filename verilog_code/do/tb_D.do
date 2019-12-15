#compile pproject
project compileoutofdate

#add custom radix
do radix.do

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix unsigned work.tb_D;

#add main wave
add wave sim:/tb_D/*;

#s
 add wave -radix unsigned {outs_1 {tb_D/outs[23:0]}};
 add wave -radix unsigned {outs_2 {tb_D/outs[47:24]}};
 add wave -radix unsigned {outs_3 {tb_D/outs[71:48]}};
 add wave -radix unsigned {outs_4 {tb_D/outs[95:72]}};
 add wave -radix unsigned {outs_5 {tb_D/outs[119:96]}};
 add wave -radix unsigned {outs_6 {tb_D/outs[143:120]}};
 add wave -radix unsigned {outs_7 {tb_D/outs[167:144]}};
 add wave -radix unsigned {outs_8 {tb_D/outs[191:168]}};
 add wave -radix unsigned {outs_9 {tb_D/outs[215:192]}};
 add wave -radix unsigned {outs_10 {tb_D/outs[239:216]}};
 add wave -radix unsigned {outs_11 {tb_D/outs[263:240]}};
 add wave -radix unsigned {outs_12 {tb_D/outs[287:264]}};
 add wave -radix unsigned {outs_13 {tb_D/outs[311:288]}};
 add wave -radix unsigned {outs_14 {tb_D/outs[335:312]}};
 add wave -radix unsigned {outs_15 {tb_D/outs[359:336]}};
 add wave -radix unsigned {outs_16 {tb_D/outs[383:360]}};
 add wave -radix unsigned {outs_17 {tb_D/outs[407:384]}};
 add wave -radix unsigned {outs_18 {tb_D/outs[431:408]}};
 add wave -radix unsigned {outs_19 {tb_D/outs[455:432]}};
 add wave -radix unsigned {outs_20 {tb_D/outs[479:456]}};
 add wave -radix unsigned {outs_21 {tb_D/outs[503:480]}};
 add wave -radix unsigned {outs_22 {tb_D/outs[527:504]}};
 add wave -radix unsigned {outs_23 {tb_D/outs[551:528]}};
 add wave -radix unsigned {outs_24 {tb_D/outs[575:552]}};
 add wave -radix unsigned {outs_25 {tb_D/outs[599:576]}};
 add wave -radix unsigned {outs_26 {tb_D/outs[623:600]}};
 add wave -radix unsigned {outs_27 {tb_D/outs[647:624]}};
 add wave -radix unsigned {outs_28 {tb_D/outs[671:648]}};
 add wave -radix unsigned {outs_29 {tb_D/outs[695:672]}};
 add wave -radix unsigned {outs_30 {tb_D/outs[719:696]}};
 add wave -radix unsigned {outs_31 {tb_D/outs[743:720]}};
 add wave -radix unsigned {outs_32 {tb_D/outs[767:744]}};
 add wave -radix unsigned {outs_33 {tb_D/outs[791:768]}};
 add wave -radix unsigned {outs_34 {tb_D/outs[815:792]}};
 add wave -radix unsigned {outs_35 {tb_D/outs[839:816]}};
 add wave -radix unsigned {outs_36 {tb_D/outs[863:840]}};
 add wave -radix unsigned {outs_37 {tb_D/outs[887:864]}};
 add wave -radix unsigned {outs_38 {tb_D/outs[911:888]}};
 add wave -radix unsigned {outs_39 {tb_D/outs[935:912]}};
 add wave -radix unsigned {outs_40 {tb_D/outs[959:936]}};
 
#add other wave
#add wave sim:/tb_D/SHREGOUT/muxout1/*;
#add wave sim:/tb_D/SHREGOUT/muxout2/*;

#run program
run 10000;
