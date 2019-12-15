module holdsignal(
         start,stop,out,rst,clk);
  input start,stop,rst,clk;
  output reg out = 1'b0;
  
  always @(posedge clk)
  begin
    out <= (out || start) && !(stop || rst);
  end
endmodule