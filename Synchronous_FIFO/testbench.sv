`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
 
  sync_fifo u1(.clk(intff.clk),.rst(intff.rst),.wr_en(intff.wr_en),.rd_en(intff.rd_en),.dout(intff.dout),.din(intff.din),.full(intff.full),.empty(intff.empty));
 
 initial begin
   intff.clk=1'b0;
   intff.rst=1'b1;#2;
   //repeat(2) @(posedge intff.clk);
   intff.rst=1'b0;
   #5;
 end
  always #5 intff.clk=~intff.clk;
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #500;
    $finish;
  end
endmodule
 


