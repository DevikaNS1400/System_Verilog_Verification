module dff(
  output reg q,
  input clk,rst,d);
 
  always@(posedge clk)begin
    if(!rst)
         q<=1'b0;
     else
         q<=d;
  end
endmodule
