module MUX_4x1(z,x,y,q,sel); // mux32bit  implementation MUX(4*1)
input [31:0] x,y,q;
input [1:0]sel;
output reg[31:0] z;
always@(x,y,q,sel)
begin
assign z = (sel==2'b00)? x : (sel==2'b01)? y : (sel==2'b10)? q:  32'bx ;
end
endmodule
