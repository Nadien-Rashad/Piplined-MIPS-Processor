module EXE_stage (clk,MEM_WB_EN,WB_EN_5, ALUop,func,src1_3,src2_3,dest_3,dest_4,dest_5,val1, val2, 
ALU_res_MEM, result_WB, ST_value_in, ALUResult, ST_value_out,src2_3out,memtoreg_3,mem_w_en_3,mem_r_en_3,dest_out);

  input clk,MEM_WB_EN,WB_EN_5;
  input [1:0] ALUop; 
  input [5:0] func; 
  input [4:0] src1_3,src2_3,dest_3,dest_4,dest_5;
  input [31:0] val1, val2,ST_value_in, ALU_res_MEM, result_WB;
  
  output [31:0] ALUResult, ST_value_out;
  output [4:0] src2_3out ;
  output reg [4:0] dest_out;
  output memtoreg_3,mem_w_en_3,mem_r_en_3;


  wire [31:0] ALU_val1, ALU_val2; //inputs of the ALU after MUX
  wire [1:0] val1_sel, val2_sel, ST_val_sel; //selectors out of the fwd 
  wire [3:0]control;
  
  

MUX_4x1 MUX1(ALU_val1,val1,ALU_res_MEM,result_WB, val1_sel); 

MUX_4x1 MUX2(ALU_val2,val2,ALU_res_MEM,result_WB, val2_sel);

MUX_4x1 MUX3(ST_value_out,ST_value_in,ALU_res_MEM,result_WB, ST_val_sel);


ALU  EXE_ALU(ALUResult, ALU_val1, ALU_val2, control);
ALUcontrol   EXE_ALUcontrol(control,ALUop,func); 
Forwarding_Unit Forwading_U(src1_3, src2_3, dest_3, dest_4,dest_5, MEM_WB_EN, WB_EN_5, val1_sel, val2_sel, ST_val_sel);
 
always@(posedge clk)
begin
assign dest_out=dest_3;
end

endmodule
