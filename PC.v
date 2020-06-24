
module PC(current_pc, next_pc,hazard_detected_signal,hazard_detected_signal_2,clk);
input [31:0] next_pc;
input clk,hazard_detected_signal,hazard_detected_signal_2;
output reg[31:0] current_pc;
initial
begin
current_pc <= 0;
end
always @ (posedge clk)
begin
if((!hazard_detected_signal) && (!hazard_detected_signal_2))
current_pc <=  next_pc;
end
endmodule
