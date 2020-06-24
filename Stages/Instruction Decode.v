module ID_stage(clk,alu_op_out,src1_out,m1_out,m4_out,m2_out,reg1_out,reg2_out,if_flush_out,if_flush_out_2,br_taken_out
,clk,exe_dest_in,mem_r_en_in, result_wb_in,wb_en_in, wr_dest_in,m5_out,instructionIn,func_out);

 reg [4:0] dest_in,src1_in,src2_in;
 reg [5:0]  op_in;
 reg [5:0] func_in;
 reg [15:0] imm_in;
 

input [31:0] result_wb_in,instructionIn;
input [4:0]  wr_dest_in, exe_dest_in;
input clk,mem_r_en_in,wb_en_in;

output  br_taken_out;
output   if_flush_out,if_flush_out_2;
output [31:0] reg1_out,reg2_out;
output [31:0] m2_out;
output [4:0] m1_out;  
output [6:0] m4_out;
output reg [4:0] src1_out;//,dest_out; 
output reg [1:0] alu_op_out;
output reg [5:0] func_out;


wire [31:0] sign_extend_out;
wire [4:0]m3_out;
output [4:0]m5_out;
wire is_br,out1,is_imm,hz_out,hz_out_2;
wire [6:0] cl;
wire exe_cmd_out = cl;

initial
 begin
  assign   op_in = instructionIn [31:26] ;
  assign  src1_in =instructionIn [25:21]  ;
  assign  src1_out =instructionIn [25:21]  ;
  assign src2_in = instructionIn[20:16] ;
  assign imm_in = instructionIn[15:0];
  assign func_in = instructionIn [5:0] ;
  assign func_out = instructionIn [5:0] ;
  assign dest_in = instructionIn [15:11];
  end
  
  
regfile  regfile1 (clock,src1_in,m3_out, reg1_out,reg2_out,wr_dest_in,result_wb_in,wb_en_in);

condition_checker checker1(out1, reg1_out,reg2_out);

control_unit control_unit1(clk,if_flush_out,if_flush_out_2,is_imm, cl,op_in,func_in,RegDst,is_br,hz_out,hz_out_2);

mux_5bit m5(m5_out,dest_in,src2_in,is_imm);

Hazard_Detection  detector1(hz_out,hz_out_2,src1_in,m3_out,exe_dest_in,is_br,mem_r_en_in);

mux_5bit m3(m3_out,src2_in,dest_in,RegDst);

mux_5bit_with0 m1(m1_out,src2_in,is_imm);

mux_32bit m2(m2_out,reg2_out,sign_extend_out,exe_cmd_out);

mux_7bit_with0 m4 (m4_out,cl,hz_out);

sign_extend sign1(sign_extend_out,imm_in);

AND and1 (br_taken_out,is_br,out1);



endmodule
