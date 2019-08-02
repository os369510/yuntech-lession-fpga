`timescale 1ns / 100 ps

module adder_8bit_tb1;
  
  reg [7:0] a;
  reg [7:0] b;
  
  wire [8:0] out;
  
  adder_8bit inst1(.a(a),
                   .b(b),
                   .out(out)
                   );
  
  initial
  begin
    #0 a=8'b01101100;
       b=8'b01010010;
    #10 a=8'b11101101;
        b=8'b01110010;
    #10 a=8'b10101111;
        b=8'b01010010;
    #10 a=8'b11111101;
        b=8'b01000010;
    #10 $finish;
  end
  
  initial
  $monitor("a=%d,b=%d,out=%d",a,b,out);
  
endmodule
    