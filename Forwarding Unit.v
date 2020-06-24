module Forwarding_Unit(src1_EXE, src2_EXE, ST_src_EXE, dest_MEM, dest_WB, WB_EN_MEM, WB_EN_WB, val1_sel, val2_sel, ST_val_sel);

  input [4:0] src1_EXE, src2_EXE, ST_src_EXE;
  input [4:0] dest_MEM, dest_WB;
  input WB_EN_MEM, WB_EN_WB;
  
  output reg [1:0] val1_sel, val2_sel, ST_val_sel
  
     initial
     begin
      val1_sel<= 0;
      val2_sel<= 0;
      ST_val_sel <= 0;
     end 
     
  always @ ( * ) begin

    // determining forwarding control signal for store value (ST_val)
    if (WB_EN_MEM && ST_src_EXE == dest_MEM) ST_val_sel <= 2'd1;
    else if (WB_EN_WB && ST_src_EXE == dest_WB) ST_val_sel <= 2'd2;
     else ST_val_sel <= 0;

    // determining forwarding control signal for ALU val1
    if (WB_EN_MEM && src1_EXE == dest_MEM) val1_sel <= 2'd1;
    else if (WB_EN_WB && src1_EXE == dest_WB) val1_sel = 2;
     else val1_sel<= 0;

    // determining forwarding control signal for ALU val2
    if (WB_EN_MEM && src2_EXE == dest_MEM) val2_sel <= 2'd1;
    else if (WB_EN_WB && src2_EXE == dest_WB) val2_sel <= 2;
      else val2_sel<= 0;
  end
  
endmodule 
