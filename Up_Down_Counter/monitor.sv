class monitor;
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
 
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
 
  task main();
    trans=new();
    repeat(50)begin
 
      #2;
      @(posedge vif.clk);
        trans.rst=vif.rst;
        trans.up_down=vif.up_down;
        trans.count=vif.count;
        mon2scb.put(trans);
        trans.display("Monitor class signal");
      //  #1;
      end
  endtask
endclass
