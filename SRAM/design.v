module sram(
  output reg [7:0]dout,
  input [7:0]din,
  input wen,
  input [3:0]addr,
  input clk,
  input rst);
  reg [7:0]mem[0:15];
  always@(posedge clk)begin
    if(!rst)
      dout=8'd0;
    else begin
      if(wen)
        mem[addr]=din;
     else
        dout<=mem[addr];
    end
  end
endmodule
