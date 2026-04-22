class scoreboard;
  transaction trans;
  mailbox mon2scb;
  event trigr;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
     
    repeat(5)
    begin
     trans=new();
      mon2scb.get(trans);
      trans.display("Score board signals");
      if(((trans.rst==1'b0)&&(trans.q==1'b0))||       ((trans.rst==1'b1)&&(trans.q==trans.d)))
         
        $display("Pass");
         else
           $display("Fail");
      ->trigr;
         end
         endtask
endclass 
