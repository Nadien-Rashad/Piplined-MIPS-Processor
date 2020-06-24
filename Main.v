module MIPS_pipelineHl(input clock);

wire [31:0] signext_2, pc_1, pc_2, pc_3,pc_4, instruction_1, instruction_2, ALUResult_4, Result_WB_5, 
ALUResult_3; 

wire [31:0] mux2_out2, reg2_2, val1_2, val2_mux2, ST_value_3, val1_3, val2_3, reg2_3, 
 ST_value_4, read_data_4, read_data_5, ALUresult_5, reg_3,alu_result_muxes,ALUResult_4_out,pcout_in,ST_value_3_out;

wire [15:0] imm_2;
wire [6:0] mux4_out;
wire [5:0] func_2, op_2,func_3;
wire [4:0] src1_2, src2_2, src1__out2, src1_3,src2_3, dest_3, dest_4, dest_5, src2_mux1_2; 
wire [4:0] dest_2,exe_dest_3,dest_2_out,dest_3_out,dest_4_out;  
wire [1:0] ALU_OP_3, ALU_OP_2; 
wire  hazard_detected_signal, br_taken_3, br_taken_2, flush,flush_2;
wire  MEM_W_EN_4, MEM_R_EN_4, WB_EN_4, WB_EN_5, MEM_R_EN_3; 
wire  MEM_W_EN_3, MemtoReg_3,   WB_EN_3,MEM_WB_EN_4, MEM_R_EN_5,MEM_R_EN_4_out; 


  

IF_stage IF_stage1(instruction_1,flush,flush_2,br_taken_2,signext_2,clock);
clockgen c1(clock);

IF_ID_register IF_ID_register1( br_taken_3,clock,flush,flush_2,pc_1,instruction_1, pc_2,instruction_2);


ID_stage  ID_stage1(clk, ALU_OP_2,src1__out2,src2_mux1_2,mux4_out,val2_mux2,val1_2,reg2_2,flush,flush_2,br_taken_2,
clock, exe_dest_3, MEM_R_EN_3, Result_WB_5,WB_EN_5,dest_5,dest_2_out,instruction_2,func_2);



ID_EXE_register ID_EXE_regis1(flush_2,clock,pc_3, pc_2, mux4_out, dest_2_out, reg2_2, val1_2, val2_mux2, br_taken_2, src1__out2, src2_mux1_2,
 dest_3, ST_value_3, val1_3, val2_3, MEM_R_EN_3, MEM_W_EN_3, MemtoReg_3,  ALU_OP_3, WB_EN_3,
 br_taken_3, src1_3, src2_3,exe_dest_3,func_3,func_2);



 EXE_stage EXE_stage1(clock, WB_EN_4,WB_EN_5, ALU_OP_3, func_3,src1_3,src2_3,dest_3,dest_4,dest_5,val1_3, val2_3, 
alu_result_muxes, Result_WB_5, ST_value_3,
ALUResult_3, ST_value_3_out,src2_3,MemtoReg_3,MEM_W_EN_3,MEM_R_EN_3,dest_3_out);




EXE_MEM_register  EXE_Mem_register1(clock, WB_EN_3, MEM_R_EN_3, MEM_W_EN_3, pc_3, ALUResult_3,
 ST_value_3_out, dest_3_out,WB_EN_4, MEM_R_EN_4, MEM_W_EN_4, pc_4, ALUResult_4,  ST_value_4
, dest_4);

Memory_stage  Mem_stage1(dest_4, MEM_W_EN_4, ST_value_4, MEM_R_EN_4, read_data_4, ALUResult_4,dest_4_out,alu_result_muxes,ALUResult_4_out,MEM_R_EN_4_out);
MEM_WB_Register   Mem_WB_register1(clock,WB_EN_4,MEM_R_EN_4_out,read_data_4,ALUResult_4_out,dest_4_out,WB_EN_5,MEM_R_EN_5,read_data_5,ALUresult_5,dest_5);

WB_stage  WB_stage1(read_data_5,ALUresult_5,MEM_R_EN_5,Result_WB_5);

endmodule 
