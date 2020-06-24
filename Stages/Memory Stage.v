module Memory_stage(dest_in,MEM_W_EN_4,ST_value_4,MEM_R_EN_4,read_data_4,ALU_result_4,dest_out,alu_res_muxes,Alu_res_out,MEM_R_EN_4_out);

input MEM_W_EN_4, MEM_R_EN_4;
input [31:0] ST_value_4,ALU_result_4 ;

output[31:0] read_data_4;
output reg [31:0] alu_res_muxes,Alu_res_out;
output [4:0] dest_in;
output reg[4:0] dest_out;
output reg MEM_R_EN_4_out;

always@(*)
begin
assign dest_out=dest_in;
assign alu_res_muxes=ALU_result_4;
assign Alu_res_out=ALU_result_4;
MEM_R_EN_4_out=MEM_R_EN_4;
end

Data_Memory Data_mem(ALU_result_4,ST_value_4,read_data_4,MEM_W_EN_4,MEM_R_EN_4);

endmodule
