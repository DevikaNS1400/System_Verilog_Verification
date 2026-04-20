module full_adder(sum,carry,a,b,c);
  output sum,carry;
  input a,b,c;
  assign sum=a^b^c;
  assign carry=(a&b)|(b&c)|(a&c);
endmodule
