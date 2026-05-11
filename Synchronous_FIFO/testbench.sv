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
 
interface.sv
interface intf #(parameter DEPTH=8, DATA_WIDTH=8)();
  logic clk;
  logic rst;
  logic wr_en;
  logic rd_en;
  logic [DATA_WIDTH-1:0]din;
  logic [DATA_WIDTH-1:0]dout;
  logic full;
  logic empty;
 
endinterface

transaction.sv
class transaction #(parameter DEPTH=8, DATA_WIDTH=8);
  bit[DATA_WIDTH-1:0]dout;
  bit full;
  bit empty;
  bit rst;
  rand bit wr_en;
  rand bit rd_en;
  rand bit[DATA_WIDTH-1:0]din;
 
  constraint c1{
    wr_en dist {1:=60, 0:=40};
    rd_en dist {1:=40, 0:=60};
  }
 
  constraint c2{
    !(wr_en&&rd_en);
  }
 
  function void display(string name);
    $display("---------%s--------",name);
    $display("Time=%0t rst=%0b,dout=%0d,din=%0d,full=%0h,empty=%0h, wr_en=%0b,rd_en=%0b",$time,rst,dout,din,full,empty,wr_en,rd_en);
  endfunction
 
endclass
