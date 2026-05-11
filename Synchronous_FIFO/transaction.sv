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
