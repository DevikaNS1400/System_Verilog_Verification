class driver;
   virtual intf vif;
  transaction trans;
  mailbox gen2drv;
 
  function new(virtual intf vif,mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
 
 
  task main();
    repeat(5)
      begin
        trans=new();
        gen2drv.get(trans);
        trans.display("driver class signals");
        vif.wen<=trans.wen;
        vif.din<=trans.din;
        vif.addr<=trans.addr;
        @(posedge vif.clk);
      end
  endtask
  endclass
