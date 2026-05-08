module up_down_counter(
  input rst,clk,up_down,
  output reg [3:0]count);
  always@(posedge clk)begin
    if(!rst)
      count<=1'b0;
    else if(up_down)
      count<=count+1'b1;
    else
      count<=count-1'b1;
  end
endmodule
