class generator;
  Transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    trans=new();
    repeat(5)
      begin
        trans.randomize();
       
        gen2drv.put(trans);
         trans.display("Generator class signal");
        #3;
      end
  endtask
endclass
