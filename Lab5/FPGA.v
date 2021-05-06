module logic_tile(out, clock, in1, in2, in3, in4, in5);
	input clock, in1, in2, in3, in4, in5 ;
  output out;
  reg [32:0] mem;
  reg  q, qbar;
  wire d;
  initial
      begin
      q=1'b0;
      end

  assign d=mem[{in5,in4,in3,in2,in1}];
  
  	
	always@(posedge clock) 
	begin
      q <= d; 
      qbar = !d; 
	end
	

  assign out=(q & mem[32])|(d & ~mem[32]);


endmodule


module switch_box_4x4(out, in);
  input [3:0] in;
  output [3:0] out;
  reg [15:0] configure;
  
  assign out[0] =  ((configure[0]&in[0]) | (in[1] & configure[1]) | (configure[2] & in[2]) | (in[3] & configure[3])); 
  assign out[1] =  ((configure[4]&in[0]) | (in[1] & configure[5]) | (configure[6] & in[2]) | (in[3] & configure[7]));
  assign out[2] =  ((configure[8]&in[0]) | (in[1] & configure[9]) | (configure[10] & in[2]) | (in[3] & configure[11]));
  assign out[3] =  ((configure[12]&in[0]) | (in[1] & configure[13]) | (configure[14] & in[2]) | (in[3] & configure[15]));
  
endmodule

module BCD_adder(A,B,cin,sum,cout,clk);
  input clk;
  input [3:0] A;
  input [3:0] B;
  input cin;
  output [3:0] sum;
  output cout;
  wire [3:0] SUM;
  wire cout0,cout1,cout2,cout3,cout4;
  
  
  logic_tile ins1(.out(SUM[0]), .clock(clk), .in1(cin), .in2(B[0]), .in3(A[0]),.in4(1'b0), .in5(1'b0));
  logic_tile ins2(.out(cout0), .clock(clk), .in1(cin), .in2(B[0]), .in3(A[0]),.in4(1'b0), .in5(1'b0));
  
  
  logic_tile ins3(.out(SUM[1]), .clock(clk), .in1(cout0), .in2(B[1]), .in3(A[1]),.in4(1'b0), .in5(1'b0));
  logic_tile ins4(.out(cout1), .clock(clk), .in1(cout0), .in2(B[1]), .in3(A[1]),.in4(1'b0), .in5(1'b0));
  
 
  logic_tile ins5(.out(SUM[2]), .clock(clk), .in1(cout1), .in2(B[2]), .in3(A[2]),.in4(1'b0), .in5(1'b0));
  logic_tile ins6(.out(cout2), .clock(clk), .in1(cout1), .in2(B[2]), .in3(A[2]),.in4(1'b0), .in5(1'b0));
  
  
  logic_tile ins7(.out(SUM[3]), .clock(clk), .in1(cout2), .in2(B[3]), .in3(A[3]),.in4(1'b0), .in5(1'b0));
  logic_tile ins8(.out(cout3), .clock(clk), .in1(cout2), .in2(B[3]),  .in3(A[3]) ,.in4(1'b0), .in5(1'b0));
   
  
  logic_tile ins9(.out(cout), .clock(clk), .in1(SUM[0]),.in2(SUM[1]), .in3(SUM[2]), .in4(SUM[3]), .in5(cout3));
  
  logic_tile ins10(.out(sum[0]), .clock(clk), .in1(SUM[0]),.in2(SUM[1]), .in3(SUM[2]), .in4(SUM[3]), .in5(cout3));
  
  logic_tile ins11(.out(sum[1]), .clock(clk), .in1(SUM[0]),.in2(SUM[1]), .in3(SUM[2]), .in4(SUM[3]), .in5(cout3));
  
  logic_tile ins12(.out(sum[2]), .clock(clk), .in1(SUM[0]),.in2(SUM[1]), .in3(SUM[2]), .in4(SUM[3]), .in5(cout3));
  
  logic_tile ins13(.out(sum[3]), .clock(clk), .in1(SUM[0]),.in2(SUM[1]), .in3(SUM[2]), .in4(SUM[3]), .in5(cout3));
  
  
endmodule