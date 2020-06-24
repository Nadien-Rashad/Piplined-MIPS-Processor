module IF_ID_register (br_taken,clk,flush,flush_2,PCIn,instructionIn,PC,instruction);
input clk, flush,flush_2,br_taken;
input [31:0] PCIn, instructionIn;
output reg [31:0] PC, instruction;


  always @ (posedge clk) begin 
        if (flush || br_taken) begin
          instruction <= 0;
        
        end
        else if (flush_2) begin
          instruction <= instruction;
       
        end
        else begin
          instruction <= instructionIn;
          PC <= PCIn;
        end
  end

endmodule
