`timescale 1ns / 100ps

module BCD_adder_test;

//input
reg [3:0] A;       
reg [3:0] B;
reg Cin;        

//output
wire [3:0] Result;
wire Cout;

BCD_adder B1(.A(A), 
             .B(B), 
             .Cin(Cin), 
             .Result(Result), 
             .Cout(Cout));

initial
begin
  #0   A=4'd7;
       B=4'd8;
       Cin=1'b0;
  #10  A=4'd9;
       B=4'd9;
       Cin=1'b0;       
  #10  A=4'd1;
       B=4'd6;
       Cin=1'b0;
  #10  A=4'd5;
       B=4'd4;
       Cin=1'b0;
  #10  $finish;
end

initial
$monitor ("A=%d B=%d Cin=%d Cout=%d Result", A, B, Cin, Cout, Result);

endmodule 
