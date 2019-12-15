#compile pproject
project compileoutofdate

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix hexadecimal work.tb_H;

#add radix
do do/radix.do


#create special bus
 add wave -radix fx24 {out_1 {tb_H/BUS_OUT[23:0]}};
 add wave -radix fx24 {out_2 {tb_H/BUS_OUT[47:24]}};
 add wave -radix fx24 {out_3 {tb_H/BUS_OUT[71:48]}};
 add wave -radix fx24 {out_4 {tb_H/BUS_OUT[95:72]}};
 add wave -radix fx24 {out_5 {tb_H/BUS_OUT[119:96]}};
 add wave -radix fx24 {out_6 {tb_H/BUS_OUT[143:120]}};
 add wave -radix fx24 {out_7 {tb_H/BUS_OUT[167:144]}};
 add wave -radix fx24 {out_8 {tb_H/BUS_OUT[191:168]}};
 add wave -radix fx24 {out_9 {tb_H/BUS_OUT[215:192]}};
 add wave -radix fx24 {out_10 {tb_H/BUS_OUT[239:216]}};
 add wave -radix fx24 {out_11 {tb_H/BUS_OUT[263:240]}};
 add wave -radix fx24 {out_12 {tb_H/BUS_OUT[287:264]}};
 add wave -radix fx24 {out_13 {tb_H/BUS_OUT[311:288]}};
 add wave -radix fx24 {out_14 {tb_H/BUS_OUT[335:312]}};
 add wave -radix fx24 {out_15 {tb_H/BUS_OUT[359:336]}};
 add wave -radix fx24 {out_16 {tb_H/BUS_OUT[383:360]}};
 add wave -radix fx24 {out_17 {tb_H/BUS_OUT[407:384]}};
 add wave -radix fx24 {out_18 {tb_H/BUS_OUT[431:408]}};
 add wave -radix fx24 {out_19 {tb_H/BUS_OUT[455:432]}};
 add wave -radix fx24 {out_20 {tb_H/BUS_OUT[479:456]}};
 add wave -radix fx24 {out_21 {tb_H/BUS_OUT[503:480]}};
 add wave -radix fx24 {out_22 {tb_H/BUS_OUT[527:504]}};
 add wave -radix fx24 {out_23 {tb_H/BUS_OUT[551:528]}};
 add wave -radix fx24 {out_24 {tb_H/BUS_OUT[575:552]}};
 add wave -radix fx24 {out_25 {tb_H/BUS_OUT[599:576]}};
 add wave -radix fx24 {out_26 {tb_H/BUS_OUT[623:600]}};
 add wave -radix fx24 {out_27 {tb_H/BUS_OUT[647:624]}};
 add wave -radix fx24 {out_28 {tb_H/BUS_OUT[671:648]}};
 add wave -radix fx24 {out_29 {tb_H/BUS_OUT[695:672]}};
 add wave -radix fx24 {out_30 {tb_H/BUS_OUT[719:696]}};
 add wave -radix fx24 {out_31 {tb_H/BUS_OUT[743:720]}};
 add wave -radix fx24 {out_32 {tb_H/BUS_OUT[767:744]}};
 add wave -radix fx24 {out_33 {tb_H/BUS_OUT[791:768]}};
 add wave -radix fx24 {out_34 {tb_H/BUS_OUT[815:792]}};
 add wave -radix fx24 {out_35 {tb_H/BUS_OUT[839:816]}};
 add wave -radix fx24 {out_36 {tb_H/BUS_OUT[863:840]}};
 add wave -radix fx24 {out_37 {tb_H/BUS_OUT[887:864]}};
 add wave -radix fx24 {out_38 {tb_H/BUS_OUT[911:888]}};
 add wave -radix fx24 {out_39 {tb_H/BUS_OUT[935:912]}};
 add wave -radix fx24 {out_40 {tb_H/BUS_OUT[959:936]}};

