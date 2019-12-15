#compile pproject
project compileoutofdate

#add wave
vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -default_radix hexadecimal work.tb_I;

#add custom radix
do do/radix.do

#add main wave
add wave sim:/tb_I/*;
radix signal tb_I/in hexadecimal;

add wave -radix unsigned sim:/tb_I/cntr;
#
 add wave -radix fx24 {outs_1 {tb_I/out_bus[23:0]}};
 add wave -radix fx24 {outs_2 {tb_I/out_bus[47:24]}};
 add wave -radix fx24 {outs_3 {tb_I/out_bus[71:48]}};
 add wave -radix fx24 {outs_4 {tb_I/out_bus[95:72]}};
 add wave -radix fx24 {outs_5 {tb_I/out_bus[119:96]}};
 add wave -radix fx24 {outs_6 {tb_I/out_bus[143:120]}};
 add wave -radix fx24 {outs_7 {tb_I/out_bus[167:144]}};
 add wave -radix fx24 {outs_8 {tb_I/out_bus[191:168]}};
 add wave -radix fx24 {outs_9 {tb_I/out_bus[215:192]}};
 add wave -radix fx24 {outs_10 {tb_I/out_bus[239:216]}};
 add wave -radix fx24 {outs_11 {tb_I/out_bus[263:240]}};
 add wave -radix fx24 {outs_12 {tb_I/out_bus[287:264]}};
 add wave -radix fx24 {outs_13 {tb_I/out_bus[311:288]}};
 add wave -radix fx24 {outs_14 {tb_I/out_bus[335:312]}};
 add wave -radix fx24 {outs_15 {tb_I/out_bus[359:336]}};
 add wave -radix fx24 {outs_16 {tb_I/out_bus[383:360]}};
 add wave -radix fx24 {outs_17 {tb_I/out_bus[407:384]}};
 add wave -radix fx24 {outs_18 {tb_I/out_bus[431:408]}};
 add wave -radix fx24 {outs_19 {tb_I/out_bus[455:432]}};
 add wave -radix fx24 {outs_20 {tb_I/out_bus[479:456]}};
 add wave -radix fx24 {outs_21 {tb_I/out_bus[503:480]}};
 add wave -radix fx24 {outs_22 {tb_I/out_bus[527:504]}};
 add wave -radix fx24 {outs_23 {tb_I/out_bus[551:528]}};
 add wave -radix fx24 {outs_24 {tb_I/out_bus[575:552]}};
 add wave -radix fx24 {outs_25 {tb_I/out_bus[599:576]}};
 add wave -radix fx24 {outs_26 {tb_I/out_bus[623:600]}};
 add wave -radix fx24 {outs_27 {tb_I/out_bus[647:624]}};
 add wave -radix fx24 {outs_28 {tb_I/out_bus[671:648]}};
 add wave -radix fx24 {outs_29 {tb_I/out_bus[695:672]}};
 add wave -radix fx24 {outs_30 {tb_I/out_bus[719:696]}};
 add wave -radix fx24 {outs_31 {tb_I/out_bus[743:720]}};
 add wave -radix fx24 {outs_32 {tb_I/out_bus[767:744]}};
 add wave -radix fx24 {outs_33 {tb_I/out_bus[791:768]}};
 add wave -radix fx24 {outs_34 {tb_I/out_bus[815:792]}};
 add wave -radix fx24 {outs_35 {tb_I/out_bus[839:816]}};
 add wave -radix fx24 {outs_36 {tb_I/out_bus[863:840]}};
 add wave -radix fx24 {outs_37 {tb_I/out_bus[887:864]}};
 add wave -radix fx24 {outs_38 {tb_I/out_bus[911:888]}};
 add wave -radix fx24 {outs_39 {tb_I/out_bus[935:912]}};
 add wave -radix fx24 {outs_40 {tb_I/out_bus[959:936]}};

 add wave -radix unsigned sim:/tb_I/cntr;
#
 add wave -radix fx24 {a_1 {tb_I/a_bus[23:0]}};
 add wave -radix fx24 {a_2 {tb_I/a_bus[47:24]}};
 add wave -radix fx24 {a_3 {tb_I/a_bus[71:48]}};
 add wave -radix fx24 {a_4 {tb_I/a_bus[95:72]}};
 add wave -radix fx24 {a_5 {tb_I/a_bus[119:96]}};
 add wave -radix fx24 {a_6 {tb_I/a_bus[143:120]}};
 add wave -radix fx24 {a_7 {tb_I/a_bus[167:144]}};
 add wave -radix fx24 {a_8 {tb_I/a_bus[191:168]}};
 add wave -radix fx24 {a_9 {tb_I/a_bus[215:192]}};
 add wave -radix fx24 {a_10 {tb_I/a_bus[239:216]}};
 add wave -radix fx24 {a_11 {tb_I/a_bus[263:240]}};
 add wave -radix fx24 {a_12 {tb_I/a_bus[287:264]}};
 add wave -radix fx24 {a_13 {tb_I/a_bus[311:288]}};
 add wave -radix fx24 {a_14 {tb_I/a_bus[335:312]}};
 add wave -radix fx24 {a_15 {tb_I/a_bus[359:336]}};
 add wave -radix fx24 {a_16 {tb_I/a_bus[383:360]}};
 add wave -radix fx24 {a_17 {tb_I/a_bus[407:384]}};
 add wave -radix fx24 {a_18 {tb_I/a_bus[431:408]}};
 add wave -radix fx24 {a_19 {tb_I/a_bus[455:432]}};
 add wave -radix fx24 {a_20 {tb_I/a_bus[479:456]}};
 add wave -radix fx24 {a_21 {tb_I/a_bus[503:480]}};
 add wave -radix fx24 {a_22 {tb_I/a_bus[527:504]}};
 add wave -radix fx24 {a_23 {tb_I/a_bus[551:528]}};
 add wave -radix fx24 {a_24 {tb_I/a_bus[575:552]}};
 add wave -radix fx24 {a_25 {tb_I/a_bus[599:576]}};
 add wave -radix fx24 {a_26 {tb_I/a_bus[623:600]}};
 add wave -radix fx24 {a_27 {tb_I/a_bus[647:624]}};
 add wave -radix fx24 {a_28 {tb_I/a_bus[671:648]}};
 add wave -radix fx24 {a_29 {tb_I/a_bus[695:672]}};
 add wave -radix fx24 {a_30 {tb_I/a_bus[719:696]}};
 add wave -radix fx24 {a_31 {tb_I/a_bus[743:720]}};
 add wave -radix fx24 {a_32 {tb_I/a_bus[767:744]}};
 add wave -radix fx24 {a_33 {tb_I/a_bus[791:768]}};
 add wave -radix fx24 {a_34 {tb_I/a_bus[815:792]}};
 add wave -radix fx24 {a_35 {tb_I/a_bus[839:816]}};
 add wave -radix fx24 {a_36 {tb_I/a_bus[863:840]}};
 add wave -radix fx24 {a_37 {tb_I/a_bus[887:864]}};
 add wave -radix fx24 {a_38 {tb_I/a_bus[911:888]}};
 add wave -radix fx24 {a_39 {tb_I/a_bus[935:912]}};
 add wave -radix fx24 {a_40 {tb_I/a_bus[959:936]}};

 add wave -radix unsigned sim:/tb_I/cntr;
#
 add wave -radix fx24 {x_1 {tb_I/x_bus[23:0]}};
 add wave -radix fx24 {x_2 {tb_I/x_bus[47:24]}};
 add wave -radix fx24 {x_3 {tb_I/x_bus[71:48]}};
 add wave -radix fx24 {x_4 {tb_I/x_bus[95:72]}};
 add wave -radix fx24 {x_5 {tb_I/x_bus[119:96]}};
 add wave -radix fx24 {x_6 {tb_I/x_bus[143:120]}};
 add wave -radix fx24 {x_7 {tb_I/x_bus[167:144]}};
 add wave -radix fx24 {x_8 {tb_I/x_bus[191:168]}};
 add wave -radix fx24 {x_9 {tb_I/x_bus[215:192]}};
 add wave -radix fx24 {x_10 {tb_I/x_bus[239:216]}};
 add wave -radix fx24 {x_11 {tb_I/x_bus[263:240]}};
 add wave -radix fx24 {x_12 {tb_I/x_bus[287:264]}};
 add wave -radix fx24 {x_13 {tb_I/x_bus[311:288]}};
 add wave -radix fx24 {x_14 {tb_I/x_bus[335:312]}};
 add wave -radix fx24 {x_15 {tb_I/x_bus[359:336]}};
 add wave -radix fx24 {x_16 {tb_I/x_bus[383:360]}};
 add wave -radix fx24 {x_17 {tb_I/x_bus[407:384]}};
 add wave -radix fx24 {x_18 {tb_I/x_bus[431:408]}};
 add wave -radix fx24 {x_19 {tb_I/x_bus[455:432]}};
 add wave -radix fx24 {x_20 {tb_I/x_bus[479:456]}};
 add wave -radix fx24 {x_21 {tb_I/x_bus[503:480]}};
 add wave -radix fx24 {x_22 {tb_I/x_bus[527:504]}};
 add wave -radix fx24 {x_23 {tb_I/x_bus[551:528]}};
 add wave -radix fx24 {x_24 {tb_I/x_bus[575:552]}};
 add wave -radix fx24 {x_25 {tb_I/x_bus[599:576]}};
 add wave -radix fx24 {x_26 {tb_I/x_bus[623:600]}};
 add wave -radix fx24 {x_27 {tb_I/x_bus[647:624]}};
 add wave -radix fx24 {x_28 {tb_I/x_bus[671:648]}};
 add wave -radix fx24 {x_29 {tb_I/x_bus[695:672]}};
 add wave -radix fx24 {x_30 {tb_I/x_bus[719:696]}};
 add wave -radix fx24 {x_31 {tb_I/x_bus[743:720]}};
 add wave -radix fx24 {x_32 {tb_I/x_bus[767:744]}};
 add wave -radix fx24 {x_33 {tb_I/x_bus[791:768]}};
 add wave -radix fx24 {x_34 {tb_I/x_bus[815:792]}};
 add wave -radix fx24 {x_35 {tb_I/x_bus[839:816]}};
 add wave -radix fx24 {x_36 {tb_I/x_bus[863:840]}};
 add wave -radix fx24 {x_37 {tb_I/x_bus[887:864]}};
 add wave -radix fx24 {x_38 {tb_I/x_bus[911:888]}};
 add wave -radix fx24 {x_39 {tb_I/x_bus[935:912]}};
 add wave -radix fx24 {x_40 {tb_I/x_bus[959:936]}};

 add wave -radix unsigned sim:/tb_I/cntr;
#
 add wave -radix fx16 {b_1 {tb_I/b_bus[15:0]}};
 add wave -radix fx16 {b_2 {tb_I/b_bus[31:16]}};
 add wave -radix fx16 {b_3 {tb_I/b_bus[47:32]}};
 add wave -radix fx16 {b_4 {tb_I/b_bus[63:48]}};
 add wave -radix fx16 {b_5 {tb_I/b_bus[79:64]}};
 add wave -radix fx16 {b_6 {tb_I/b_bus[95:80]}};
 add wave -radix fx16 {b_7 {tb_I/b_bus[111:96]}};
 add wave -radix fx16 {b_8 {tb_I/b_bus[127:112]}};
 add wave -radix fx16 {b_9 {tb_I/b_bus[143:128]}};
 add wave -radix fx16 {b_10 {tb_I/b_bus[159:144]}};
 add wave -radix fx16 {b_11 {tb_I/b_bus[175:160]}};
 add wave -radix fx16 {b_12 {tb_I/b_bus[191:176]}};
 add wave -radix fx16 {b_13 {tb_I/b_bus[207:192]}};
 add wave -radix fx16 {b_14 {tb_I/b_bus[223:208]}};
 add wave -radix fx16 {b_15 {tb_I/b_bus[239:224]}};
 add wave -radix fx16 {b_16 {tb_I/b_bus[255:240]}};
 add wave -radix fx16 {b_17 {tb_I/b_bus[271:256]}};
 add wave -radix fx16 {b_18 {tb_I/b_bus[287:272]}};
 add wave -radix fx16 {b_19 {tb_I/b_bus[303:288]}};
 add wave -radix fx16 {b_20 {tb_I/b_bus[319:304]}};
 add wave -radix fx16 {b_21 {tb_I/b_bus[335:320]}};
 add wave -radix fx16 {b_22 {tb_I/b_bus[351:336]}};
 add wave -radix fx16 {b_23 {tb_I/b_bus[367:352]}};
 add wave -radix fx16 {b_24 {tb_I/b_bus[383:368]}};
 add wave -radix fx16 {b_25 {tb_I/b_bus[399:384]}};
 add wave -radix fx16 {b_26 {tb_I/b_bus[415:400]}};
 add wave -radix fx16 {b_27 {tb_I/b_bus[431:416]}};
 add wave -radix fx16 {b_28 {tb_I/b_bus[447:432]}};
 add wave -radix fx16 {b_29 {tb_I/b_bus[463:448]}};
 add wave -radix fx16 {b_30 {tb_I/b_bus[479:464]}};
 add wave -radix fx16 {b_31 {tb_I/b_bus[495:480]}};
 add wave -radix fx16 {b_32 {tb_I/b_bus[511:496]}};
 add wave -radix fx16 {b_33 {tb_I/b_bus[527:512]}};
 add wave -radix fx16 {b_34 {tb_I/b_bus[543:528]}};
 add wave -radix fx16 {b_35 {tb_I/b_bus[559:544]}};
 add wave -radix fx16 {b_36 {tb_I/b_bus[575:560]}};
 add wave -radix fx16 {b_37 {tb_I/b_bus[591:576]}};
 add wave -radix fx16 {b_38 {tb_I/b_bus[607:592]}};
 add wave -radix fx16 {b_39 {tb_I/b_bus[623:608]}};
 add wave -radix fx16 {b_40 {tb_I/b_bus[639:624]}};

add wave -radix unsigned sim:/tb_I/cntr;
#
 add wave -radix fx24 {outs_1 {tb_I/CE/PERCEP0/outmul1}};
 add wave -radix fx24 {outs_2 {tb_I/CE/PERCEP1/outmul1}};
 add wave -radix fx24 {outs_3 {tb_I/CE/PERCEP2/outmul1}};
 add wave -radix fx24 {outs_4 {tb_I/CE/PERCEP3/outmul1}};
 add wave -radix fx24 {outs_5 {tb_I/CE/PERCEP4/outmul1}};
 add wave -radix fx24 {outs_6 {tb_I/CE/PERCEP5/outmul1}};
 add wave -radix fx24 {outs_7 {tb_I/CE/PERCEP6/outmul1}};
 add wave -radix fx24 {outs_8 {tb_I/CE/PERCEP7/outmul1}};
 add wave -radix fx24 {outs_9 {tb_I/CE/PERCEP8/outmul1}};
 add wave -radix fx24 {outs_10 {tb_I/CE/PERCEP9/outmul1}};
 add wave -radix fx24 {outs_11 {tb_I/CE/PERCEP10/outmul1}};
 add wave -radix fx24 {outs_12 {tb_I/CE/PERCEP11/outmul1}};
 add wave -radix fx24 {outs_13 {tb_I/CE/PERCEP12/outmul1}};
 add wave -radix fx24 {outs_14 {tb_I/CE/PERCEP13/outmul1}};
 add wave -radix fx24 {outs_15 {tb_I/CE/PERCEP14/outmul1}};
 add wave -radix fx24 {outs_16 {tb_I/CE/PERCEP15/outmul1}};
 add wave -radix fx24 {outs_17 {tb_I/CE/PERCEP16/outmul1}};
 add wave -radix fx24 {outs_18 {tb_I/CE/PERCEP17/outmul1}};
 add wave -radix fx24 {outs_19 {tb_I/CE/PERCEP18/outmul1}};
 add wave -radix fx24 {outs_20 {tb_I/CE/PERCEP19/outmul1}};
 add wave -radix fx24 {outs_21 {tb_I/CE/PERCEP20/outmul1}};
 add wave -radix fx24 {outs_22 {tb_I/CE/PERCEP21/outmul1}};
 add wave -radix fx24 {outs_23 {tb_I/CE/PERCEP22/outmul1}};
 add wave -radix fx24 {outs_24 {tb_I/CE/PERCEP23/outmul1}};
 add wave -radix fx24 {outs_25 {tb_I/CE/PERCEP24/outmul1}};
 add wave -radix fx24 {outs_26 {tb_I/CE/PERCEP25/outmul1}};
 add wave -radix fx24 {outs_27 {tb_I/CE/PERCEP26/outmul1}};
 add wave -radix fx24 {outs_28 {tb_I/CE/PERCEP27/outmul1}};
 add wave -radix fx24 {outs_29 {tb_I/CE/PERCEP28/outmul1}};
 add wave -radix fx24 {outs_30 {tb_I/CE/PERCEP29/outmul1}};
 add wave -radix fx24 {outs_31 {tb_I/CE/PERCEP30/outmul1}};
 add wave -radix fx24 {outs_32 {tb_I/CE/PERCEP31/outmul1}};
 add wave -radix fx24 {outs_33 {tb_I/CE/PERCEP32/outmul1}};
 add wave -radix fx24 {outs_34 {tb_I/CE/PERCEP33/outmul1}};
 add wave -radix fx24 {outs_35 {tb_I/CE/PERCEP34/outmul1}};
 add wave -radix fx24 {outs_36 {tb_I/CE/PERCEP35/outmul1}};
 add wave -radix fx24 {outs_37 {tb_I/CE/PERCEP36/outmul1}};
 add wave -radix fx24 {outs_38 {tb_I/CE/PERCEP37/outmul1}};
 add wave -radix fx24 {outs_39 {tb_I/CE/PERCEP38/outmul1}};
 add wave -radix fx24 {outs_40 {tb_I/CE/PERCEP39/outmul1}};
 
#add wave -r tb_I/TD/altsyncram_component/*
#run program
run 40000;
