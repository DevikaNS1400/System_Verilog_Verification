class monitor;
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    
    repeat(5)begin
      trans=new();
      //  #2; 
      @(posedge vif.clk);
        trans.rst=vif.rst;
        trans.d=vif.d;
        trans.q=vif.q;
        mon2scb.put(trans);
        trans.display("Monitor class signal");
        #1;
      end
  endtask
endclass
