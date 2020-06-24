module mux_32bit(z,x,y,sel); // mux32bit  implementation
input [31:0] x,y;
input sel;
output reg[31:0] z;
always@(x,y,sel)
begin
assign z = (sel==0)? x : (sel==1)? y : 32'bx;
end
endmodule


module mux_32bit_with4(out,in1,sel); // mux32bit  implementation
input [31:0] in1;
input sel;
output reg[31:0] out;
always@(in1,sel)
begin
 out = (sel==1)? in1 : (sel==0)? 32'd1 : 32'bx;
end
endmodule
