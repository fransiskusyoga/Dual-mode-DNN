#compile pproject
project compileoutofdate

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix decimal work.tb_B;

#add main wave
add wave sim:/tb_B/*;
#add wave sim:/tb_B/SHRin/*;

#
 add wave -radix decimal {out_1 {tb_B/out[15:0]}};
 add wave -radix decimal {out_2 {tb_B/out[31:16]}};
 add wave -radix decimal {out_3 {tb_B/out[47:32]}};
 add wave -radix decimal {out_4 {tb_B/out[63:48]}};
 add wave -radix decimal {out_5 {tb_B/out[79:64]}};
 add wave -radix decimal {out_6 {tb_B/out[95:80]}};
 add wave -radix decimal {out_7 {tb_B/out[111:96]}};
 add wave -radix decimal {out_8 {tb_B/out[127:112]}};
 add wave -radix decimal {out_9 {tb_B/out[143:128]}};
 add wave -radix decimal {out_10 {tb_B/out[159:144]}};
 add wave -radix decimal {out_11 {tb_B/out[175:160]}};
 add wave -radix decimal {out_12 {tb_B/out[191:176]}};
 add wave -radix decimal {out_13 {tb_B/out[207:192]}};
 add wave -radix decimal {out_14 {tb_B/out[223:208]}};
 add wave -radix decimal {out_15 {tb_B/out[239:224]}};
 add wave -radix decimal {out_16 {tb_B/out[255:240]}};
 add wave -radix decimal {out_17 {tb_B/out[271:256]}};
 add wave -radix decimal {out_18 {tb_B/out[287:272]}};
 add wave -radix decimal {out_19 {tb_B/out[303:288]}};
 add wave -radix decimal {out_20 {tb_B/out[319:304]}};
 add wave -radix decimal {out_21 {tb_B/out[335:320]}};
 add wave -radix decimal {out_22 {tb_B/out[351:336]}};
 add wave -radix decimal {out_23 {tb_B/out[367:352]}};
 add wave -radix decimal {out_24 {tb_B/out[383:368]}};
 add wave -radix decimal {out_25 {tb_B/out[399:384]}};
 add wave -radix decimal {out_26 {tb_B/out[415:400]}};
 add wave -radix decimal {out_27 {tb_B/out[431:416]}};
 add wave -radix decimal {out_28 {tb_B/out[447:432]}};
 add wave -radix decimal {out_29 {tb_B/out[463:448]}};
 add wave -radix decimal {out_30 {tb_B/out[479:464]}};
 add wave -radix decimal {out_31 {tb_B/out[495:480]}};
 add wave -radix decimal {out_32 {tb_B/out[511:496]}};
 add wave -radix decimal {out_33 {tb_B/out[527:512]}};
 add wave -radix decimal {out_34 {tb_B/out[543:528]}};
 add wave -radix decimal {out_35 {tb_B/out[559:544]}};
 add wave -radix decimal {out_36 {tb_B/out[575:560]}};
 add wave -radix decimal {out_37 {tb_B/out[591:576]}};
 add wave -radix decimal {out_38 {tb_B/out[607:592]}};
 add wave -radix decimal {out_39 {tb_B/out[623:608]}};
 add wave -radix decimal {out_40 {tb_B/out[639:624]}};

#run program
run 10000;
