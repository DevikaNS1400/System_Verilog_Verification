class generator;
  transaction trans;
  mailbox gen2drv;
  event ended;
 
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
 
  task main();
      repeat(5)
      begin
        trans=new();
        void'(trans.randomize());
        gen2drv.put(trans);
        trans.display("Generator class signals");
        @ended;
      end
  endtask
endclass
