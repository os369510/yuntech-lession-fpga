module newspaper(rst, clk, coin, paper_out, give_change);
  
  input rst, clk; 
  input [1:0] coin;
  
  output paper_out; 
  output give_change; 
  
  reg paper_out;
  reg give_change;
  
  reg [1:0] State,NextState;
  reg [2:0] total;
  reg [5:0] holdsignal=6'd0;
  reg hold;
  
  parameter S0=2'b00,S1=2'b01,
            S2=2'b10,S3=2'b11;
    
  always @(posedge clk or
           posedge rst)
  begin
    if(rst)
      begin
        total=3'b000;
        paper_out=0;
        give_change=0;
        State=S0;
      end
    else
      State=NextState;
      if(State==S3)
        begin
          if(holdsignal>=6'd20)
            begin
              hold=1;
              holdsignal=0;
            end
          else
            begin
              holdsignal=holdsignal+6'd1;
              hold=0;
            end
        end
  end
  
  always @(State or coin or hold)
  begin
    case(State)
      S0:begin
        if(coin==2'b00)
          NextState=S1;
          else
          NextState=S0;
        end
      S1:begin
        if(coin>2'b00)
          NextState=S2;
        else if(total>=3'b011)
          NextState=S3;
        else
          NextState=S1;
        end
      S2:begin
        if(coin==2'b00)
          NextState=S1;
        else
          NextState=S2;
        end
      S3:begin
        if(hold==1)
          NextState=S0; 
        else
          NextState=S3;         
        end
    endcase
    //$display("Now State = %d , NextState = %d , coin = %d , holdsignal = %d",State,NextState,coin,holdsignal);  
  end
    
  always @(State)
  begin
    case(State)
      S0:begin
        total=0;
        paper_out=0;
        give_change=0;
      end
      S1:begin
        paper_out=0;
        give_change=0;
      end
      S2:begin
        total=total+coin;
        paper_out=0;
        give_change=0;
      end
      S3:begin
        paper_out=1;
        if(total>=3'b100)
          give_change=1;
        else
          give_change=0;          
      end
    endcase
  end        
  
endmodule