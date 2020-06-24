module MEM_WB_Register(clk,WB_EN,MEM_R_EN,read_data,ALUresult,Dest,WB_EN_out,MEM_R_EN_out,read_data_out,ALUresult_out,Dest_out);
input WB_EN,MEM_R_EN,clk;
input [31:0] read_data,ALUresult;
input [4:0] Dest;
output reg WB_EN_out,MEM_R_EN_out;
output reg[31:0] read_data_out,ALUresult_out;
output reg [4:0] Dest_out;

always @ (posedge clk)
begin

WB_EN_out <= WB_EN;
MEM_R_EN_out <= MEM_R_EN;
read_data_out <= read_data;
ALUresult_out<= ALUresult;
Dest_out <= Dest;
end

endmodule
