class driver;
  virtual intf vif;
  Transaction trans;
  mailbox gen2drv;
  
  function new(virtual intf vif,mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();  
    trans=new();
    repeat(5)
      begin
        #1;
        gen2drv.get(trans);
        vif.a=trans.a;
        vif.b=trans.b;
        vif.c=trans.c;
        trans.display("driver class signals");
        #2;
      end
  endtask
endclass
