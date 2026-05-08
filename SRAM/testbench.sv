`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
 
  sram u1(.clk(intff.clk),.rst(intff.rst),.wen(intff.wen),.dout(intff.dout),.din(intff.din),.addr(intff.addr));
 
  initial begin
    intff.clk=1'b0;
    intff.rst=1'b0;
    #5;
    intff.rst=1'b1;
  end
  always #5 intff.clk=~intff.clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #500;
    $finish;
  end
endmodule
