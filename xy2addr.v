module xy2addr(
  column,row,addr);
  input [6:0] column,row;
  output [13:0] addr;
  assign addr = row*7'd100+ column;
endmodule