class monitor;
  mailbox mon2scb;
  virtual intf vif;
  transaction trans;
 
  function new(mailbox mon2scb, virtual intf vif);
    this.mon2scb=mon2scb;
    this.vif=vif;
  endfunction
 
  task main();
      repeat(20) begin
      trans=new();
 
      @(posedge vif.clk);
       #1;
       trans.wr_en=vif.wr_en;
       trans.rd_en=vif.rd_en;
       trans.din=vif.din;
       trans.rst=vif.rst;
       trans.full=vif.full;
       trans.empty=vif.empty;
       trans.dout=vif.dout;
       trans.display("Monitor class signals(dout previous cycle)");
       mon2scb.put(trans);
    end
  endtask
 
endclass
