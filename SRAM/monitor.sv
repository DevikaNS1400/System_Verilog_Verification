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
      @(posedge vif.clk);
      trans.rst=vif.rst;
      trans.din=vif.din;
      trans.dout=vif.dout;
      trans.wen=vif.wen;
      trans.addr=vif.addr;
      mon2scb.put(trans);
      trans.display("Monitor class signals");
    end
  endtask
endclass
