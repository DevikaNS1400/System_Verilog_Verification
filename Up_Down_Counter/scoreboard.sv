class scoreboard;
  transaction trans;
  mailbox mon2scb;
  event trigr;
  bit [3:0] prev_count;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
 
  task main();
    trans=new();
    repeat(50)
    begin
      mon2scb.get(trans);
      trans.display("Score board signals");
      if((trans.rst==0)&&(trans.count==0))
        $display("Counter is in reset");
      else if(trans.up_down)begin
        if(trans.count<=prev_count+1)
          $display("Counting up passed");
        else
          $display("Counting up failed");
      end
 
      else begin
        if(trans.count<=prev_count-1)
          $display("Counting down passed");
        else
          $display("Counting down failed");
      end
 
      prev_count=trans.count;
 
    ->trigr;
    end
         endtask
endclass

