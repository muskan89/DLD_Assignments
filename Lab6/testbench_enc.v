// Code your testbench here
// or browse Examples
module enc_tb();
  reg [3:0] tb_A=4'b0000;
  reg [3:0] tb_B=4'b0000;
  reg tb_cin=1'b0;
  wire [3:0] tb_sum=4'b0000;
  wire tb_cout=4'b0000;
  reg [7:0] tb_E;
  wire [2:0] tb_F;
  reg clk;
  initial clk = 0; 
  always #10 clk = ~clk;
  
  reg [31:0] tb_mem [0:2];
   lab6_2circuits enc_ins(.A(tb_A),.B(tb_B),.cin(tb_cin),.sum(tb_sum),.cout(tb_cout),.E(tb_E),.F(tb_F),.clock(clk));
  initial
    begin
      $readmemh("configure8_to_3encoder.mem",tb_mem);
      enc_ins.inst1.mem[31:0]=tb_mem[0];
      enc_ins.inst1.mem[32]=tb_mem[1];
      enc_ins.inst2.mem[31:0]=tb_mem[0];
      enc_ins.inst2.mem[32]=tb_mem[1];
      
      enc_ins.inst3.mem[31:0]=tb_mem[0];
      enc_ins.inst3.mem[32]=tb_mem[1];
      
      
      tb_E=8'b00010000;
      
      #20
      $display("8 to 3 encoder::  E= %b ,F= %b",tb_E,tb_F);
      
      tb_E=8'b00001000;
      
      #20
      $display("8 to 3 encoder::  E= %b ,F= %b",tb_E,tb_F);
      
      tb_E=8'b00000010;
      
      #20
      $display("8 to 3 encoder::  E= %b ,F= %b",tb_E,tb_F);
      
      tb_E=8'b00000001;
      
      #20
      $display("8 to 3 encoder::  E= %b ,F= %b",tb_E,tb_F);
      
      
      
      
      
      
    end
  
  initial 
      #1000 $finish;
  
  	initial
    begin
      $dumpfile("2019csb1100_enc.vcd");
      $dumpvars;
      
    end 
  
  

endmodule