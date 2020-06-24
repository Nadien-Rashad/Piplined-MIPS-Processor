
module WB_stage(read_data,ALUresult,MEM_R_EN,Result_WB);

input [31:0] read_data,ALUresult;
input MEM_R_EN;
output [31:0] Result_WB;


mux_32bit mux_32(Result_WB,ALUresult,read_data,MEM_R_EN);


endmodule
