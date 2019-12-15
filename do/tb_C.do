#compile pproject
project compileoutofdate

#add custom radix
do radix.do

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix decimal work.tb_C;

#add main wave
add wave sim:/tb_C/*;

#s
 add wave -radix hexadecimal {out_1 {tb_C/out[23:0]}};
 add wave -radix hexadecimal {out_2 {tb_C/out[47:24]}};
 add wave -radix hexadecimal {out_3 {tb_C/out[71:48]}};
 add wave -radix hexadecimal {out_4 {tb_C/out[95:72]}};
 add wave -radix hexadecimal {out_5 {tb_C/out[119:96]}};
 add wave -radix hexadecimal {out_6 {tb_C/out[143:120]}};
 add wave -radix hexadecimal {out_7 {tb_C/out[167:144]}};
 add wave -radix hexadecimal {out_8 {tb_C/out[191:168]}};
 add wave -radix hexadecimal {out_9 {tb_C/out[215:192]}};
 add wave -radix hexadecimal {out_10 {tb_C/out[239:216]}};
 add wave -radix hexadecimal {out_11 {tb_C/out[263:240]}};
 add wave -radix hexadecimal {out_12 {tb_C/out[287:264]}};
 add wave -radix hexadecimal {out_13 {tb_C/out[311:288]}};
 add wave -radix hexadecimal {out_14 {tb_C/out[335:312]}};
 add wave -radix hexadecimal {out_15 {tb_C/out[359:336]}};
 add wave -radix hexadecimal {out_16 {tb_C/out[383:360]}};
 add wave -radix hexadecimal {out_17 {tb_C/out[407:384]}};
 add wave -radix hexadecimal {out_18 {tb_C/out[431:408]}};
 add wave -radix hexadecimal {out_19 {tb_C/out[455:432]}};
 add wave -radix hexadecimal {out_20 {tb_C/out[479:456]}};
 add wave -radix hexadecimal {out_21 {tb_C/out[503:480]}};
 add wave -radix hexadecimal {out_22 {tb_C/out[527:504]}};
 add wave -radix hexadecimal {out_23 {tb_C/out[551:528]}};
 add wave -radix hexadecimal {out_24 {tb_C/out[575:552]}};
 add wave -radix hexadecimal {out_25 {tb_C/out[599:576]}};
 add wave -radix hexadecimal {out_26 {tb_C/out[623:600]}};
 add wave -radix hexadecimal {out_27 {tb_C/out[647:624]}};
 add wave -radix hexadecimal {out_28 {tb_C/out[671:648]}};
 add wave -radix hexadecimal {out_29 {tb_C/out[695:672]}};
 add wave -radix hexadecimal {out_30 {tb_C/out[719:696]}};
 add wave -radix hexadecimal {out_31 {tb_C/out[743:720]}};
 add wave -radix hexadecimal {out_32 {tb_C/out[767:744]}};
 add wave -radix hexadecimal {out_33 {tb_C/out[791:768]}};
 add wave -radix hexadecimal {out_34 {tb_C/out[815:792]}};
 add wave -radix hexadecimal {out_35 {tb_C/out[839:816]}};
 add wave -radix hexadecimal {out_36 {tb_C/out[863:840]}};
 add wave -radix hexadecimal {out_37 {tb_C/out[887:864]}};
 add wave -radix hexadecimal {out_38 {tb_C/out[911:888]}};
 add wave -radix hexadecimal {out_39 {tb_C/out[935:912]}};
 add wave -radix hexadecimal {out_40 {tb_C/out[959:936]}};

#run program
run 10000;
