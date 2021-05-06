// Code your testbench here
// or browse Examples
module xor_tb();
  reg ri1,ri2,ri3;
  wire out1,out2;
  xor3 hx(.out(out1), .in1(ri1), .in2(ri2), .in3(ri3));
  xor3_b hxb(.out(out2), .in1(ri1), .in2(ri2), .in3(ri3));
  
  initial
    begin
      ri1 = 1'b0; ri2 = 1'b0; ri3 = 1'b0;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b0; ri2 = 1'b0; ri3 = 1'b1;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b0; ri2 = 1'b1; ri3 = 1'b0;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b0; ri2 = 1'b1; ri3 = 1'b1;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b1; ri2 = 1'b0; ri3 = 1'b0;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b1; ri2 = 1'b0; ri3 = 1'b1;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b1; ri2 = 1'b1; ri3 = 1'b0;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
      
      ri1 = 1'b1; ri2 = 1'b1; ri3 = 1'b1;
      #10
      $display("in1 : %b, in2 : %b, in3: %b, output_for_xor3: %b, output_for_xor3_b: %b",ri1,ri2,ri3,out1,out2);
    end
  initial
    begin
      $dumpfile("2019csb1100_dumpfile.vcd");
      $dumpvars;
    end
  
endmodule
 
  
 
  
  
  
  
  

