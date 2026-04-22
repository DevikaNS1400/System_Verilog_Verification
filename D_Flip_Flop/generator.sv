class generator;
  transaction trans;
  mailbox gen2drv;
  event ended;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
     trans=new();
     repeat(5)
       begin
            trans=new();
           if (!trans.randomize())
              $fatal("Randomization failed");
          gen2drv.put(trans);
          trans.display("Generator class signal");  
         @ended;
       end    
  endtask
endclass

