module mux_7bit_with0(out,in1,sel); // mux32bit  implementation
input [6:0] in1;
input sel;
output reg[6:0] out;
always@(in1,sel)
begin
assign out = (sel==0)? in1 : (sel==1)? 7'b0 : 7'bx;
end
endmodule

