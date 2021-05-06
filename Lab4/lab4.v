// Code your design here
module logic_tile(out, clock, in1, in2, in3, in4, in5);
	input clock, in1, in2, in3, in4, in5 ;
  output out;
  reg [32:0] mem;
  reg  q, qbar;
  wire d;

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