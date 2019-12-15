// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module tb_J();
  wire [7:0] count;
  wire [7:0] data;
  reg clk, rst, request_in;
  wire write_out;
  slidingwindow SW(
    .count(count),.data(data),.clk(clk),.rst(rst),.request_in(request_in),.write_out(write_out));
  
  initial
  begin
    clk = 1'b0;
    rst = 1'b0;
    request_in = 1'b0;
    #300 rst = 1'b1;
``  #100 rst = 1'b0;
    #50000 request_in = 1'b1;
    #300 request_in = 1'b0;
  end
  
  always #50 clk <= !clk;
endmodule