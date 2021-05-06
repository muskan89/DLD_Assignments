module rc_tb();
  reg[15:0] ra16,rb16;
  reg rcin;
  wire wcout,w1cout;
  wire[15:0] wsum16,w1sum16;
  
  add16_rc rc_ins(.sum16(wsum16), .cout(wcout), .a16(ra16), .b16(rb16), .cin(rcin));
  add16_cla cla_ins(.sum16(w1sum16), .cout(w1cout), .a16(ra16), .b16(rb16), .cin(rcin));
  
  initial
    begin
      ra16=16'b1111111111111111; rb16=16'b0000000010001000; rcin=1'b0;
      #50
      $display("a16: %b,b16: %b,sum16_ripple carry adder: %b, sum16_cla: %b",ra16,rb16,wsum16,w1sum16);
      
      ra16=16'b1001111111111111; rb16=16'b1000000010001000;rcin=1'b0;
      #50
      $display("a16: %b,b16: %b,sum16_ripple carry adder: %b, sum16_cla: %b",ra16,rb16,wsum16,w1sum16);
      
      ra16=16'b1111001111111111; rb16=16'b1000000010001000;rcin=1'b0;
      #50
      $display("a16: %b,b16: %b,sum16_ripple carry adder: %b, sum16_cla: %b",ra16,rb16,wsum16,w1sum16);
      
      ra16=16'b1111111111100111; rb16=16'b1000000010001000;rcin=1'b0;
      #50
      $display("a16: %b,b16: %b,sum16_ripple carry adder: %b, sum16_cla: %b",ra16,rb16,wsum16,w1sum16);
      
    end
  initial
    begin
      $dumpfile("2019csb1100.vcd");
      $dumpvars;
      
    end
 
endmodule
