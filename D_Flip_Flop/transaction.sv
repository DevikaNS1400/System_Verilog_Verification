class transaction;
  bit rst;
  rand bit d;
  bit q;
  
  function void display(string name);
    $display("---------%s--------",name);
    $display("Time=%0t rst=%0b,d=%0b,q=%0b",$time,rst,d,q);
  endfunction
endclass
