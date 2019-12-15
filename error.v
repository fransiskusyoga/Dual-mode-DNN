module error(
          in,data,rdaddr,wraddr,out,
          cost,clear,stop,wren, rst,clk);
  input signed [15:0] in, data;
  input [1:0] rdaddr,wraddr;
  output signed [15:0] out;
  output reg signed [23:0] cost;
  input clear, stop, wren, rst, clk;
  
  reg [15:0] mem [3:0];
  wire signed [31:0] mul;
  
  always @(posedge clk)
  begin
    if (rst)
    begin
      mem[2'd0] <= 16'h1600;
      mem[2'd1] <= 16'h0A80;
      mem[2'd2] <= 16'h0680;
      mem[2'd3] <= 16'h0;
    end
    else if (wren) mem[wraddr] <= data;
    if (rst || clear) cost <= 24'd0;
    else if (!stop) cost <= cost + {{2{mul[31]}},mul[31:10]};
  end
  
  assign out = mem[rdaddr] - in;
  assign mul = out*out;
endmodule