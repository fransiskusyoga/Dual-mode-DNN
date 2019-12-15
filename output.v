module output_module(
        in, addr, wren, out0, out1, out2,
        rst, clk);
   input [15:0] in;
   input [1:0] addr;
   output reg [15:0] out0, out1, out2;
   input rst, wren, clk;
   
   always @(posedge clk)
   begin
     if (rst)
     begin
       out0 <= 16'd0;
       out1 <= 16'd0;
       out2 <= 16'd0;
     end       
     else if (wren)
     begin
       if(addr == 2'd0) out0 <= in;
       if(addr == 2'd1) out1 <= in;
       if(addr == 2'd2) out2 <= in;
     end
   end
endmodule