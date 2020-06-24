
module ALU(result, in1, in2, op);
output reg [31:0] result;
input signed  [31:0] in1, in2;
input [3:0] op;
always @ (in1 or in2 or op)
begin 
case(op)
4'b0110 : result <= in1 - in2;
4'b0010 : result <= in1 + in2;  //add
4'b0000 : result <= in1 & in2;  //and
4'b0111 : result <= (in1<in2? 1:0 );  //slt
4'b0001 : result <= in1 | in2;  //or
4'b0100 : result <= (in1 <<2);   //sll
4'b1100 : result <= ~(in1 | in2);  //nor
4'b0010 : result <=  in1 + in2;  //ori,addi,lw,sw
4'b0110 : result <= in1 - in2;


endcase
end 
endmodule 



