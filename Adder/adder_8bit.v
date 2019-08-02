module adder_8bit(a,b,out);
  
  input [7:0] a,b;
  output [8:0] out;
  
  assign out=a+b;
  
endmodule