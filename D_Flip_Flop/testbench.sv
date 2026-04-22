`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
   
  dff u1(.clk(intff.clk),.rst(intff.rst),.d(intff.d),
                .q(intff.q));
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
