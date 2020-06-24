module IF_stage(inst,hazard_detected_signal,hazard_detected_signal_2,br_taken,offset,clk);

input[31:0] offset;
output [31:0] inst;
input hazard_detected_signal,br_taken,hazard_detected_signal_2;
wire [31:0] mux_out,pc_in,pc_out;
input clk;
mux_32bit_with4 mux1(mux_out,offset,br_taken);
add add1(pc_in, mux_out,pc_out);
PC pc1(pc_out,pc_in,hazard_detected_signal,hazard_detected_signal_2,clk);
instmem inst1(pc_out,inst,clk);

endmodule 
