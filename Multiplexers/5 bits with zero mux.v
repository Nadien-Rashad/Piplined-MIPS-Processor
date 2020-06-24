module mux_5bit(out,in1,in2,sel);
input [4:0] in1,in2;
input sel;
output reg[4:0] out;
always@(in1,in2,sel)
begin
assign out = (sel==0)? in1 : (sel==1)? in2 : 5'bx;
end
endmodule

