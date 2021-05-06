// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module bcd_tb();
  reg [3:0] tb_A, tb_B;
  reg tb_cin;
  wire [3:0] tb_sum;
  wire tb_cout;
  
  reg [19:0] tb_mem [0:6];
  BCD_adder bcd_ins(.A(tb_A),.B(tb_B),.cin(tb_cin),.sum(tb_sum),.cout(tb_cout));
  initial
    begin
      $readmemh("lut.mem",tb_mem); 
      bcd_ins.ins1.mem[7:0]=tb_mem[0];
      bcd_ins.ins2.mem[7:0]=tb_mem[1];
      
      bcd_ins.ins3.mem[7:0]=tb_mem[0];
      bcd_ins.ins4.mem[7:0]=tb_mem[1];
      
      bcd_ins.ins5.mem[7:0]=tb_mem[0];
      bcd_ins.ins6.mem[7:0]=tb_mem[1];
      
      bcd_ins.ins7.mem[7:0]=tb_mem[0];
      bcd_ins.ins8.mem[7:0]=tb_mem[1];
      
      bcd_ins.ins9.mem[19:0]=tb_mem[2];
      bcd_ins.ins10.mem[19:0]=tb_mem[3];
      bcd_ins.ins11.mem[19:0]=tb_mem[4];
      bcd_ins.ins12.mem[19:0]=tb_mem[5];
      bcd_ins.ins13.mem[19:0]=tb_mem[6];
      #10
      tb_A=4'b1001; tb_B=4'b1011; tb_cin=0;
      $display("BCD adder::  A= %b ,B= %b ,cin= %b, sum= %b ,cout=%b",tb_A,tb_B,tb_cin,tb_sum,tb_cout);
      
    end
  
  initial 
      #100 $finish;
  
  	initial
    begin
      $dumpfile("2019csb1100.vcd");
      $dumpvars;
      
    end 
  
  

endmodule