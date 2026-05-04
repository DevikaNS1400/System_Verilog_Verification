class driver;
  virtual intf vif;
  transaction trans;
  mailbox gen2drv;
 
  function new(virtual intf vif,mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
 
  task main();
    trans=new();
    repeat(50)
      begin
 
        gen2drv.get(trans);
        trans.display("driver class signals");
        vif.up_down=trans.up_down;
        @(posedge vif.clk);
      end
  endtask
endclass
