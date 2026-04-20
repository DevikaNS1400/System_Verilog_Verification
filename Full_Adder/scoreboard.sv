class scoreboard;
  Transaction trans;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    trans=new();
    repeat(5)
    begin
      mon2scb.get(trans);
      trans.display("Score board signals");
      if(((trans.a^trans.b^trans.c)==trans.sum)&&(((trans.a& trans.b)|(trans.b& trans.c)|(trans.c&trans.a))==trans.carry))
         
         $display("Pass");
         else
           $display("Fail");
         end
         endtask
endclass
         
