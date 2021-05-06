module xor2(out, in1, in2);
  input in1 , in2;
  output out;
  wire abnot;
  wire anotb;
  wire bnot;
  wire anot;
  not U1(anot,in1);
  not U2(bnot,in2);
  and U3(abnot,in1,bnot);
  and U4(anotb,anot,in2);
  or U5(out,abnot,anotb);
endmodule  

module xor3(out, in1, in2, in3);
  input in1, in2, in3;
  output out;
  wire a;
  xor2 V1(a,in1,in2);
  xor2 V2(out,a,in3);
endmodule
  
module xor3_b(out, in1, in2, in3);
  input in1,in2,in3;
  output out;
  assign out = (((in1)&(!in2)&(!in3))|((!in1)&(in2)&(!in3))|((!in1)&(!in2)&(in3))|((in1)&(in2)&(in3))); 
endmodule
  