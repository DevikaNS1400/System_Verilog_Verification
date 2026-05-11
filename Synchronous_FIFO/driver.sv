class driver;
  transaction trans;
  mailbox gen2drv;
  virtual intf vif;
 
  function new(mailbox gen2drv,virtual intf vif);
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction
 
  task main();
    bit full_d;
    repeat(20)begin
      trans=new();
      gen2drv.get(trans);
      @(posedge vif.clk);
      full_d=vif.full;
      vif.wr_en<=trans.wr_en & !full_d;
      vif.rd_en<=trans.rd_en & !vif.empty;
      vif.din<=trans.din;
 
 
      trans.display("Driver class signals");//#1;
     end
  endtask
endclass
