module full_adder(sum, cout, a, b, cin);
  input a,b,cin;
  output sum,cout;
  wire d,e,f;

  xor #4 U1(sum,a,b,cin);
  
  and #1U2(d,a,b);
  
  and #1U3(e,b,cin);
  
  and #1U4(f,a,cin);
 
  or #2U5(cout,d,e,f);
 
  
endmodule

module add16_rc(sum16, cout, a16, b16, cin);
  input [15:0]a16, b16;
  output [15:0] sum16;
  input cin;
  output cout;
  wire z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15;
  full_adder U6(sum16[0], z1, a16[0], b16[0], cin);
  full_adder U7(sum16[1], z2, a16[1], b16[1], z1);
  full_adder U8(sum16[2], z3, a16[2], b16[2], z2);
  full_adder U9(sum16[3], z4, a16[3], b16[3], z3);
  full_adder U10(sum16[4], z5, a16[4], b16[4], z4);
  full_adder U11(sum16[5], z6, a16[5], b16[5], z5);
  full_adder U12(sum16[6], z7, a16[6], b16[6], z6);
  full_adder U13(sum16[7], z8, a16[7], b16[7], z7);
  full_adder U14(sum16[8], z9, a16[8], b16[8], z8);
  full_adder U15(sum16[9], z10, a16[9], b16[9], z9);
  full_adder U16(sum16[10], z11, a16[10], b16[10], z10);
  full_adder U17(sum16[11], z12, a16[11], b16[11], z11);
  full_adder U18(sum16[12], z13, a16[12], b16[12], z12);
  full_adder U19(sum16[13], z14, a16[13], b16[13], z13);
  full_adder U20(sum16[14], z15, a16[14], b16[14], z14);
  full_adder U21(sum16[15], cout, a16[15], b16[15], z15);
    
endmodule

module full_adder_pg(p,g, a, b);
  input a,b;
  output p,g;
  
  or #1 U6(p,a,b);
  and #1 U7(g,a,b);
 		
  
endmodule


module carry_generator(couts, p, g, cin);
  input cin;
  input [3:0] p,g;
  output [3:0] couts;
  wire s1,s2,s3,s4;
  
  and #1Y1(s1,p[0],cin);
  
  or #1Y2(couts[0],s1,g[0]);
  
  and #1Y3(s2,p[1],couts[0]);
  
  or #1Y4(couts[1],s2,g[1]);
  
  and #1Y5(s3,p[2],couts[1]);
  
  or #1Y6(couts[2],s3,g[2]);
  
  and #1Y7(s4,p[3],couts[2]);
  
  or #1Y8(couts[3],s4,g[3]);
  
	  
endmodule

module add4_cla(sum4, cout, a4, b4, cin);
  input[3:0] a4,b4;
  output[3:0] sum4;
  input cin;
  output cout;
  wire[3:0] p,g,couts;
  wire t1,t2,t3,t4,t5,t6,t7,t8;
 
  full_adder_pg J1(p[0],g[0], a4[0], b4[0]);
  full_adder_pg J2(p[1],g[1], a4[1], b4[1]);
  full_adder_pg J3(p[2],g[2], a4[2], b4[2]);
  full_adder_pg J4(p[3],g[3], a4[3], b4[3]);
  carry_generator tyu(couts,p,g,cin);
  
  full_adder J5(sum4[0], t5, a4[0], b4[0], cin);
  full_adder J6(sum4[1], t6, a4[1], b4[1], couts[0]);
  full_adder J7(sum4[2], t7, a4[2], b4[2], couts[1]);
  full_adder J8(sum4[3], t8, a4[3], b4[3], couts[2]);
  assign cout=couts[3];
  
endmodule



module add16_cla(sum16, cout, a16, b16, cin);
  input[15:0] a16, b16;
  output[15:0] sum16;
  output cout;
  input cin;
  wire e1,e2,e3;
  
  add4_cla bla1(sum16[3:0], e1, a16[3:0], b16[3:0], cin);
  add4_cla bla2(sum16[7:4], e2, a16[7:4], b16[7:4], e1);
  add4_cla bla3(sum16[11:8], e3, a16[11:8], b16[11:8], e2);
  add4_cla bla4(sum16[15:12], cout, a16[15:12], b16[15:12], e3);
 
endmodule
