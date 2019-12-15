#compile pproject
#project compileoutofdate
project compileall

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix hexadecimal work.tb_Z;

#add custom radix
do do/radix.do

#add main wave
add wave sim:/tb_Z/*;
add wave sim:/tb_Z/NNC/*;
radix signal tb_Z/NNC/in hexadecimal;

#add wave sim:/tb_Z/NNC/CTRLEng/*;


 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_stage;
#
 add wave -radix fx24 {outs_1 {tb_Z/NNC/out_bus[23:0]}};
 add wave -radix fx24 {outs_2 {tb_Z/NNC/out_bus[47:24]}};
 add wave -radix fx24 {outs_3 {tb_Z/NNC/out_bus[71:48]}};
 add wave -radix fx24 {outs_4 {tb_Z/NNC/out_bus[95:72]}};
 add wave -radix fx24 {outs_5 {tb_Z/NNC/out_bus[119:96]}};
 add wave -radix fx24 {outs_6 {tb_Z/NNC/out_bus[143:120]}};
 add wave -radix fx24 {outs_7 {tb_Z/NNC/out_bus[167:144]}};
 add wave -radix fx24 {outs_8 {tb_Z/NNC/out_bus[191:168]}};
 add wave -radix fx24 {outs_9 {tb_Z/NNC/out_bus[215:192]}};
 add wave -radix fx24 {outs_10 {tb_Z/NNC/out_bus[239:216]}};
 add wave -radix fx24 {outs_11 {tb_Z/NNC/out_bus[263:240]}};
 add wave -radix fx24 {outs_12 {tb_Z/NNC/out_bus[287:264]}};
 add wave -radix fx24 {outs_13 {tb_Z/NNC/out_bus[311:288]}};
 add wave -radix fx24 {outs_14 {tb_Z/NNC/out_bus[335:312]}};
 add wave -radix fx24 {outs_15 {tb_Z/NNC/out_bus[359:336]}};
 add wave -radix fx24 {outs_16 {tb_Z/NNC/out_bus[383:360]}};
 add wave -radix fx24 {outs_17 {tb_Z/NNC/out_bus[407:384]}};
 add wave -radix fx24 {outs_18 {tb_Z/NNC/out_bus[431:408]}};
 add wave -radix fx24 {outs_19 {tb_Z/NNC/out_bus[455:432]}};
 add wave -radix fx24 {outs_20 {tb_Z/NNC/out_bus[479:456]}};
 add wave -radix fx24 {outs_21 {tb_Z/NNC/out_bus[503:480]}};
 add wave -radix fx24 {outs_22 {tb_Z/NNC/out_bus[527:504]}};
 add wave -radix fx24 {outs_23 {tb_Z/NNC/out_bus[551:528]}};
 add wave -radix fx24 {outs_24 {tb_Z/NNC/out_bus[575:552]}};
 add wave -radix fx24 {outs_25 {tb_Z/NNC/out_bus[599:576]}};
 add wave -radix fx24 {outs_26 {tb_Z/NNC/out_bus[623:600]}};
 add wave -radix fx24 {outs_27 {tb_Z/NNC/out_bus[647:624]}};
 add wave -radix fx24 {outs_28 {tb_Z/NNC/out_bus[671:648]}};
 add wave -radix fx24 {outs_29 {tb_Z/NNC/out_bus[695:672]}};
 add wave -radix fx24 {outs_30 {tb_Z/NNC/out_bus[719:696]}};
 add wave -radix fx24 {outs_31 {tb_Z/NNC/out_bus[743:720]}};
 add wave -radix fx24 {outs_32 {tb_Z/NNC/out_bus[767:744]}};
 add wave -radix fx24 {outs_33 {tb_Z/NNC/out_bus[791:768]}};
 add wave -radix fx24 {outs_34 {tb_Z/NNC/out_bus[815:792]}};
 add wave -radix fx24 {outs_35 {tb_Z/NNC/out_bus[839:816]}};
 add wave -radix fx24 {outs_36 {tb_Z/NNC/out_bus[863:840]}};
 add wave -radix fx24 {outs_37 {tb_Z/NNC/out_bus[887:864]}};
 add wave -radix fx24 {outs_38 {tb_Z/NNC/out_bus[911:888]}};
 add wave -radix fx24 {outs_39 {tb_Z/NNC/out_bus[935:912]}};
 add wave -radix fx24 {outs_40 {tb_Z/NNC/out_bus[959:936]}};

 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_stage;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_stage;
#
 add wave -radix hexadecimal {a_1 {tb_Z/NNC/a_bus[23:0]}};
 add wave -radix hexadecimal {a_2 {tb_Z/NNC/a_bus[47:24]}};
 add wave -radix hexadecimal {a_3 {tb_Z/NNC/a_bus[71:48]}};
 add wave -radix hexadecimal {a_4 {tb_Z/NNC/a_bus[95:72]}};
 add wave -radix hexadecimal {a_5 {tb_Z/NNC/a_bus[119:96]}};
 add wave -radix hexadecimal {a_6 {tb_Z/NNC/a_bus[143:120]}};
 add wave -radix hexadecimal {a_7 {tb_Z/NNC/a_bus[167:144]}};
 add wave -radix hexadecimal {a_8 {tb_Z/NNC/a_bus[191:168]}};
 add wave -radix hexadecimal {a_9 {tb_Z/NNC/a_bus[215:192]}};
 add wave -radix hexadecimal {a_10 {tb_Z/NNC/a_bus[239:216]}};
 add wave -radix hexadecimal {a_11 {tb_Z/NNC/a_bus[263:240]}};
 add wave -radix hexadecimal {a_12 {tb_Z/NNC/a_bus[287:264]}};
 add wave -radix hexadecimal {a_13 {tb_Z/NNC/a_bus[311:288]}};
 add wave -radix hexadecimal {a_14 {tb_Z/NNC/a_bus[335:312]}};
 add wave -radix hexadecimal {a_15 {tb_Z/NNC/a_bus[359:336]}};
 add wave -radix hexadecimal {a_16 {tb_Z/NNC/a_bus[383:360]}};
 add wave -radix hexadecimal {a_17 {tb_Z/NNC/a_bus[407:384]}};
 add wave -radix hexadecimal {a_18 {tb_Z/NNC/a_bus[431:408]}};
 add wave -radix hexadecimal {a_19 {tb_Z/NNC/a_bus[455:432]}};
 add wave -radix hexadecimal {a_20 {tb_Z/NNC/a_bus[479:456]}};
 add wave -radix hexadecimal {a_21 {tb_Z/NNC/a_bus[503:480]}};
 add wave -radix hexadecimal {a_22 {tb_Z/NNC/a_bus[527:504]}};
 add wave -radix hexadecimal {a_23 {tb_Z/NNC/a_bus[551:528]}};
 add wave -radix hexadecimal {a_24 {tb_Z/NNC/a_bus[575:552]}};
 add wave -radix hexadecimal {a_25 {tb_Z/NNC/a_bus[599:576]}};
 add wave -radix hexadecimal {a_26 {tb_Z/NNC/a_bus[623:600]}};
 add wave -radix hexadecimal {a_27 {tb_Z/NNC/a_bus[647:624]}};
 add wave -radix hexadecimal {a_28 {tb_Z/NNC/a_bus[671:648]}};
 add wave -radix hexadecimal {a_29 {tb_Z/NNC/a_bus[695:672]}};
 add wave -radix hexadecimal {a_30 {tb_Z/NNC/a_bus[719:696]}};
 add wave -radix hexadecimal {a_31 {tb_Z/NNC/a_bus[743:720]}};
 add wave -radix hexadecimal {a_32 {tb_Z/NNC/a_bus[767:744]}};
 add wave -radix hexadecimal {a_33 {tb_Z/NNC/a_bus[791:768]}};
 add wave -radix hexadecimal {a_34 {tb_Z/NNC/a_bus[815:792]}};
 add wave -radix hexadecimal {a_35 {tb_Z/NNC/a_bus[839:816]}};
 add wave -radix hexadecimal {a_36 {tb_Z/NNC/a_bus[863:840]}};
 add wave -radix hexadecimal {a_37 {tb_Z/NNC/a_bus[887:864]}};
 add wave -radix hexadecimal {a_38 {tb_Z/NNC/a_bus[911:888]}};
 add wave -radix hexadecimal {a_39 {tb_Z/NNC/a_bus[935:912]}};
 add wave -radix hexadecimal {a_40 {tb_Z/NNC/a_bus[959:936]}};

 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_stage;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_stage;
#
 add wave -radix fx24 {x_1 {tb_Z/NNC/x_bus[23:0]}};
 add wave -radix fx24 {x_2 {tb_Z/NNC/x_bus[47:24]}};
 add wave -radix fx24 {x_3 {tb_Z/NNC/x_bus[71:48]}};
 add wave -radix fx24 {x_4 {tb_Z/NNC/x_bus[95:72]}};
 add wave -radix fx24 {x_5 {tb_Z/NNC/x_bus[119:96]}};
 add wave -radix fx24 {x_6 {tb_Z/NNC/x_bus[143:120]}};
 add wave -radix fx24 {x_7 {tb_Z/NNC/x_bus[167:144]}};
 add wave -radix fx24 {x_8 {tb_Z/NNC/x_bus[191:168]}};
 add wave -radix fx24 {x_9 {tb_Z/NNC/x_bus[215:192]}};
 add wave -radix fx24 {x_10 {tb_Z/NNC/x_bus[239:216]}};
 add wave -radix fx24 {x_11 {tb_Z/NNC/x_bus[263:240]}};
 add wave -radix fx24 {x_12 {tb_Z/NNC/x_bus[287:264]}};
 add wave -radix fx24 {x_13 {tb_Z/NNC/x_bus[311:288]}};
 add wave -radix fx24 {x_14 {tb_Z/NNC/x_bus[335:312]}};
 add wave -radix fx24 {x_15 {tb_Z/NNC/x_bus[359:336]}};
 add wave -radix fx24 {x_16 {tb_Z/NNC/x_bus[383:360]}};
 add wave -radix fx24 {x_17 {tb_Z/NNC/x_bus[407:384]}};
 add wave -radix fx24 {x_18 {tb_Z/NNC/x_bus[431:408]}};
 add wave -radix fx24 {x_19 {tb_Z/NNC/x_bus[455:432]}};
 add wave -radix fx24 {x_20 {tb_Z/NNC/x_bus[479:456]}};
 add wave -radix fx24 {x_21 {tb_Z/NNC/x_bus[503:480]}};
 add wave -radix fx24 {x_22 {tb_Z/NNC/x_bus[527:504]}};
 add wave -radix fx24 {x_23 {tb_Z/NNC/x_bus[551:528]}};
 add wave -radix fx24 {x_24 {tb_Z/NNC/x_bus[575:552]}};
 add wave -radix fx24 {x_25 {tb_Z/NNC/x_bus[599:576]}};
 add wave -radix fx24 {x_26 {tb_Z/NNC/x_bus[623:600]}};
 add wave -radix fx24 {x_27 {tb_Z/NNC/x_bus[647:624]}};
 add wave -radix fx24 {x_28 {tb_Z/NNC/x_bus[671:648]}};
 add wave -radix fx24 {x_29 {tb_Z/NNC/x_bus[695:672]}};
 add wave -radix fx24 {x_30 {tb_Z/NNC/x_bus[719:696]}};
 add wave -radix fx24 {x_31 {tb_Z/NNC/x_bus[743:720]}};
 add wave -radix fx24 {x_32 {tb_Z/NNC/x_bus[767:744]}};
 add wave -radix fx24 {x_33 {tb_Z/NNC/x_bus[791:768]}};
 add wave -radix fx24 {x_34 {tb_Z/NNC/x_bus[815:792]}};
 add wave -radix fx24 {x_35 {tb_Z/NNC/x_bus[839:816]}};
 add wave -radix fx24 {x_36 {tb_Z/NNC/x_bus[863:840]}};
 add wave -radix fx24 {x_37 {tb_Z/NNC/x_bus[887:864]}};
 add wave -radix fx24 {x_38 {tb_Z/NNC/x_bus[911:888]}};
 add wave -radix fx24 {x_39 {tb_Z/NNC/x_bus[935:912]}};
 add wave -radix fx24 {x_40 {tb_Z/NNC/x_bus[959:936]}};

  add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_stage;
 add wave -radix unsigned sim:/tb_Z/NNC/mode_SHRin;
 add wave -radix unsigned sim:/tb_Z/NNC/slcin0_SHRin;
 add wave -radix unsigned sim:/tb_Z/NNC/slcaddr_SHRin;
 add wave -radix fx16 sim:/tb_Z/NNC/in0_SHRin;
 add wave -radix fx16 sim:/tb_Z/NNC/outAF;
 add wave -radix fx16 sim:/tb_Z/NNC/addr_SHRin;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_stage;
#
 add wave -radix fx16 {b_1 {tb_Z/NNC/b_bus[15:0]}};
# add wave -radix fx16 {wrn {tb_Z/NNC/SHRin/wrenbus[1]}};
# add wave -radix fx16 sim:tb_Z/NNC/SHRin/REG1/in0;
# add wave -radix fx16 sim:tb_Z/NNC/SHRin/REG1/in1;
# add wave -radix fx16 sim:tb_Z/NNC/SHRin/REG1/reg0;
 add wave -radix fx16 {b_2 {tb_Z/NNC/b_bus[31:16]}};
 add wave -radix fx16 {b_3 {tb_Z/NNC/b_bus[47:32]}};
 add wave -radix fx16 {b_4 {tb_Z/NNC/b_bus[63:48]}};
 add wave -radix fx16 {b_5 {tb_Z/NNC/b_bus[79:64]}};
 add wave -radix fx16 {b_6 {tb_Z/NNC/b_bus[95:80]}};
 add wave -radix fx16 {b_7 {tb_Z/NNC/b_bus[111:96]}};
 add wave -radix fx16 {b_8 {tb_Z/NNC/b_bus[127:112]}};
 add wave -radix fx16 {b_9 {tb_Z/NNC/b_bus[143:128]}};
 add wave -radix fx16 {b_10 {tb_Z/NNC/b_bus[159:144]}};
 add wave -radix fx16 {b_11 {tb_Z/NNC/b_bus[175:160]}};
 add wave -radix fx16 {b_12 {tb_Z/NNC/b_bus[191:176]}};
 add wave -radix fx16 {b_13 {tb_Z/NNC/b_bus[207:192]}};
 add wave -radix fx16 {b_14 {tb_Z/NNC/b_bus[223:208]}};
 add wave -radix fx16 {b_15 {tb_Z/NNC/b_bus[239:224]}};
 add wave -radix fx16 {b_16 {tb_Z/NNC/b_bus[255:240]}};
 add wave -radix fx16 {b_17 {tb_Z/NNC/b_bus[271:256]}};
 add wave -radix fx16 {b_18 {tb_Z/NNC/b_bus[287:272]}};
 add wave -radix fx16 {b_19 {tb_Z/NNC/b_bus[303:288]}};
 add wave -radix fx16 {b_20 {tb_Z/NNC/b_bus[319:304]}};
 add wave -radix fx16 {b_21 {tb_Z/NNC/b_bus[335:320]}};
 add wave -radix fx16 {b_22 {tb_Z/NNC/b_bus[351:336]}};
 add wave -radix fx16 {b_23 {tb_Z/NNC/b_bus[367:352]}};
 add wave -radix fx16 {b_24 {tb_Z/NNC/b_bus[383:368]}};
 add wave -radix fx16 {b_25 {tb_Z/NNC/b_bus[399:384]}};
 add wave -radix fx16 {b_26 {tb_Z/NNC/b_bus[415:400]}};
 add wave -radix fx16 {b_27 {tb_Z/NNC/b_bus[431:416]}};
 add wave -radix fx16 {b_28 {tb_Z/NNC/b_bus[447:432]}};
 add wave -radix fx16 {b_29 {tb_Z/NNC/b_bus[463:448]}};
 add wave -radix fx16 {b_30 {tb_Z/NNC/b_bus[479:464]}};
 add wave -radix fx16 {b_31 {tb_Z/NNC/b_bus[495:480]}};
 add wave -radix fx16 {b_32 {tb_Z/NNC/b_bus[511:496]}};
 add wave -radix fx16 {b_33 {tb_Z/NNC/b_bus[527:512]}};
 add wave -radix fx16 {b_34 {tb_Z/NNC/b_bus[543:528]}};
 add wave -radix fx16 {b_35 {tb_Z/NNC/b_bus[559:544]}};
 add wave -radix fx16 {b_36 {tb_Z/NNC/b_bus[575:560]}};
 add wave -radix fx16 {b_37 {tb_Z/NNC/b_bus[591:576]}};
 add wave -radix fx16 {b_38 {tb_Z/NNC/b_bus[607:592]}};
 add wave -radix fx16 {b_39 {tb_Z/NNC/b_bus[623:608]}};
 add wave -radix fx16 {b_40 {tb_Z/NNC/b_bus[639:624]}};

 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_stage;
 add wave -radix unsigned sim:/tb_Z/NNC/mode_SSHRin;
 add wave -radix fx24 sim:/tb_Z/NNC/outS;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/rd_stage;
#
 add wave -radix fx24 {s_bus1 {tb_Z/NNC/s_bus[23:0]}};
 add wave -radix fx24 {s_bus2 {tb_Z/NNC/s_bus[47:24]}};
 add wave -radix fx24 {s_bus3 {tb_Z/NNC/s_bus[71:48]}};
 add wave -radix fx24 {s_bus4 {tb_Z/NNC/s_bus[95:72]}};
 add wave -radix fx24 {s_bus5 {tb_Z/NNC/s_bus[119:96]}};
 add wave -radix fx24 {s_bus6 {tb_Z/NNC/s_bus[143:120]}};
 add wave -radix fx24 {s_bus7 {tb_Z/NNC/s_bus[167:144]}};
 add wave -radix fx24 {s_bus8 {tb_Z/NNC/s_bus[191:168]}};
 add wave -radix fx24 {s_bus9 {tb_Z/NNC/s_bus[215:192]}};
 add wave -radix fx24 {s_bus10 {tb_Z/NNC/s_bus[239:216]}};
 add wave -radix fx24 {s_bus11 {tb_Z/NNC/s_bus[263:240]}};
 add wave -radix fx24 {s_bus12 {tb_Z/NNC/s_bus[287:264]}};
 add wave -radix fx24 {s_bus13 {tb_Z/NNC/s_bus[311:288]}};
 add wave -radix fx24 {s_bus14 {tb_Z/NNC/s_bus[335:312]}};
 add wave -radix fx24 {s_bus15 {tb_Z/NNC/s_bus[359:336]}};
 add wave -radix fx24 {s_bus16 {tb_Z/NNC/s_bus[383:360]}};
 add wave -radix fx24 {s_bus17 {tb_Z/NNC/s_bus[407:384]}};
 add wave -radix fx24 {s_bus18 {tb_Z/NNC/s_bus[431:408]}};
 add wave -radix fx24 {s_bus19 {tb_Z/NNC/s_bus[455:432]}};
 add wave -radix fx24 {s_bus20 {tb_Z/NNC/s_bus[479:456]}};
 add wave -radix fx24 {s_bus21 {tb_Z/NNC/s_bus[503:480]}};
 add wave -radix fx24 {s_bus22 {tb_Z/NNC/s_bus[527:504]}};
 add wave -radix fx24 {s_bus23 {tb_Z/NNC/s_bus[551:528]}};
 add wave -radix fx24 {s_bus24 {tb_Z/NNC/s_bus[575:552]}};
 add wave -radix fx24 {s_bus25 {tb_Z/NNC/s_bus[599:576]}};
 add wave -radix fx24 {s_bus26 {tb_Z/NNC/s_bus[623:600]}};
 add wave -radix fx24 {s_bus27 {tb_Z/NNC/s_bus[647:624]}};
 add wave -radix fx24 {s_bus28 {tb_Z/NNC/s_bus[671:648]}};
 add wave -radix fx24 {s_bus29 {tb_Z/NNC/s_bus[695:672]}};
 add wave -radix fx24 {s_bus30 {tb_Z/NNC/s_bus[719:696]}};
 add wave -radix fx24 {s_bus31 {tb_Z/NNC/s_bus[743:720]}};
 add wave -radix fx24 {s_bus32 {tb_Z/NNC/s_bus[767:744]}};
 add wave -radix fx24 {s_bus33 {tb_Z/NNC/s_bus[791:768]}};
 add wave -radix fx24 {s_bus34 {tb_Z/NNC/s_bus[815:792]}};
 add wave -radix fx24 {s_bus35 {tb_Z/NNC/s_bus[839:816]}};
 add wave -radix fx24 {s_bus36 {tb_Z/NNC/s_bus[863:840]}};
 add wave -radix fx24 {s_bus37 {tb_Z/NNC/s_bus[887:864]}};
 add wave -radix fx24 {s_bus38 {tb_Z/NNC/s_bus[911:888]}};
 add wave -radix fx24 {s_bus39 {tb_Z/NNC/s_bus[935:912]}};
 add wave -radix fx24 {s_bus40 {tb_Z/NNC/s_bus[959:936]}};

 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_step;
 add wave -radix unsigned sim:/tb_Z/NNC/CTRLEng/wr_stage;
 
#add wave -r tb_Z/NNC/TD/altsyncram_component/*
#add wave tb_Z/NNC/SHRin/*;
#add wave tb_Z/NNC/SHRin/wrenbus[0];
#run program
run 300000;
