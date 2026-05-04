class transaction;
  bit rst;
  rand bit up_down;
  bit [3:0]count;
 
  function void display(string name);
    $display("---------%s--------",name);
    $display("Time=%0t rst=%0b,up_down=%0b,count=%0d",$time,rst,up_down,count);
  endfunction
endclass
