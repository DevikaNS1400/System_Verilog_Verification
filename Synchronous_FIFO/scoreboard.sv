class scoreboard #(parameter DEPTH=8, DATA_WIDTH=8);
 
  transaction trans;
  mailbox mon2scb;
 
  event trigr;
 
  bit [DATA_WIDTH-1:0]que[$];
  bit [DATA_WIDTH-1:0]exptd;
 
  int count=0;
 
  bit compare_valid=0;
 
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
 
  task main();
      //for write
    repeat(20) begin
      trans=new();
      mon2scb.get(trans);
      #0;
       //compare previous read
 
      $display("-------Scoreboard signals(previous cycle)-------");
      $display("Time=%0t empty=%0d, full=%0d,dout=%0d,wr_en=%0d,rd_en=%0d",$time, trans.empty,trans.full,trans.dout,trans.wr_en,trans.rd_en);
      if(compare_valid)begin
        if(exptd==trans.dout)
           $display("--Scoreboard PASS,dout=%0d,expected_data=%0d--",trans.dout,exptd);
        else
          $display("----Scoreboard FAIL,dout=%0d,expected_data=%0d--",trans.dout,exptd);
        compare_valid=0;
      end
      //for reset
      if(trans.rst) begin
        que.delete();
        count=0;
      end
 
      //OVERFLOW CHECK
      if(trans.wr_en && trans.full)begin
        $error("FIFO OVerflow at time %0t",$time);
      end
 
      //for write
         if(trans.wr_en  && !trans.rst)begin
           if(count < DEPTH)begin
             que.push_back(trans.din);
             count=count+1;
           end
          end
 
      //UNDERFLOW CHECK
       if(trans.rd_en && trans.empty)begin
        $error("FIFO underflow at time %0t",$time);
      end
 
      //for read
       if(trans.rd_en && !trans.rst)begin
        if(que.size()>0)begin
          exptd=que.pop_front();
          count=count-1;
          compare_valid=1;
        end
        else
          exptd=0;
 
      end
      $display("Que =%p",que);
      ->trigr;
    end
  endtask
endclass
