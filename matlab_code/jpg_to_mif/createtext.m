str= "";
%add wave {outX {tb_H/data_out[i*24-1:(i-1)*24]}};
for i=1:40
  temp = "add wave -radix fx16 {in1_" + int2str(i) + " {tb_H/data_out[";
  start = (i-1)*16;
  endin = i*16-1;
  temp = temp + int2str(endin) + ":";
  temp = temp + int2str(start) + ']}};';
  str = str + temp + newline;
end
str