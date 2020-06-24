module ID_EXE_register (flushh,clk,PC,PCIn ,m4_out_in, destIn, reg2In, val1In, val2In, brTaken_in, src1_in, src2_in,
 dest,   ST_value,   val1,   val2,  MEM_R_EN,    MEM_W_EN,  MemtoReg,  ALU_OP,    WB_EN, brTaken_out, src1_out, src2_out,dest_33,func,func_in);
  input clk,flushh;
  reg MEM_R_EN_IN, MEM_W_EN_IN, WB_EN_IN, EXE_CMD_IN,MemtoReg_In;
  input  brTaken_in;
  input [4:0] destIn, src1_in, src2_in;
  input [6:0] m4_out_in;
  reg [1:0] ALU_OP_In;
  input [31:0] reg2In, val1In, val2In, PCIn;
  input [5:0] func_in;
  output reg [31:0] PC;
  output reg MEM_R_EN, MEM_W_EN, WB_EN, brTaken_out,MemtoReg;
  
  output reg [4:0] dest, dest_33, src1_out, src2_out;
  output reg [1:0] ALU_OP;
  output reg [31:0] ST_value, val1, val2;
  output reg [5:0] func;

always@(m4_out_in)
begin
assign {MEM_W_EN_IN, MEM_R_EN_IN, MemtoReg_In, WB_EN_IN, ALU_OP_In, EXE_CMD_IN}=m4_out_in;
end

  always @ (posedge clk) 
     begin
if (flushh)
begin
      MEM_R_EN <= 0;
      MEM_W_EN <= 0;
      WB_EN <= 0;
      dest <= 0;
      ST_value <= 0;
      val1 <= 0;
      val2 <= 0;
      PC <= PCIn;
      brTaken_out <= 0;
      src1_out <= 0;
      src2_out <= 0;
      MemtoReg <=0;
      ALU_OP <=0;
      dest_33<=0;
      func<=0;
end
else
begin
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      WB_EN <= WB_EN_IN;
      dest <= destIn;
      ST_value <= reg2In;
      val1 <= val1In;
      val2 <= val2In;
      PC <= PCIn;
      brTaken_out <= brTaken_in;
      src1_out <= src1_in;
      src2_out <= src2_in;
      MemtoReg <=MemtoReg_In;
      ALU_OP <=ALU_OP_In;
      dest_33<=destIn;
      func<=func_in;
  
  end
end
endmodule 
