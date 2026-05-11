module sync_fifo #(parameter DEPTH=8, DATA_WIDTH=8)(
  output reg [DATA_WIDTH-1:0]dout,
  output full,
  output empty,
  input clk,
  input rst,
  input wr_en,
  input rd_en,
  input [DATA_WIDTH-1:0]din);
 
  reg [$clog2(DEPTH):0]wr_ptr='b0;
  reg [$clog2(DEPTH):0]rd_ptr='b0;
  reg [DATA_WIDTH-1:0]fifo[0:DEPTH-1];
  wire wrap_bit;
 
  always@(posedge clk)begin
 
    if(rst) begin
      dout<=0;
      wr_ptr<=0;
      rd_ptr<=0;
    end
 
    else begin
      if(wr_en && !full)begin
        fifo[wr_ptr[$clog2(DEPTH)-1:0]]<=din;
        wr_ptr<=wr_ptr+1'b1;
      end
 
      if(rd_en && !empty)begin
        dout<=fifo[rd_ptr[$clog2(DEPTH)-1:0]];
        rd_ptr<=rd_ptr+1'b1;
      end
 
    end
  end
 
  assign wrap_bit=wr_ptr[$clog2(DEPTH)]^rd_ptr[$clog2(DEPTH)];
  assign full=wrap_bit&(wr_ptr[$clog2(DEPTH)-1:0]==rd_ptr[$clog2(DEPTH)-1:0]);
  assign empty=(wr_ptr==rd_ptr);
endmodule
