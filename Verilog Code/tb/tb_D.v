//tb_D : testing shiftregout.v
module tb_D();
  parameter B =24;
  parameter N = 40; //number of dsp unit (perceptron)
  parameter k =N*B-1;
  reg [k:0] in;
  wire [k:0] outs;
  wire [B-1:0] out1,out2;
  reg [5:0] addr1,addr2;
  reg mode,rst,clk;

  shiftregout #(B) SHREGOUT(
    .ins(in),.in({B{1'b0}}),.outs(outs),.out1(out1),.out2(out2),
    .addr1(addr1),.addr2(addr2),.mode(mode),
    .rst(rst),.clk(clk));
  
  initial begin
  //In initial value
    in[23:0] = 24'd100;
    in[47:24] = 24'd200;
    in[71:48] = 24'd300;
    in[95:72] = 24'd400;
    in[119:96] = 24'd500;
    in[143:120] = 24'd600;
    in[167:144] = 24'd700;
    in[191:168] = 24'd800;
    in[215:192] = 24'd900;
    in[239:216] = 24'd1000;
    in[263:240] = 24'd1100;
    in[287:264] = 24'd1200;
    in[311:288] = 24'd1300;
    in[335:312] = 24'd1400;
    in[359:336] = 24'd1500;
    in[383:360] = 24'd1600;
    in[407:384] = 24'd1700;
    in[431:408] = 24'd1800;
    in[455:432] = 24'd1900;
    in[479:456] = 24'd2000;
    in[503:480] = 24'd2100;
    in[527:504] = 24'd2200;
    in[551:528] = 24'd2300;
    in[575:552] = 24'd2400;
    in[599:576] = 24'd2500;
    in[623:600] = 24'd2600;
    in[647:624] = 24'd2700;
    in[671:648] = 24'd2800;
    in[695:672] = 24'd2900;
    in[719:696] = 24'd3000;
    in[743:720] = 24'd3100;
    in[767:744] = 24'd3200;
    in[791:768] = 24'd3300;
    in[815:792] = 24'd3400;
    in[839:816] = 24'd3500;
    in[863:840] = 24'd3600;
    in[887:864] = 24'd3700;
    in[911:888] = 24'd3800;
    in[935:912] = 24'd3900;
    in[959:936] = 24'd4000;
    
    clk = 1'b0;
    rst = 1'b0;
    mode = 1'b0;
    addr1 = 6'd35; addr2 = 6'd44;
    
    #300 rst = 1'b1;
    #100 rst = 1'b0;
    
    #100 addr1 = 6'd35; addr2 = 6'd44;
    #100 addr1 = 6'd36; addr2 = 6'd43;
    #100 addr1 = 6'd37; addr2 = 6'd42;
    #100 addr1 = 6'd38; addr2 = 6'd41;
    #100 addr1 = 6'd39; addr2 = 6'd40;
    #100 addr1 = 6'd40; addr2 = 6'd39;
    #100 addr1 = 6'd41; addr2 = 6'd38;
    #100 addr1 = 6'd42; addr2 = 6'd37;
    #100 addr1 = 6'd43; addr2 = 6'd36;
    #100 addr1 = 6'd44; addr2 = 6'd35;
  end
  
  always #50 clk = ~clk;
  
endmodule
