class monitor;
  Transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    trans=new();
    repeat(5)begin      
        #2;       
        trans.a=vif.a;
        trans.b=vif.b;
        trans.c=vif.c;
        trans.sum=vif.sum;
        trans.carry=vif.carry;
        
        mon2scb.put(trans);
        trans.display("Monitor class signal");
        #1;
      end
  endtask
endclass
