module mux_5bit_with0(out,in1,sel);
input [4:0] in1;
input sel;
output reg[4:0] out;
always@(in1,sel)
begin
assign out = (sel==0)? in1 : (sel==1)? 5'b0 : 5'bx;
end
endmodule

