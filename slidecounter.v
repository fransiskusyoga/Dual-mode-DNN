module slidecounter(
  count_column,count_row,count,clk,rst);
  output reg [3:0] count_column, count_row;
  output reg [7:0] count;
  input clk,rst;
  
  always @(posedge clk)
  begin
    if(rst)
    begin
      count_column <= 4'b0;
      count_row <= 4'b0;
      count <= 8'b0;
    end
    
    else
    begin    
      if (count_column == 4'd14)
      begin
        count_column <= 4'b0;
        if (count_row == 4'd14) count_row <= 4'b0;
        else count_row <= count_row + 1;
      end
      else count_column <= count_column + 1;
      
      if (count == 8'd225) count <= 8'd225;
      else count <= count + 1;      
    end
  end
  
endmodule