#add wave w2
 add wave -radix fx24 {in0_1 {tb_H/BUS_IN0[23:0]}};
 add wave -radix fx24 {in0_2 {tb_H/BUS_IN0[47:24]}};
 add wave -radix fx24 {in0_3 {tb_H/BUS_IN0[71:48]}};
 add wave -radix fx24 {in0_4 {tb_H/BUS_IN0[95:72]}};
 add wave -radix fx24 {in0_5 {tb_H/BUS_IN0[119:96]}};
 add wave -radix fx24 {in0_6 {tb_H/BUS_IN0[143:120]}};
 add wave -radix fx24 {in0_7 {tb_H/BUS_IN0[167:144]}};
 add wave -radix fx24 {in0_8 {tb_H/BUS_IN0[191:168]}};
 add wave -radix fx24 {in0_9 {tb_H/BUS_IN0[215:192]}};
 add wave -radix fx24 {in0_10 {tb_H/BUS_IN0[239:216]}};
 add wave -radix fx24 {in0_11 {tb_H/BUS_IN0[263:240]}};
 add wave -radix fx24 {in0_12 {tb_H/BUS_IN0[287:264]}};
 add wave -radix fx24 {in0_13 {tb_H/BUS_IN0[311:288]}};
 add wave -radix fx24 {in0_14 {tb_H/BUS_IN0[335:312]}};
 add wave -radix fx24 {in0_15 {tb_H/BUS_IN0[359:336]}};
 add wave -radix fx24 {in0_16 {tb_H/BUS_IN0[383:360]}};
 add wave -radix fx24 {in0_17 {tb_H/BUS_IN0[407:384]}};
 add wave -radix fx24 {in0_18 {tb_H/BUS_IN0[431:408]}};
 add wave -radix fx24 {in0_19 {tb_H/BUS_IN0[455:432]}};
 add wave -radix fx24 {in0_20 {tb_H/BUS_IN0[479:456]}};
 add wave -radix fx24 {in0_21 {tb_H/BUS_IN0[503:480]}};
 add wave -radix fx24 {in0_22 {tb_H/BUS_IN0[527:504]}};
 add wave -radix fx24 {in0_23 {tb_H/BUS_IN0[551:528]}};
 add wave -radix fx24 {in0_24 {tb_H/BUS_IN0[575:552]}};
 add wave -radix fx24 {in0_25 {tb_H/BUS_IN0[599:576]}};
 add wave -radix fx24 {in0_26 {tb_H/BUS_IN0[623:600]}};
 add wave -radix fx24 {in0_27 {tb_H/BUS_IN0[647:624]}};
 add wave -radix fx24 {in0_28 {tb_H/BUS_IN0[671:648]}};
 add wave -radix fx24 {in0_29 {tb_H/BUS_IN0[695:672]}};
 add wave -radix fx24 {in0_30 {tb_H/BUS_IN0[719:696]}};
 add wave -radix fx24 {in0_31 {tb_H/BUS_IN0[743:720]}};
 add wave -radix fx24 {in0_32 {tb_H/BUS_IN0[767:744]}};
 add wave -radix fx24 {in0_33 {tb_H/BUS_IN0[791:768]}};
 add wave -radix fx24 {in0_34 {tb_H/BUS_IN0[815:792]}};
 add wave -radix fx24 {in0_35 {tb_H/BUS_IN0[839:816]}};
 add wave -radix fx24 {in0_36 {tb_H/BUS_IN0[863:840]}};
 add wave -radix fx24 {in0_37 {tb_H/BUS_IN0[887:864]}};
 add wave -radix fx24 {in0_38 {tb_H/BUS_IN0[911:888]}};
 add wave -radix fx24 {in0_39 {tb_H/BUS_IN0[935:912]}};
 add wave -radix fx24 {in0_40 {tb_H/BUS_IN0[959:936]}};

 
 add wave sim:/tb_H/clk;
 add wave sim:/tb_H/rst;
 add wave -radix decimal sim:/tb_H/cstep;
 add wave -radix decimal sim:/tb_H/cpart;
 add wave -radix decimal sim:/tb_H/cstage;
 add wave -radix decimal sim:/tb_H/cepoch;

 add wave -radix fx16 {in1_1 {tb_H/BUS_IN1[15:0]}};
 add wave -radix fx16 {in1_2 {tb_H/BUS_IN1[31:16]}};
 add wave -radix fx16 {in1_3 {tb_H/BUS_IN1[47:32]}};
 add wave -radix fx16 {in1_4 {tb_H/BUS_IN1[63:48]}};
 add wave -radix fx16 {in1_5 {tb_H/BUS_IN1[79:64]}};
 add wave -radix fx16 {in1_6 {tb_H/BUS_IN1[95:80]}};
 add wave -radix fx16 {in1_7 {tb_H/BUS_IN1[111:96]}};
 add wave -radix fx16 {in1_8 {tb_H/BUS_IN1[127:112]}};
 add wave -radix fx16 {in1_9 {tb_H/BUS_IN1[143:128]}};
 add wave -radix fx16 {in1_10 {tb_H/BUS_IN1[159:144]}};
 add wave -radix fx16 {in1_11 {tb_H/BUS_IN1[175:160]}};
 add wave -radix fx16 {in1_12 {tb_H/BUS_IN1[191:176]}};
 add wave -radix fx16 {in1_13 {tb_H/BUS_IN1[207:192]}};
 add wave -radix fx16 {in1_14 {tb_H/BUS_IN1[223:208]}};
 add wave -radix fx16 {in1_15 {tb_H/BUS_IN1[239:224]}};
 add wave -radix fx16 {in1_16 {tb_H/BUS_IN1[255:240]}};
 add wave -radix fx16 {in1_17 {tb_H/BUS_IN1[271:256]}};
 add wave -radix fx16 {in1_18 {tb_H/BUS_IN1[287:272]}};
 add wave -radix fx16 {in1_19 {tb_H/BUS_IN1[303:288]}};
 add wave -radix fx16 {in1_20 {tb_H/BUS_IN1[319:304]}};
 add wave -radix fx16 {in1_21 {tb_H/BUS_IN1[335:320]}};
 add wave -radix fx16 {in1_22 {tb_H/BUS_IN1[351:336]}};
 add wave -radix fx16 {in1_23 {tb_H/BUS_IN1[367:352]}};
 add wave -radix fx16 {in1_24 {tb_H/BUS_IN1[383:368]}};
 add wave -radix fx16 {in1_25 {tb_H/BUS_IN1[399:384]}};
 add wave -radix fx16 {in1_26 {tb_H/BUS_IN1[415:400]}};
 add wave -radix fx16 {in1_27 {tb_H/BUS_IN1[431:416]}};
 add wave -radix fx16 {in1_28 {tb_H/BUS_IN1[447:432]}};
 add wave -radix fx16 {in1_29 {tb_H/BUS_IN1[463:448]}};
 add wave -radix fx16 {in1_30 {tb_H/BUS_IN1[479:464]}};
 add wave -radix fx16 {in1_31 {tb_H/BUS_IN1[495:480]}};
 add wave -radix fx16 {in1_32 {tb_H/BUS_IN1[511:496]}};
 add wave -radix fx16 {in1_33 {tb_H/BUS_IN1[527:512]}};
 add wave -radix fx16 {in1_34 {tb_H/BUS_IN1[543:528]}};
 add wave -radix fx16 {in1_35 {tb_H/BUS_IN1[559:544]}};
 add wave -radix fx16 {in1_36 {tb_H/BUS_IN1[575:560]}};
 add wave -radix fx16 {in1_37 {tb_H/BUS_IN1[591:576]}};
 add wave -radix fx16 {in1_38 {tb_H/BUS_IN1[607:592]}};
 add wave -radix fx16 {in1_39 {tb_H/BUS_IN1[623:608]}};
 add wave -radix fx16 {in1_40 {tb_H/BUS_IN1[639:624]}};
#Create all dataset
#add other wave
#add wave -r /*;
#run program
run 100000;
