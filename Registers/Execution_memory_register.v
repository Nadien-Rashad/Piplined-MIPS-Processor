module EXE_MEM_register(clk, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN, PCIn, ALUResIn,
 STValIn, destIn,WB_EN, MEM_R_EN, MEM_W_EN, PC, ALURes, STVal, deest);
  input clk;
  
  // TO BE REGISTERED FOR ID STAGE
  input WB_EN_IN;  //RegWrite
  input MEM_R_EN_IN; //MemRead 
  input MEM_W_EN_IN;  //MemWrite
  input [4:0] destIn;  //write register
  input [31:0] PCIn, ALUResIn, STValIn;
  
  // REGISTERED VALUES FOR ID STAGE
  output reg WB_EN; //RegWrite
  output reg MEM_R_EN; //MemRead 
  output reg MEM_W_EN;  //MemWrite
  output reg [4:0] deest; //write register
  output reg [31:0] PC, ALURes, STVal;

  always @ (posedge clk) 
  begin
    
      WB_EN <= WB_EN_IN;
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      PC <= PCIn;
      ALURes <= ALUResIn;
      STVal <= STValIn;
      deest <= destIn;
    end
 
endmodule 
