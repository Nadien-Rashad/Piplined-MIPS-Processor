module mux_32bit(z,x,y,sel); // mux32bit  implementation
input [31:0] x,y;
input sel;
output reg[31:0] z;
always@(x,y,sel)
begin
assign z = (sel==0)? x : (sel==1)? y : 32'bx;
end
endmodule
