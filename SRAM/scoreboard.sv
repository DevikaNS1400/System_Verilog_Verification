class scoreboard;
  transaction trans;
  mailbox mon2scb;
  event trigr;
  bit [7:0]rf_mem[0:15];
 
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
 
  task main();
    repeat(5)
      begin
        trans=new();
        mon2scb.get(trans);
        $display("Scoreboard signals");
        if(!trans.rst)
          continue;
        else begin
          if(trans.wen) begin
            rf_mem[trans.addr]=trans.din;
            $display("Write pass Time=%0d addr=%0h,din=%0h",$time,trans.addr,trans.din);
          end
          else begin
            if(trans.dout==rf_mem[trans.addr])
              $display("Read pass Time=%0d addr=%0h,dout=%0h",$time,trans.addr,trans.dout);
            else
              $display("Read fail at Time=%0d",$time);
          end
        end
        ->trigr;
      end
  endtask
endclass
