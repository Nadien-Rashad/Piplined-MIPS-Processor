
module Hazard_Detection(HZ_out,HZ_2, IF_rs,IF_rt,EX_rt,branch,MemRead);

  input [4:0] IF_rs,IF_rt,EX_rt;
  input branch,MemRead;
  
  output reg HZ_out,HZ_2;
  
  initial 
    begin 
      HZ_out=0;
      HZ_2=0;
    end
  always @(*)
  begin
      if (MemRead && ((IF_rs ==EX_rt) ||(IF_rt ==EX_rt)))
        begin 
          HZ_2 <= 1'b1;
        end
      else if (branch)
        begin
          HZ_out <= 1'b1;
        end
      else
        begin
          HZ_out <= 1'b0;
          HZ_2<= 1'b0;
         end
  end


endmodule 
