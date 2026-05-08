class transaction;
  bit[7:0] dout;
  bit rst;
  bit [3:0]addr;
  rand bit[7:0] din;
  rand bit wen;
   function void display(string name);
    $display("---------%s--------",name);
     $display("Time=%0t rst=%0b,dout=%0h,din=%0h,addr=%0h wen=%0b",$time,rst,dout,din,addr,wen);
  endfunction
endclass
