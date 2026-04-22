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
         vif.d<=trans.d;
        @(posedge vif.clk);       
        
      end
  endtask
endclass
