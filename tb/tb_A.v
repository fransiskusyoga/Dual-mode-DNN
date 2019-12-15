//tb_A : testing decoder.v

module tb_A();
  reg en;
  reg [5:0] in;
  wire [63:0] out;
  decode6to64 DE6t64_0(en,in,out);
  
  initial begin
    #200 en = 1'b1;
    in = 6'd1;
    #100 in = 6'd10;
    #100 in = 6'd33;
    #100 in = 6'd62;
    #100 en = 1'b0;
  end

endmodule;