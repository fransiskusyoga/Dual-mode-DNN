module slidingwindow(
  count,data,write_out,clk,rst,request_in);
  output [7:0] count;
  output [7:0] data;
  output write_out;
  input clk,rst,request_in;
  
  reg [6:0] y,x;
  wire [3:0] y_offset,x_offset;
  wire [6:0] column, row;
  wire [13:0] addr;
  
  wire [7:0] count_SC;
  
  reg delay_req;
  wire trig ;
  
  always @(posedge clk)
  begin
    if(rst)
    begin
      y<= 7'b0;
      x<= 7'b0;
    end
    else
    begin
      if(trig)
      begin
        if(x==7'd85)
        begin
          x <= 7'd0;
          if (y==7'd106) y<= 7'd106;
          else y <= y+1;
        end
        else x <= x+1;
      end
    end
  end
  
  always @(posedge clk)
  begin
    if (rst) delay_req = 1'b0;
    else delay_req = request_in;
  end
  assign trig = ~delay_req && request_in;
  
  slidecounter SC(
    .count_column(x_offset),.count_row(y_offset),
    .count(count_SC),.clk(clk),.rst(rst|trig));
  
  xy2addr XY2A(
    .column(column),.row(row),.addr(addr));
  
  buffer#(8) BUF(
    .in(count_SC),.out(count),.rst(rst),.clk(clk));
  
  ram_photo RAMP(.address_a(addr),.address_b(14'b0),
    .clock(clk),.data_a(8'b0),.data_b(8'b0),
    .wren_a(1'b0),.wren_b(1'b0),
    .q_a(data),.q_b());
  
  assign write_out = (count<8'd225);
  
  assign column = x + x_offset;
  assign row = y + y_offset; 
endmodule