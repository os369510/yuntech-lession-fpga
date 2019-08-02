module BCD_adder(A,B,Cin,Result,Cout);
  
  input [3:0] A,B;
  input Cin;
  output [3:0] Result;
  output Cout;
  
  assign Cout = (A+B+Cin)>10? 1:0 ;
  assign Result = (A+B+Cin)>10? (A+B+Cin)%10:(A+B+Cin);
  
endmodule