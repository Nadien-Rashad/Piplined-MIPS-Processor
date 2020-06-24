module add (z,x,y);
output reg[31:0] z;
input [31:0] x,y;
initial
begin
assign z=x+y;
end
endmodule


module shift_left_beq( offset_4 , input1);
input [31:0] input1;
output reg[31:0] offset_4;
always@(input1)
begin
assign offset_4 = {input1 << 2};
end
endmodule


module AND(out,in1,in2);
input in1,in2;
output reg out;
initial
begin
assign out=in1&in2;
end
endmodule


module condition_checker(OUT, IN1, IN2);
output OUT;
input [31:0] IN1, IN2;
wire x1;
xor XOR1(x1, IN1, IN2);
not NOT (OUT, x1);
endmodule                                                        


module sign_extend(out,A); //implementing sign extension component
output reg[31:0]out;
input [15:0] A;
always@(A)
begin
assign out={{16{A[15]}},A};  //repeating  msb of address A 16 times & connecting it with A
end
endmodule

 







