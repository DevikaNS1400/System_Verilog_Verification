`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
 
 up_down_counter u1(.clk(intff.clk),.rst(intff.rst),.up_down(intff.up_down),.count(intff.count));
  initial begin
    intff.clk=1'b0;
    intff.rst=1'b0;
    #10;
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
