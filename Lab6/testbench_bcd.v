module bcd_tb();
  reg [3:0] tb_A;
  reg [3:0] tb_B;
  reg tb_cin;
  wire [3:0] tb_sum;
  wire tb_cout;
  reg [7:0] tb_E=8'b00000000;
  wire [2:0] tb_F;
  reg clk;
  initial clk = 0; 
  always #10 clk = ~clk;
  
  reg [31:0] tb_mem [0:13];
   lab6_2circuits bcd_ins(.A(tb_A),.B(tb_B),.cin(tb_cin),.sum(tb_sum),.cout(tb_cout),.E(tb_E),.F(tb_F),.clock(clk));
  initial
    begin
      $readmemh("configure_bcd_adder.mem",tb_mem); 
      
      bcd_ins.ins1.mem[31:0]=tb_mem[0];
      bcd_ins.ins1.mem[32]=tb_mem[1];
      bcd_ins.ins2.mem[31:0]=tb_mem[2];
      bcd_ins.ins2.mem[32]=tb_mem[3];
      
      bcd_ins.ins3.mem[31:0]=tb_mem[0];
      bcd_ins.ins3.mem[32]=tb_mem[1];
      bcd_ins.ins4.mem[31:0]=tb_mem[2];
      bcd_ins.ins4.mem[32]=tb_mem[3];
      
      bcd_ins.ins5.mem[31:0]=tb_mem[0];
      bcd_ins.ins5.mem[32]=tb_mem[1];
      bcd_ins.ins6.mem[31:0]=tb_mem[2];
      bcd_ins.ins6.mem[32]=tb_mem[3];
      
      bcd_ins.ins7.mem[31:0]=tb_mem[0];
      bcd_ins.ins7.mem[32]=tb_mem[1];
      bcd_ins.ins8.mem[31:0]=tb_mem[2];
      bcd_ins.ins8.mem[32]=tb_mem[3];
      
      
      
      bcd_ins.ins9.mem[31:0]=tb_mem[4];
      bcd_ins.ins9.mem[32]=tb_mem[5];
      bcd_ins.ins10.mem[31:0]=tb_mem[6];
      bcd_ins.ins10.mem[32]=tb_mem[7];
      bcd_ins.ins11.mem[31:0]=tb_mem[8];
      bcd_ins.ins11.mem[32]=tb_mem[9];
      bcd_ins.ins12.mem[31:0]=tb_mem[10];
      bcd_ins.ins12.mem[32]=tb_mem[11];
      bcd_ins.ins13.mem[31:0]=tb_mem[12];
      bcd_ins.ins13.mem[32]=tb_mem[13];
      
      tb_A=4'b0101; tb_B=4'b0001; tb_cin=1'b0;
      
      
      #20
      $display("BCD adder::  A= %b ,B= %b ,cin= %b, sum= %b ,cout=%b",tb_A,tb_B,tb_cin,tb_sum,tb_cout);
      
      tb_A=4'b0101; tb_B=4'b0001; tb_cin=1;
      #20
      $display("BCD adder::  A= %b ,B= %b ,cin= %b, sum= %b ,cout=%b",tb_A,tb_B,tb_cin,tb_sum,tb_cout);
      
      tb_A=4'b0111; tb_B=4'b0001; tb_cin=1;
      #20
      $display("BCD adder::  A= %b ,B= %b ,cin= %b, sum= %b ,cout=%b",tb_A,tb_B,tb_cin,tb_sum,tb_cout);
      tb_A=4'b1111; tb_B=4'b0001; tb_cin=1;
      #20
      $display("BCD adder::  A= %b ,B= %b ,cin= %b, sum= %b ,cout=%b",tb_A,tb_B,tb_cin,tb_sum,tb_cout);
      
      
      
      
      
    end
  
  initial 
      #1000 $finish;
  
  	initial
    begin
      $dumpfile("2019csb1100_bcd.vcd");
      $dumpvars;
      
    end 
  
  

endmodule