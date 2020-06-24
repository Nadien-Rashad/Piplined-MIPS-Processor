
module ALUcontrol(control,ALUop,func);
input [1:0]ALUop;
input [5:0]func;
output reg [3:0]control;

always @(ALUop or func)
begin
if(ALUop==2'b10 && func==6'b100000)//add
begin
control <= 4'b0010;
end

else if(ALUop==2'b10 && func==6'b100100)//and
begin
control <= 4'b0000;
end

else if(ALUop==2'b10 && func==6'b101010)//slt
begin
control <= 4'b0111;
end

else if(ALUop==2'b10 && func==6'b100101)//or
begin
control <= 4'b0001;
end

else if(ALUop==2'b10 && func==6'b000000)//sll
begin
control <= 4'b0100;
end



else if(ALUop==2'b00)//lw,sw,addi,ori
begin
control <= 4'b0010;
end


else if(ALUop==2'b01)//beq
begin
control <= 4'b0110;
end


end
endmodule
